format PE console 4.0

include 'win32a.inc' 

entry start 

section '.data' data readable 
array     db "1a2b3c4d an fesv fz d f",0
fmt       db "%c",0 

section '.code' readable executable 
start: 
        mov        ecx, 0 
         
mainLoop: 
        cmp   ecx, 23
        jne   print  
        je   okay 
         
print: 
        lea        eax, [ecx + array]
        push      ecx
        cinvoke  printf, fmt, [eax]
        pop       ecx
        
        inc  ecx
        jmp      mainLoop 
         
okay: 
       ; invoke  ExitProcess, 0
        call [getch]
        push 0
        call [ExitProcess]


section '.idata' data import readable writeable 
library kernel32, 'kernel32.dll',  msvcrt, 'msvcrt.dll' 
import kernel32, ExitProcess, 'ExitProcess' 
import msvcrt,\
           printf, 'printf',\
           scanf, 'scanf',\
           getch, '_getch'