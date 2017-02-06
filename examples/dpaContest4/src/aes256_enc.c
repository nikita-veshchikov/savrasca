/* aes256_enc.c */


#include "aes.h"
#include "aes_enc.h"
#include <avr/pgmspace.h>


/*  This is the AES RSM 256 encryption function that call the generic AES RSM encryption core*/
void aes256_enc(uint8_t* offset, void* buffer, aes256_ctx_t* ctx){
	aes_encrypt_core(offset, buffer, (aes_genctx_t*)ctx, 14);
}


/*This is the AES RSM 256 sequencer that initialize and launches the encryption
 *It output the cyphertext on the serial output  */
/*Inputs : 	v 		: Pointer to first byte of the plaintext buffer
 *			k 		: Pointer to first byte of the key
 *			offset	: Pointer to the output of the random offset
 *
 *  */
void aes_cenc(uint8_t *v, uint8_t *k,uint8_t *offset) {
	aes256_ctx_t ctx;
	//uint8_t i = 0;
	//uint8_t tmp=offset[0]; // tmp and i is not used
	//Initialization

	aes256_init(k, &ctx);

	//Encryption
	aes256_enc(offset, v, &ctx);

}



