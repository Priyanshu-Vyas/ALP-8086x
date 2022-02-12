; An array contains twenty 8 bit numbers that are stored starting from 
; location 2000H. Write a program to add all the even numbers in an array 
; and store the result in 5000H (lower byte) and 5001H (Higher byte).

DATA SEGMENT
    ORG 2000H
    ARR DB 01H,02H,03H,04H,05H,06H,07H,08H,09H,0AH,0BH,0CH,0DH,0EH,0FH,10H,11H,12H,13H,14H
    LEN EQU $-ARR
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX,DATA
    MOV DS,AX
    LEA SI,ARR ;first pos
    MOV CX,LEN ;counter
    MOV DX,00H ;for storing result
RPT:
    MOV AX,[SI]
    AND AX,01H ;checking if even
    JNZ SKIP
    ADD DX,[SI] ;if even then add to dx
SKIP:
    INC SI ;next arr pos
    DEC CX ;counter--
    JNZ RPT
    MOV DI,5000H 
    MOV [DI],DL ;storing lower byte of result at 5000h
    MOV DI,5001H
    MOV [DI],DH ;storing higher byte of result at 5001h
    MOV AL,DL
    HLT
CODE ENDS
END START
    