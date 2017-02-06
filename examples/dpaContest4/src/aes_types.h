/* aes.h */

#ifndef AES_TYPES_H_
#define AES_TYPES_H_

#include <stdint.h>

typedef struct{
	uint8_t ks[16];
} aes_roundkey_t;


typedef struct{
	aes_roundkey_t key[14+1];
} aes256_ctx_t;

typedef struct{
	aes_roundkey_t key[1]; /* just to avoid the warning */
} aes_genctx_t;

typedef struct{
	uint8_t s[16];
} aes_cipher_state_t;


typedef struct{
	uint8_t m[16];
} aes_base_mask_t;

#endif
