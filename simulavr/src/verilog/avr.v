/*
 * Copyright (C) 2007 Onno Kortmann <onno@gmx.net>
 *                    Klaus Rudolph <lts-rudolph@gmx.de>
 *  
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *  
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *  
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA..
 *  
 */

/* SimulavrXX glue code on the verilog side. */

/*
* Attention: Multiple assignment to a single wire with different strength will
* work only with up to date iverilog versions. Don't use any version below
* v10!
*/

/*
* FIXME: There are still open issues:
* simulavr itself runs a calculation on the connected nets on every pin.
* To fix that topic a new type of "pin" must be created ( verilog_pin ) which
* can be added to a simulavr "net". In the moment the simulation works
* only if simulavr drives only in to verilog and no other connected pins
* to a net inside the simulator itself. Adding multiple assignments in
* verilog works as expected.
*/

module avr_pin(conn);
   parameter name="UNSPECIFIED";
   inout conn;
   wire  out_value;
   wire  is_pulling;
   
   integer val;
   
   wire    output_active;
   assign  output_active = (val<=2);
   
   assign                  conn = output_active ? out_value : 1'bz;
   assign  ( pull1, pull0) conn = is_pulling ? out_value : 1'bz;

   function avr2verilog;
      input [4:0] apin;
      begin
      if (apin==0) // low
	avr2verilog=1'b0;
      else if (apin==1) // high
	avr2verilog=1'b1;
      else if (apin==2) // shorted
	avr2verilog=1'bx;
      else if (apin==3) // pull-up
	avr2verilog=1'b1;
      else if (apin==4) // tristate
	avr2verilog=1'bz;
      else if (apin==5) // pull-down ?? AVR Pin?
	avr2verilog=1'b0;
      else if (apin==6) // analog
	avr2verilog=1'bx;
      else if (apin==7) // analog, shorted
	avr2verilog=1'bx;

   end

   endfunction // avr2verilog

   function avr_port_is_pulling_only;
       input [4:0] apin;
       begin
       if ( apin==3 ) // pull up
           avr_port_is_pulling_only=1'b1;
       else if ( apin==5 ) // pull down ( not used in avr core pins )
           avr_port_is_pulling_only=1'b1;
       else 
           avr_port_is_pulling_only=1'b0;

   end
   endfunction // avr_port_is_pulling_only
       

   function verilog2avr;
      input vpin;
      if (vpin==1'bz)
	verilog2avr=4; // tristate
      else if (vpin==1'bx)
	verilog2avr=2; // approximate as shorted
      else if (vpin==1)
	verilog2avr=1; // high
      else if (vpin==0)
	verilog2avr=0; // low
   endfunction // verilog2avr

   assign is_pulling=avr_port_is_pulling_only(val);
   assign out_value=avr2verilog(val);

   always @(posedge core.clk) begin
      val<=$avr_get_pin(core.handle, name);
      $avr_set_pin(core.handle, name, verilog2avr(conn));
   end
   
endmodule // avr_pin

module avr_clock(clk);
   output clk;
   reg 	  clk;
   parameter FREQ=4_000_000;
   initial begin
      clk<=0;
   end
   
   always @(clk) begin
      #(1_000_000_000/FREQ/2) clk<=~clk; //125000 -> 4MHz clock
   end   
endmodule // avr_clock
    
module AVRCORE(clk);
   parameter progfile="UNSPECIFIED";
   parameter name="UNSPECIFIED";
   input     clk;

   integer   handle;
   integer   PCw; // word-wise PC as it comes from simulavrxx
   wire [16:0] PCb;  // byte-wise PC as used in output from avr-objdump!
   assign  PCb=2*PCw;
   
   initial begin
      $display("Creating an AVR device.");
      handle=$avr_create(name, progfile);
      //$avr_reset(handle);
   end

   always @(posedge clk) begin
      $avr_set_time($time);
      $avr_tick(handle);      
      PCw=$avr_get_pc(handle);
   end
   
endmodule // AVRCORE

