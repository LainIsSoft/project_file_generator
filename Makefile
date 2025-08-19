#	TYPE =
#			script:
##					FILE = 
##							sh: shell file
##							bat: batch file

#			execut:
##					FILE = 
##							c: c language
##							py: python language

#OSS ?= win
#TYPE ?= executable
#FILE ?= batch

# Normalize OS name
ifeq ($(OS), Windows_NT)
	#OSNAME := windows
	SHELL := cmd.exe
	.SHELLFLAGS := /C
	ifeq ($(TYPE), execut)
		ifeq ($(FILE), c)
			FILE = c
		else ifeq ($(TYPE), py)
			FILE = python
		endif
	else
		FILE = bat
	endif
#else ifeq ($(OSS), lin)
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S), Linux)
		#OSNAME := linux
		SHELL := /bin/sh
    		SHELLFLAG := -c
		ifeq ($(TYPE), execut)
			ifeq ($(FILE), c)
				FILE = c
			else ifeq ($(TYPE), py)
				FILE = python
			endif
		else
			FILE = sh
		endif
	endif
endif

all: output

output: do_$(FILE)

do_bat:
	@del .\\output\pfige.*
	@copy /Y .\\Batch\\batch_template.txt .\\output\\pfige.bat >nul
	@echo created bat file
do_sh:
	@rm ./output/pfige.*
	@cp ./Shell/shell_template.txt ./output/pfige.sh
	@chmod +x ./output/pfige.sh
	@echo shell script was created

do_c:
	@echo compile c

do_py:
	@echo hello python!

.PHONY: clean

clean:
	### MISSED SHELL OPTION
	#@del output\\pfige.*
