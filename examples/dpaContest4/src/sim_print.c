void printHex(unsigned char byte){
	outSimatorPort = '0';
	outSimatorPort = 'x';
	if((byte >>4)<10 ){
		outSimatorPort = (byte>>4)+'0';
	}else{
		outSimatorPort = (byte>>4)-10+'a';
	}
	
	if((byte & 0xF)<10 ){
		outSimatorPort = (byte& 0xF)+'0';
	}else{
		outSimatorPort = (byte& 0xF)-10+'a';
	}
}
