; Write a program to swap the last element of an array with the first 
; element, the next to the last element with the second element, etc. 
; Assume that the array has 8 bit numbers and the array starts at memory 
; location 2000H.  

DATA SEGMENT
    ORG 2000H
    ARR DB 04H,01H,07H,05H,02H
    LEN EQU $-ARR
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX,DATA 
    MOV DS,AX
    LEA SI,ARR ;first position of array
    LEA DI,ARR+LEN-1 ;last position of array
RPT: ;for accessing and swapping
    MOV AL,[SI] ;storing 1st element
    XCHG [DI],AL ;mov 1st element to last
    XCHG [SI],AL ;mov last element to last
    INC SI ;next array element
    DEC DI ;prev array element
    CMP SI,DI ;if middle value reached hlt
    JNE RPT
    HLT
CODE ENDS
END START