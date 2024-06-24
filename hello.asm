format PE console ; format Portable Executable Console
entry start ; our entry

include 'INCLUDE\win32ax.inc' ; connect win32a.inc

section '.data' data readable writeable ; here starts data section 
    hello_world db 'Hello world!', 0 ; text to output is here, reserve 1 byte ( create something like a variable ), 0 at the end means end of line
section '.code' code readable executable ; here starts code section 
start: ; here is entry of the program 

    invoke printf, hello_world ; use a macro to print a line
    invoke ExitProcess, 0 ; exit from program 

section '.idata' data import readable ; here start import data
    library kernel, 'kernel32.dll',\ ; connect kernel and msvcrt dlls
        msvcrt, 'msvcrt.dll'
  
    import kernel,\ ; from kernel import ExitProcess
        ExitProcess, 'ExitProcess'
          
    import msvcrt,\ ; from msvcrt import printf
  		printf, 'printf'