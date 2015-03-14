/*
 * ==========================================================================
 *
 * Nome do Arquivo:  dictionary.h
 *
 *       Descricao:  TAD para manipulação dos verbetes reconhecidos pelo 
 *       			 assembler.
 *
 *          Versao:  1.0
 *       Criado em:  14/03/2015 20:05:03
 *         Revisao:  none
 *      Compilador:  gcc
 *
 *           Autor:  Cristian Costa Mello, Gustavo Freitas de Amorim
 *     Organizacao:  VY Cannis Majoris
 *
 * =========================================================================
 */

#ifndef DICTIONARY_HEADER
#define DICTIONARY_HEADER

#include "entry/entry.h"            /* incluir o TAD ENTRY */
#include "dicLoader/dicLoader.h"    /* incluir o TAD DICLOADER */
#include "dicWriter/dicWriter.h"    /* incluir o TAD DICWRITER */

#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>


#define DICTIONARY_ELOAD         -1
#define DICTIONARY_ELOAD_MSG     "Falha ao carregar o dicionário."

typedef struct _dictionary
{
	DICLOADER *loader;
    ENTRY **verbetes;
    uint64_t qtdEntry;
} DICTIONARY, DIC;


/* -> DICTIONARY *dic_new(const char *filename)
 * 
 * - DESCRIÇÃO: Instancia um novo dicionário que será utilizado na
 *              tradução da linguagem.
 *   
 * - PARÂMETROS: 
 *      -> const char *filename: Nome do arquivo a ser utilizado no carregamento
 *         do dicionário.
 *
 * - RETORNO: Estrutura do tipo DICTIONARY instanciada.
 *   	-> Se NULL    - Erro na operação.
 *   	-> Se != NULL - Sucesso na operação.
 */
DICTIONARY *    dic_new(const char *filename);


/* -> void dic_free(DICTIONARY *dic)
 * 
 * - DESCRIÇÃO: Destrói uma estrutura existente em memória.
 *
 * - PARÂMETROS: 
 *      -> DICTIONARY *dic: Estrutura a ser destruída.
 *
 * - RETORNO: void.
 */
void            dic_free(DICTIONARY *dic);


/* -> ENTRY *dic_search(DICTIONARY *dic, const char *nomeOperacao)
 * 
 * - DESCRIÇÃO: Busca um nome de operação dentro dos padrões de instrução 
 *              cadastrados.
 *
 * - PARÂMETROS: 
 *      -> DICTIONARY *dic: Estrutura a ser utilizada na busca.
 *      -> const char *nomeOperacao: Nome a ser pesquisado.
 *
 * - RETORNO: Estrutura do tipo ENTRY resultante do processo de busca.
 *   	-> Se NULL    - Não encontrado.
 *   	-> Se != NULL - Encontrado.
 */
ENTRY *         dic_search(DICTIONARY *dic, const char *nomeOperacao);


/* -> int dic_save(DICTIONARY *dic)
 * 
 * - DESCRIÇÃO: Salva o dicionário em um arquivo.
 *
 * - PARÂMETROS: 
 *      -> DICTIONARY *dic: Estrutura a ser utilizada na busca.
 *      -> const char *filename: Nome do arquivo a ser salvo.
 *
 * - RETORNO: Estado da operação.
 *      -> Se 0    - Erro na operação.
 *      -> Se != 0 - Sucesso na operação.
 */
int             dic_save(DICTIONARY *dic, const char *filename);


/* -> int dic_load(DICTIONARY *dic)
 * 
 * - DESCRIÇÃO: Carrega o dicionário presente em um arquivo.
 *
 * - PARÂMETROS: 
 *      -> DICTIONARY *dic: Estrutura a ser utilizada no carregamento.
 *
 * - RETORNO: Estado da operação.
 *      -> Se 0    - Erro na operação.
 *      -> Se != 0 - Sucesso na operação.
 *
 * - OBSERVAÇÃO: O arquivo de saída é aberto na criação do dicionário, ou seja, 
 *   na execução da função dic_new(...).
 */
int             dic_load(DICTIONARY *dic);

#endif /* DICIONARY_HEADER */
