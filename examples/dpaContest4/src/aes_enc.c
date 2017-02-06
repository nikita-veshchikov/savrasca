/* aes_enc.c */
/**
 * \file     aes_enc.c
 * \date     2013-02-30
 */

#include <stdint.h>
#include <string.h>
#include "aes.h"
#include "gf256mul.h"
#include "aes_sbox.h"
#include "aes_enc.h"
#include <avr/pgmspace.h>

void aes_shiftcol(void* data, uint8_t shift){
	
	uint8_t tmp[4];
	tmp[0] = ((uint8_t*)data)[ 0];
	tmp[1] = ((uint8_t*)data)[ 4];
	tmp[2] = ((uint8_t*)data)[ 8];
	tmp[3] = ((uint8_t*)data)[12];
	((uint8_t*)data)[ 0] = tmp[(shift+0)&3];
	((uint8_t*)data)[ 4] = tmp[(shift+1)&3];
	((uint8_t*)data)[ 8] = tmp[(shift+2)&3];
	((uint8_t*)data)[12] = tmp[(shift+3)&3];
}

#define GF256MUL_1(a) (a)
#define GF256MUL_2(a) (gf256mul(2, (a), 0x1b))
#define GF256MUL_3(a) (gf256mul(3, (a), 0x1b))


// Generic round of AES RSM
static
void aes_enc_round(uint8_t* offset, aes_cipher_state_t* state, const aes_roundkey_t* k){
	uint8_t tmp[16], t, i;
    int idx;

    // Order  of the execution of the Sboxes
    uint8_t dummy_idx[]={0,2,4,6,8,10,12,14,1,3,5,7,9,11,13,15};

	// subBytes
	for(i=0; i<16; ++i){
		idx = (((offset[0] + dummy_idx[i]) % 16)*256); 			// Selection of the Sbox to be read depending
																// on the byte index of state, and the value of the offset
		tmp[dummy_idx[i]] = pgm_read_byte(aes_sbox0+(idx + (state->s[dummy_idx[i]])));
		
	}
	// after subByte, state is masked with m[offset+1] ... m[offset+1+16  mod 16]
	// shiftRows /
	aes_shiftcol(tmp+1, 1);
	aes_shiftcol(tmp+2, 2);
	aes_shiftcol(tmp+3, 3);
	// mixColums /offset
	for(i=0; i<4; ++i){
		t = tmp[4*i+0] ^ tmp[4*i+1] ^ tmp[4*i+2] ^ tmp[4*i+3];
		state->s[4*i+0] =
			  GF256MUL_2(tmp[4*i+0]^tmp[4*i+1])
			^ tmp[4*i+0]
			^ t;
		state->s[4*i+1] =
			  GF256MUL_2(tmp[4*i+1]^tmp[4*i+2])
			^ tmp[4*i+1]
			^ t;
		state->s[4*i+2] =
			  GF256MUL_2(tmp[4*i+2]^tmp[4*i+3])
			^ tmp[4*i+2]
			^ t;
		state->s[4*i+3] =
			  GF256MUL_2(tmp[4*i+3]^tmp[4*i+0])
			^ tmp[4*i+3]
			^ t;
	}

	//Ici on enleve le masque composite et on remasque avec ms[(offset+1 + i)%16], puis on xor avec la nouvelle clef de ronde .
	
	//Here we apply POK, ie. we apply mask compensation by removing the composite mask end remasking with the mask that
	//we had at the output of the masked Sbox
	
	// addKey /
	for(i=0; i<16; ++i){
		tmp[i] = pgm_read_byte(pok+((((offset[0]+1)%16)*16) + i));
		state->s[i] ^= ((k->ks[i])^tmp[i]) ;
	}
	
}

// Last round of AES RSM encryption
static
void aes_enc_lastround(uint8_t* offset, aes_cipher_state_t* state,const aes_roundkey_t* k){
	uint8_t i;
	uint8_t tmp;
        int idx;
	// subBytes /

	for(i=0; i<16; ++i){
		//tmp= pgm_read_byte( aes_sbox + offset[0] + state->s[i] );
                idx =  (((offset[0]+i)%16)*256);
                state->s[i] = pgm_read_byte(aes_sbox0+( idx + state->s[i] ));
	}


	// shiftRows /
	aes_shiftcol(state->s+1, 1);
	aes_shiftcol(state->s+2, 2);
	aes_shiftcol(state->s+3, 3);
	// keyAdd /

	for(i=0; i<16; ++i){
                tmp =  pgm_read_byte(pok+(256 + (((offset[0]+1)%16)*16) + i));
                state->s[i] ^= tmp ;
	}

        for(i=0; i<16; ++i){
        	state->s[i] ^= (k->ks[i]) ;
	}
}


/*This is the generic core of AES RSM */
void aes_encrypt_core(uint8_t* offset, aes_cipher_state_t* state, const aes_genctx_t* ks, uint8_t rounds) {
    uint8_t i;

    //The plaintext is first xored with the mask offset of the array of masks, offset being the random offset
    // The we xor it the key ( First Add round key)
    for (i = 0; i < 16; ++i) {;
        state->s[i] ^= pgm_read_byte(m+((offset[0] + i) % 16));
        state->s[i] ^= ks->key[0].ks[i]; //
    }

    i = 1;
    // First 13 rounds of AES 256
    for (; rounds > 1; --rounds) { 						// For the first round, state is masked with m[offset[0]]


    	aes_enc_round(offset, state, &(ks->key[i])); 	// The masked Sbox is chosen depending on the offset offset
        												// The final state of each round is masked with m[offset+1]
        ++i;
        offset[0] = (offset[0] + 1) % 16; // At the end of each round , the mask is shifted by 1 byte
    }
	
    // Last round
    aes_enc_lastround(offset, state, &(ks->key[i]));
	
	
    offset[0] = (offset[0] + 1) % 16;
	
}
