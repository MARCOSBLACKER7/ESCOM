STDIN	equ dword -10
STDOUT	equ dword -11

segment .data
	message1 db 'Ingrese una cadena mayor a 10 caracteres: '
	len1 equ $-message1
	message2 db 'La longitud de la cadena ingresada es: '
	len2 equ $-message2
	longitud dw 0
	leido db 0
	handle dd 0

segment .bss
	cad resb 1515
	digito resb 2

segment .text
	global _start 
	extern _GetStdHandle@4
	extern _WriteConsoleA@20
	extern _ReadConsoleA@20
	extern _ExitProcess@4


_start:

Chain: 
	push dword STDOUT
	call _GetStdHandle@4
	mov [handle], EAX
	push dword 0
	push dword leido
	push dword len1
	push dword message1
	push dword  [handle]
	call _WriteConsoleA@20
	push dword  STDIN
	call _GetStdHandle@4
	mov [handle], EAX
	push dword 0
	push dword longitud
	push dword 1515
	push dword [handle]
	call _ReadConsoleA@20
	push dword STDIN
	call _GetStdHandle@4
	mov [handle], EAX
	push dword 0
	push dword longitud
	push dword 1515
	push dword cad 
	push dword [handle]
	call _ReadConsoleA@20

	mov ESI, cad  ;We move the chain written to this register
Warning: ;We show that the chain is not correct

	push dword STDOUT
	call _GetStdHandle@4
	mov [handle], EAX
	push dword 0
	push dword leido
	push dword len2
	push dword message2
	push dword [handle]
	call _WriteConsoleA@20
	dec word[longitud] ;Borramos el CR
	dec word[longitud] ;Borramos el LF
	mov AX, word[longitud] ;Aqui guardaremos la longitud de la cadena 
	mov BX, 0  ;Counter of digits 
	mov CX, 10 ;We obtain the larg of measure 
	mov DX, 0  ;Residuos de las divisiones





IntegtoChain: ;We catch digit by digit
	mov CX, 10
	div CX ;We make the division DX:AX/ BX

	add DX, '0' ;The rest is saving in DX and the quotient AX we convert to integer

	push DX  ;We put on the top of the heap

	inc BX  ;We add the numbers of digits 

	mov DX, 0 ; ;DX=0 in order to have the division alright

	cmp AX, 0 ;We request if the process of the number is done
	jne IntegtoChain ;We didn´t do, We repeat


PrintDigito:   ;We print digit by digit from the heap
	pop DX
	mov[digito], DX
	push dword STDOUT
	call _GetStdHandle@4
	mov [handle], EAX
	push dword 0
	push dword leido
	push dword 1
	push dword digito
	push dword [handle]
	call _WriteConsoleA@20

	dec BX ;We have a digit less
	cmp BX, 0 ; We don't have digits
	jne PrintDigito ;We exit to the bucle

Exit: ;We finish the program calling to the exitprocess

	push dword 0
	call _ExitProcess@4