; An array contains ten 8 bit numbers that are stored starting from location 
; 2000H.  Write a program to find the average of the square of each 
; element. Store the program starting from the location 500H.

DATA SEGMENT
    ARR DB 01H,02H,03H,04H,05H,06H,07H,08H,09H,0AH ;sum=385
    LEN EQU $-ARR
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
    ORG 500H ;program starts from 500h
    MOV AX,DATA
    MOV DS,AX
    LEA SI,ARR ;first index of array
    MOV CX,LEN ;set counter with len of array
    MOV BX,0H ;base reg for storing sum
RPT:
    MOV AL,[SI]
    MUL AL ;squaring
    ADD BX,AX ;storing square sum
    INC SI ;next position
    DEC CX ;deacrement counter 
    JNZ RPT
    MOV AX,BX ;sum storing to accumulator
    MOV DL,LEN
    DIV DL ;for avg = sum / n
    HLT
CODE ENDS
END START