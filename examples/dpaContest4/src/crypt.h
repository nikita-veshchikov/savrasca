#ifndef SOSSE_CRYPT_H
#define SOSSE_CRYPT_H

#include <string.h>
#include <types.h>

#define CRYPT_ALGO_AES_256		0	//!< Algorithm ID: AES_256_RSM

/* AES */
#include <aes.h>
//! Length of key in octets.
#define CRYPT_KEY_LEN	AES_KEY_LEN
//! Length of cipher block in octets.
#define CRYPT_BLOCK_LEN	AES_BLOCK_LEN
//! Single block encryption function.
#define crypt_enc(v,k,j,rng) aes_cenc((uint8_t*)(v),(uint8_t*)(k),(uint8_t *)(j))
//! Single block decryption function.
#define crypt_dec(v,k,j,rng) aes_cenc((uint8_t*)(v),(uint8_t*)(k),(uint8_t *)(j)) //todo: add AES RSM decryption

#endif /* SOSSE_CRYPT_H */

