/*
 * ==========================================================================
 *
 * Nome do Arquivo:  asmWriter.c
 *
 *       Descricao:  Implementação do TAD ASMWRITER.
 *
 *          Versao:  1.0
 *       Criado em:  05/03/2015 17:11:43
 *         Revisao:  none
 *      Compilador:  gcc
 *
 *           Autor:  Cristian Costa Mello, Gustavo Freitas de Amorim
 *     Organizacao:  VY Cannis Majoris
 *
 * =========================================================================
 */

#include "asmWriter.h"

ASMWRITER *asmWriter_new(const char *filename)
{
	ASMWRITER *new = NULL;

	new = (ASMWRITER*)malloc(sizeof(ASMWRITER));

	if(new != NULL){
		new->file = fopen(filename, "wb+");

		if(new->file == NULL){
			free(new);
			new = NULL;
		}
	}
    
	return new;
}

void asmWriter_free(ASMWRITER *asmWriter)
{
	fclose(asmWriter->file);
	free(asmWriter);

}

void asmWriter_writeInst(ASMWRITER *asmWriter, INSTRUCTION *instruction)
{
	fwrite(&(instruction->inst), sizeof(instruction->inst), 1, asmWriter->file);
}

