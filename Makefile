# Makefile
# Makefile do Projeto AssemblerM.
#
# ENTRADAS:
#	1. make	all ou make:
#	   compilação do projeto (não compila a ferramenta dicwriter);
#
#	2. make dicwriter : compilação somente da ferramenta dicwriter;
#
#	3. make clean : limpa o projeto (não limpa dicwriter);
#
#	4. make clean_dicwriter : limpa somente o dicwriter.
#
#	5. make instdebug: compilação da ferramenta de depuração do INSTRUCTION.


# DEFINIÇÕES DE ARQUIVOS #####################
# Arquivos de código-fonte
IMAIN_SRC		= src/imain.c
ASSEMBLER_SRC	= src/assembler/assembler.c
ASMLOADER_SRC	= src/asmLoader/asmLoader.c
ASMWRITER_SRC	= src/asmWriter/asmWriter.c
INSTRUCTION_SRC	= src/instruction/instruction.c
DICTIONARY_SRC	= src/dictionary/dictionary.c
ENTRY_SRC		= src/dictionary/entry/entry.c
DICWRITER_SRC	= src/dictionary/dicWriter/dicWriter.c
DICLOADER_SRC	= src/dictionary/dicLoader/dicLoader.c
LABEL_SRC		= src/assembler/label/label.c
REG_SRC			= src/assembler/reg/reg.c
TOKENS_SRC		= src/scanner/tokens/tokens.c
SCANNER_SRC		= src/scanner/scanner.c
LINKEDL_SRC     = src/linkedList/linkedList.c
GNODE_SRC       = src/linkedList/node.c
GDMANIP_SRC     = src/linkedList/genericDataManipulation.c
TOOL_DICWRITER_SRC = tools/dicwriter/main.c
TOOL_INSTDEBUG_SRC = tools/instdebug/main.c


# Arquivos-cabeçalho
ASSEMBLER_H		= src/assembler/assembler.h
ASMLOADER_H		= src/asmLoader/asmLoader.h
ASMWRITER_H		= src/asmWriter/asmWriter.h
INSTRUCTION_H	= src/instruction/instruction.h
DICTIONARY_H	= src/dictionary/dictionary.h
ENTRY_H			= src/dictionary/entry/entry.h
DICWRITER_H		= src/dictionary/dicWriter/dicWriter.h
DICLOADER_H		= src/dictionary/dicLoader/dicLoader.h
LABEL_H			= src/assembler/label/label.h
REG_H			= src/assembler/reg/reg.h
TOKENS_H		= src/scanner/tokens/tokens.h
SCANNER_H		= src/scanner/scanner.h
LINKEDL_H       = src/linkedList/linkedList.h
GNODE_H         = src/linkedList/node.h
GDMANIP_H       = src/linkedList/genericDataManipulation.h


# Arquivos-objeto
IMAIN_OBJ		= obj/imain.o
ASSEMBLER_OBJ	= obj/assembler.o
ASMLOADER_OBJ	= obj/asmLoader.o
ASMWRITER_OBJ	= obj/asmWriter.o
INSTRUCTION_OBJ	= obj/instruction.o
DICTIONARY_OBJ	= obj/dictionary.o
ENTRY_OBJ		= obj/entry.o
DICWRITER_OBJ	= obj/dicWriter.o
DICLOADER_OBJ	= obj/dicLoader.o
LABEL_OBJ		= obj/label.o
REG_OBJ			= obj/reg.o
TOKENS_OBJ		= obj/tokens.o
SCANNER_OBJ		= obj/scanner.o
LINKEDL_OBJ     = obj/linkedList.o
GNODE_OBJ       = obj/node.o
GDMANIP_OBJ     = obj/genericDataManipulation.o
TOOL_DICWRITER_OBJ	= tools/dicwriter/obj/tool_dicwriter.o
TOOL_INSTDEBUG_OBJ =  tools/instdebug/obj/tool_instdebug.o


# Símbolos de arquivos de saída
OUTPUT_NAME_EXEC		= AssemblerM
OUTPUT_FULLPATH_EXEC	= bin/$(OUTPUT_NAME_EXEC)

OUTPUT_NAME_EXEC_DICWRITER = dicwriter
OUTPUT_FULLPATH_EXEC_DICWRITER = tools/$(OUTPUT_NAME_EXEC_DICWRITER)/bin/$(OUTPUT_NAME_EXEC_DICWRITER)


OUTPUT_NAME_EXEC_INSTDEBUG = instdebug
OUTPUT_FULLPATH_EXEC_INSTDEBUG = tools/$(OUTPUT_NAME_EXEC_INSTDEBUG)/bin/$(OUTPUT_NAME_EXEC_INSTDEBUG)


LN_SYMBOL				= $(OUTPUT_NAME_EXEC)
LN_SYMBOL_TOOL_DICWRITER = $(OUTPUT_NAME_EXEC_DICWRITER)


# DEFINIÇÕES PARA COMPILAÇÃO #################
COMPILER 		= gcc
CFLAG 			= -c
LFLAG 			= -o
#LIBFLAG 		=
SRC 			= $(IMAIN_SRC) $(ASSEMBLER_SRC) $(ASMLOADER_SRC) \
$(ASMWRITER_SRC) $(INSTRUCTION_SRC) $(DICTIONARY_SRC) $(ENTRY_SRC) \
$(DICWRITER_SRC) $(DICLOADER_SRC) $(LABEL_SRC) $(REG_SRC) $(TOKENS_SRC) \
$(SCANNER_SRC)


OBJ				= $(IMAIN_OBJ) $(ASSEMBLER_OBJ) $(ASMLOADER_OBJ) \
$(ASMWRITER_OBJ) $(INSTRUCTION_OBJ) $(DICTIONARY_OBJ) $(ENTRY_OBJ) \
$(DICWRITER_OBJ) $(DICLOADER_OBJ) $(LABEL_OBJ) $(REG_OBJ) $(TOKENS_OBJ) \
$(SCANNER_OBJ) $(LINKEDL_OBJ) $(GNODE_OBJ) $(GDMANIP_OBJ)


BIN					= $(OUTPUT_FULLPATH_EXEC)
BIN_TOOL_DICWRITER	= $(OUTPUT_FULLPATH_EXEC_DICWRITER)
BIN_TOOL_INSTDEBUG	= $(OUTPUT_FULLPATH_EXEC_INSTDEBUG)


all: mk_dir $(BIN)

$(IMAIN_OBJ): $(IMAIN_SRC)
	$(COMPILER) $(CFLAG) $(IMAIN_SRC) $(LFLAG) $(IMAIN_OBJ)

$(ASSEMBLER_OBJ): $(ASSEMBLER_H) $(ASSEMBLER_SRC)
	$(COMPILER) $(CFLAG) $(ASSEMBLER_SRC) $(LFLAG) $(ASSEMBLER_OBJ)

$(ASMLOADER_OBJ): $(ASMLOADER_H) $(ASMLOADER_SRC)
	$(COMPILER) $(CFLAG) $(ASMLOADER_SRC) $(LFLAG) $(ASMLOADER_OBJ)

$(ASMWRITER_OBJ): $(ASMWRITER_H) $(ASMWRITER_SRC)
	$(COMPILER) $(CFLAG) $(ASMWRITER_SRC) $(LFLAG) $(ASMWRITER_OBJ)

$(INSTRUCTION_OBJ): $(INSTRUCTION_H) $(INSTRUCTION_SRC)
	$(COMPILER) $(CFLAG) $(INSTRUCTION_SRC) $(LFLAG) $(INSTRUCTION_OBJ)

$(DICTIONARY_OBJ): $(DICTIONARY_H) $(DICTIONARY_SRC)
	$(COMPILER) $(CFLAG) $(DICTIONARY_SRC) $(LFLAG) $(DICTIONARY_OBJ)

$(ENTRY_OBJ): $(ENTRY_H) $(ENTRY_SRC)
	$(COMPILER) $(CFLAG) $(ENTRY_SRC) $(LFLAG) $(ENTRY_OBJ)

$(DICWRITER_OBJ): $(DICWRITER_H) $(DICWRITER_SRC)
	$(COMPILER) $(CFLAG) $(DICWRITER_SRC) $(LFLAG) $(DICWRITER_OBJ)

$(DICLOADER_OBJ): $(DICLOADER_H) $(DICLOADER_SRC)
	$(COMPILER) $(CFLAG) $(DICLOADER_SRC) $(LFLAG) $(DICLOADER_OBJ)

$(LABEL_OBJ): $(LABEL_H) $(LABEL_SRC)
	$(COMPILER) $(CFLAG) $(LABEL_SRC) $(LFLAG) $(LABEL_OBJ)

$(REG_OBJ): $(REG_H) $(REG_SRC)
	$(COMPILER) $(CFLAG) $(REG_SRC) $(LFLAG) $(REG_OBJ)

$(TOKENS_OBJ): $(TOKENS_H) $(TOKENS_SRC)
	$(COMPILER) $(CFLAG) $(TOKENS_SRC) $(LFLAG) $(TOKENS_OBJ)

$(SCANNER_OBJ): $(SCANNER_H) $(SCANNER_SRC)
	$(COMPILER) $(CFLAG) $(SCANNER_SRC) $(LFLAG) $(SCANNER_OBJ)

$(GDMANIP_OBJ): $(GDMANIP_H) $(GDMANIP_C)
	$(COMPILER) $(CFLAG) $(GDMANIP_SRC) $(LFLAG) $(GDMANIP_OBJ)

$(GNODE_OBJ): $(GNODE_H) $(GNODE_SRC)
	$(COMPILER) $(CFLAG) $(GNODE_SRC) $(LFLAG) $(GNODE_OBJ)
	
$(LINKEDL_OBJ): $(LINKEDL_H) $(LINKEDL_SRC) $(GNODE_OBJ) $(GDMANIP_OBJ)
	$(COMPILER) $(CFLAG) $(LINKEDL_SRC) $(LFLAG) $(LINKEDL_OBJ)

# Regra de compilação da ferramenta dicwriter
$(TOOL_DICWRITER_OBJ): $(DICWRITER_OBJ) $(TOOL_DICWRITER_SRC)
	$(COMPILER) $(CFLAG) $(TOOL_DICWRITER_SRC) $(LFLAG) $(TOOL_DICWRITER_OBJ)

$(TOOL_INSTDEBUG_OBJ): $(INSTRUCTION_OBJ) $(TOOL_INSTDEBUG_SRC)
	$(COMPILER) $(CFLAG) $(TOOL_INSTDEBUG_SRC) $(LFLAG) $(TOOL_INSTDEBUG_SRC)

$(BIN): $(OBJ)
	$(COMPILER) $(LFLAG) $(BIN) $(OBJ) $(LIBFLAG)

# GERAÇÃO DA FERRAMENTA DICWRITER
dicwriter_bin: mk_dir_dicwriter $(TOOL_DICWRITER_OBJ) $(LINKEDL_OBJ) $(ENTRY_OBJ)
	$(COMPILER) $(LFLAG) $(BIN_TOOL_DICWRITER) $(DICWRITER_OBJ) \
	$(GDMANIP_OBJ) $(GNODE_OBJ) $(LINKEDL_OBJ) $(TOOL_DICWRITER_OBJ) \
	$(ENTRY_OBJ)

dicwriter: dicwriter_bin LN_SYMBOL_TOOL_DICWRITER
	$(COMPILER) $(LFLAG) $(BIN_INSTDEBUG_TOOL)  $(INSTRUCTION_OBJ) \
	$(TOOL_INSTDEBUG_OBJ)
	

# Regra de compilação da ferramenta instdebug
instdebug_bin: mk_dir_instdebug $(INSTRUCTION_OBJ)
	gcc -c tools/instdebug/main.c -o tools/instdebug/obj/instdebug.o
	gcc -o tools/instdebug/bin/instdebug tools/instdebug/obj/instdebug.o \
	$(INSTRUCTION_OBJ)

instdebug: instdebug_bin LN_SYMBOL_TOOL_INSTDEBUG


# GERAÇÃO DO LINK SIMBÓLICO #################
LN_SYMBOL:
	rm -f $(OUTPUT_NAME_EXEC)
	ln -s $(OUTPUT_FULLPATH_EXEC)

LN_SYMBOL_TOOL_DICWRITER:
	rm -f bin/$(OUTPUT_NAME_EXEC_DICWRITER)
	cd bin && ln -s ../$(OUTPUT_FULLPATH_EXEC_DICWRITER)
	cd ..

LN_SYMBOL_TOOL_INSTDEBUG:
	rm -f bin/$(OUTPUT_NAME_EXEC_INSTDEBUG)
	cd bin && ln -s ../$(OUTPUT_FULLPATH_EXEC_INSTDEBUG)
	cd ..

# CRIAÇÃO DE PASTAS #########################
mk_dir:
	mkdir -p bin data obj

mk_dir_dicwriter:
	mkdir -p tools/$(OUTPUT_NAME_EXEC_DICWRITER)/bin
	mkdir -p tools/$(OUTPUT_NAME_EXEC_DICWRITER)/obj

mk_dir_instdebug:
	mkdir -p tools/$(OUTPUT_NAME_EXEC_INSTDEBUG)/bin
	mkdir -p tools/$(OUTPUT_NAME_EXEC_INSTDEBUG)/obj

clean:
	rm -f $(OUTPUT_FULLPATH_EXEC) $(LN_SYMBOL) *~ *.swp *.swo \
	$(OBJ) $(TOOL_DICWRITER_OBJ)

clean_dicwriter:
	rm -f $(OUTPUT_FULLPATH_EXEC_DICWRITER) bin/$(LN_SYMBOL_TOOL_DICWRITER) \
	$(TOOL_DICWRITER_OBJ) $(LINKEDL_OBJ) $(GNODE_OBJ) $(GDMANIP_OBJ) $(ENTRY_OBJ) 
