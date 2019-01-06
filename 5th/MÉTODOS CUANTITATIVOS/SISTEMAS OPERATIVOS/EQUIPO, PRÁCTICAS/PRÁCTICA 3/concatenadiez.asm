STDIN     equ dword -10
STDOUT    equ dword -11

segment .data
    mensaje1 db 'Ingresa 10 cadenas: ', 0xD, 0xA
    len1 equ $- mensaje1
    mensaje2 db 'Resultado: '
    len2 equ $- mensaje2
    mensaje3 db 'Sentido inverso: '
    len3 equ $- mensaje3
    mensaje4 db 'Longitud: '
    len4 equ $- mensaje4
    crlf db 0xD, 0xA
    i db 0
    longitud dd 0
    leido db 0
    handle dd 0

segment .bss
    cad resb 101
    resultado resb 1000
    reversa resb 1000
    longitudStr resb 4

segment .text
    global _start
    extern    _GetStdHandle@4
    extern    _WriteConsoleA@20
    extern    _ReadConsoleA@20
    extern    _ExitProcess@4

_start:

mov EDI, resultado          ;EDI the last chain
mov byte[i], 0              ;We use the variable i in order to count how many chains we write
mov dword[longitud], 0      ;We save the large to the last chain
push dword STDOUT
call _GetStdHandle@4
mov [handle], EAX
push dword 0
push dword leido
push dword len1
push dword mensaje1
push dword [handle]
call _WriteConsoleA@20

pedirCadenas:
    push dword STDIN
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword 101
    push dword cad
    push dword [handle]
    call _ReadConsoleA@20

    mov ESI, cad            ;ESI es un apuntador a la cadena leida
    call copiarCadena
    inc byte[i]             ;Incrementamos i
    cmp byte[i], 10
    je imprimirResultado    ;Si i==10, ya acabamos de leer
    jne pedirCadenas        ;Si i!=10, seguimos leyendo

copiarCadena:
    mov DL, byte[ESI]       ;Copiamos byte a byte la cadena leida a la final
    mov byte[EDI], DL
    inc EDI                 ;Incrementamos
    inc ESI                 ;ambos apuntadores
    inc dword[longitud]     ;Incrementamos la longitud final
    cmp byte[ESI], 0xD      ;Si aun no estamos en el final de la cadena actual,
    jne copiarCadena        ;seguimos copiando
    ret                     ;Volvemos al bloque de instrucciones anterior

imprimirResultado:          ;Imprimimos la concatenacion de las cadenas
    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword len2
    push dword mensaje2
    push dword [handle]
    call _WriteConsoleA@20

    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword [longitud]
    push dword resultado
    push dword [handle]
    call _WriteConsoleA@20

    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword 2
    push dword crlf
    push dword [handle]
    call _WriteConsoleA@20

    mov ESI, reversa        ;Ahora ESI es un apuntador a la cadena invertida
    dec EDI                 ;EDI ahora apunta justo al ultimo caracter de la cadena final

invertir:
    mov DL, byte[EDI]       ;Copiamos el ultimo caracter de la cadena final
    mov byte[ESI], DL       ;al primer byte de la cadena invertida
    dec EDI                 ;Retrocedemos en la cadena final
    inc ESI                 ;Y avanzamos en la cadena invertida
    cmp EDI, resultado
    jl imprimirReversa      ;Si ya estamos una posicion antes del apuntador a resultado, ya acabamos
    jge invertir            ;Si no, todavia nos falta por copiar
    ret

imprimirReversa:            ;Imprimimos la cadena invertida
    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword len3
    push dword mensaje3
    push dword [handle]
    call _WriteConsoleA@20

    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword [longitud]
    push dword reversa
    push dword [handle]
    call _WriteConsoleA@20

    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword 2
    push dword crlf
    push dword [handle]
    call _WriteConsoleA@20

    mov AX, word[longitud]  ;Aqui guardaremos la longitud de la cadena
    mov BX, 10              ;Nos servira para extraer los digitos de la longitud
    mov CX, 0               ;Contador de digitos de la longitud
    mov DX, 0               ;Residuo de las divisiones
    mov EDI, longitudStr    ;Apuntador a la cadena donde se guardara el numero

enteroACadena:              ;Obtenemos digito por digito
    mov BX, 10              ;Divisor
    div BX                  ;Hacemos la division DX:AX / BX
    add DX, '0'             ;El residuo se almacena en DX y el cociente en AX, lo convertimos a caracter
    push DX                 ;Lo ponemos en el tope de la pila
    inc CX                  ;Incrementamos el numero de digitos
    mov DX, 0               ;Regresamos DX a 0 para que la division se haga correctamente
    cmp AX, 0               ;Preguntamos si ya terminamos de procesar el numero
    jne enteroACadena       ;No hemos terminado, repetimos

guardarDigitos:
    pop DX
    mov [EDI], DX
    inc EDI
    dec CX                  ;Ya tenemos un digito menos que procesar
    cmp CX, 0               ;Si ya no tenemos digitos pendientes,
    jne guardarDigitos      ;nos salimos del bucle

imprimirLongitud:
    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword len4
    push dword mensaje4
    push dword [handle]
    call _WriteConsoleA@20

    push dword STDOUT
    call _GetStdHandle@4
    mov [handle], EAX
    push dword 0
    push dword leido
    push dword 4
    push dword longitudStr
    push dword [handle]
    call _WriteConsoleA@20

salida:
    push dword 0
    call _ExitProcess@4