TITLE	A08CTRNM (EXE)  Accept names from keyboard,
;					 center them on screen, sound bell
		.MODEL SMALL
		.STACK 64
		.DATA
PARLIST	LABEL  BYTE			;Name parameter list:
MAXNLEN	DB	  20				;  maximum length of name
ACTULEN	DB	  ?				;  no. of characters entered
KBNAME	DB	  32 DUP(' ')		;  entered name 
PROMPT	DB	  'Letter? ', '$'
HAHA    DB        ?
A	DB        '.-$'
B	DB        '-...$'
C	DB	  '-.-.$'
D	DB	  '-..$'
E	DB	  '.$'
F	DB	  '..-.$'
G	DB	  '--.$'
H	DB	  '....$'
I	DB	  '..$'
J	DB	  '.---$'
K	DB	  '-.-$'
L	DB	  '.-..$'
M	DB	  '--$'
N	DB	  '-.$'
O	DB	  '---$'
P	DB	  '.--.$'
Q	DB	  '--.-$'
R	DB	  '.-.$'
S	DB	  '...$'
T	DB	  '-$'
U	DB	  '..-$'
V	DB	  '...-$'
W	DB	  '.--$'
X	DB	  '-..-$'
Y	DB	  '-.--$'
Z	DB	  '--..$'
NL      DB	  10h
;------------------------------------------------------- 
		.CODE
A10MAIN	PROC   FAR
		MOV	  AX,@data		;Initialize segment
		MOV	  DS,AX			;  registers
		MOV	  ES,AX
		
		
	CMPA:		
		CALL      B10INPUT
		MOV	  BL,'a'
		CMP       BL,HAHA
		JE JAA
	CMPB:
		MOV       BL,'b'
		CMP	  BL,HAHA
		JE JBB
	CMPC:
		MOV	  BL,'c'
		CMP       BL,HAHA
		JE JCC
	CMPD:
		MOV	  BL,'d'
		CMP       BL,HAHA
		JE JDD
	
	
		
		JAA:
		MOV	  AH,09H			;Request display
		LEA	  DX,A		;  of user prompt
		INT	  21H
		JMP       EXIT
		
		JBB:
		MOV	  AH,09H			;Request display
		LEA	  DX,B		;  of user prompt
		INT	  21H
		JMP       EXIT
		
		JCC:
		MOV	  AH,09H			;Request display
		LEA	  DX,C		;  of user prompt
		INT	  21H
		JMP       EXIT
		
		JDD:
		MOV	  AH,09H			;Request display
		LEA	  DX,D		;  of user prompt
		INT	  21H
		JMP       EXIT
		
		JEE:
		MOV	  AH,09H			;Request display
		LEA	  DX,E		;  of user prompt
		INT	  21H
		JMP       EXIT
				
		JFF:
		MOV	  AH,09H			;Request display
		LEA	  DX,F		;  of user prompt
		INT	  21H
		JMP       EXIT
				
		JGG:
		MOV	  AH,09H			;Request display
		LEA	  DX,G		;  of user prompt
		INT	  21H
		JMP       EXIT
				
		JHH:
		MOV	  AH,09H			;Request display
		LEA	  DX,H		;  of user prompt
		INT	  21H
		JMP       EXIT
		
		JII:
		MOV	  AH,09H			;Request display
		LEA	  DX,I		;  of user prompt
		INT	  21H
		JMP       EXIT
						
		JJJ:
		MOV	  AH,09H			;Request display
		LEA	  DX,J		;  of user prompt
		INT	  21H
		JMP       EXIT
						
		JKK:
		MOV	  AH,09H			;Request display
		LEA	  DX,K		;  of user prompt
		INT	  21H
		JMP       EXIT
						
		JLL:
		MOV	  AH,09H	        ; Request display
		LEA	  DX,L			;  of user prompt
		INT	  21H
		JMP       EXIT
		

EXIT:
		MOV	  AX,4C00H		;End processing
		INT	  21H
A10MAIN	ENDP


;			  Display prompt and accept input of name:
;			   --------------------------------------
B10INPUT	PROC   NEAR
		PUSH	  AX				;Preserve used
		PUSH	  DX				;  registers
		MOV	  AH,09H			;Request display
		LEA	  DX,PROMPT		;  of user prompt
		INT	  21H
		MOV	  AH,01H			;Request keyboard
		INT	  21H
		MOV	  HAHA,AL	;  input
		POP	  DX				;Restore
		POP	  AX				;  registers
		RET
B10INPUT	ENDP

END	  A10MAIN