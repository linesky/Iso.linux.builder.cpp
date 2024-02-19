@set paths=%PATH%
@set PATH=c:\mingw\bin\;c:\nasm\;%paths%
@as -o .\tmp\boot.o .\file\boot.s
@g++ -c -nostdlib -o .\tmp\kernel.o %1
@ld -nostdlib -T .\file\link.ld .\tmp\boot.o .\tmp\kernel.o -o .\tmp\kernel.bin
@objcopy .\tmp\kernel.bin -O elf32-i386  .\tmp\file.bin
@set PATH=%paths%
