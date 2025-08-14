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
else ifeq ($(OS), linux)
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

all: output

output: do_$(FILE)

do_bat:
	@del .\\output\*.bat
	@copy /Y .\\Batch\\batch_template.txt .\\output\\pfige.bat >nul
	@echo created bat file
do_sh:
	@echo shell script created

do_c:
	@echo compile c

do_py:
	@echo hello python!

.PHONY: clean

clean:
	@del output\\output.bat