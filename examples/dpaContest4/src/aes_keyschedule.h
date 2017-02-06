/* aes_keyschedule.h */


#ifndef AES_KEYSCHEDULE_H_
#define AES_KEYSCHEDULE_H_

#include "aes_types.h"
/**
 * \brief initialize the keyschedule
 *
 * This function computes the keyschedule from a given key with a given length
 * and stores it in the context variable
 * \param key       pointer to the key material
 * \param keysize_b length of the key in bits (valid are 128, 192 and 256)
 * \param ctx       pointer to the context where the keyschedule should be stored
 */
void aes_init(const void* key, uint16_t keysize_b, aes_genctx_t* ctx);


/**
 * \brief initialize the keyschedule for 256 bit key
 *
 * This function computes the keyschedule from a given 256 bit key
 * and stores it in the context variable
 * \param key       pointer to the key material
 * \param ctx       pointer to the context where the keyschedule should be stored
 */
void aes256_init(const void* key, aes256_ctx_t* ctx);

#endif /* AES_KEYSCHEDULE_H_ */

