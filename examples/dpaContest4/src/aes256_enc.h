/* aes256_enc.h */

#ifndef AES256_ENC_H_
#define AES256_ENC_H_

#include "aes_types.h"
#include "aes_enc.h"


/**
 * \brief encrypt with 256 bit key.
 *
 * This function encrypts one block with the AES algorithm under control of
 * a keyschedule produced from a 256 bit key.
 * \param buffer pointer to the block to encrypt
 * \param ctx    pointer to the key schedule
 */


void aes256_enc(uint8_t* j, void* buffer, aes256_ctx_t* ctx);



/*! \brief Full AES RSM encryption function.

	This function encrypts <EM>v</EM> with <EM>k</EM> and returns the
	encrypted data in <EM>v</EM>.
	The computation of keyschedule is done before encryption .
	\param v Array of two long values containing the data block.
	\param k Array of four long values containing the key.
*/
void aes_cenc( uint8_t *v, uint8_t *k,uint8_t *j);

#endif /* AES256_ENC_H_ */
