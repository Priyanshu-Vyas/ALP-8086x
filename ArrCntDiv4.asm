; Write a program to find the number of elements that are divisible by 4 
; from an array of fifteen 2-byte numbers. The array starts from the 
; memory location 2000H. Store the count value in the location 4000H.

DATA SEGMENT
    ORG 2000H ;array starting location
    ARR DW 01H,02H,04H,08H,0CH
    LEN EQU $-ARR ;length of array
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
    MOV AX,DATA
    MOV DS,AX
    LEA SI,ARR ;arr first pos
    MOV CX,LEN ;counter
    MOV DX,00H ;result
RPT:
    MOV AX,[SI]
    MOV BL,04H
    DIV BL
    CMP AH,00H ;checking 4 multiples
    JNZ CNT
    INC DX ;counting 4 multiples
CNT:
    INC SI
    INC SI ;inc +2
    DEC CX
    DEC CX ;dec -2
    JNZ RPT
    MOV DI,4000H 
    MOV [DI],DX ;storing result(count) at 4000h
HLT
CODE ENDS
END START