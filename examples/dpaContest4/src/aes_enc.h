/* aes_enc.h */

#ifndef AES_ENC_H_
#define AES_ENC_H_
#include "aes_types.h"
#include <stdint.h>


void aes_encrypt_core(uint8_t* j,aes_cipher_state_t* state, const aes_genctx_t* ks, uint8_t rounds);


#endif
