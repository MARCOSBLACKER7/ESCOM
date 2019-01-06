
; load the array
0   li r0,  0000 0000 0001 0111 ; 23 = 0x0017 
1   swi r0, 0000 0000 0000 1010 ; 10 = 0x000A 

2   li r0,  0000 0000 1000 0010 ; 120 = 0x0082
3   swi r0, 0000 0000 0000 1011 ; 11  = 0x000B
   
4   li r0,  0000 0000 0100 0110 ; 70 = 0x0046
5   swi r0, 0000 0000 0000 1100 ; 12 = 0x000C
   
6   li r0,  0000 0001 0000 0100 ; 260 = 0x0104
7   swi r0, 0000 0000 0000 1101 ; 13 = 0x000D
   
8   li r0,  1111 1111 1101 0011 ; -45 = 0xFFD3
9   swi r0, 0000 0000 0000 1110 ; 14 = 0x000E
   
10   li r0,  0000 0000 1011 0100 ; 23 = 0x00B4
11   swi r0, 0000 0000 0000 1111 ; 15 = 0x000F
 
12   li r0, 0x0000 ; i
   
13   li r2, 0x0005 ; n - 1 = 5
  
begin_for_1: ; 14
14   bgeti r2, r0, end_for_1 ; if r0 >= r2 iff if i >= n -1 ; delta = 13 = 0x00d cambio
   
15   li r1, 0x0000 ; j
16   sub r3, r2, r0 ; r3 = r2 - r0 iff r3 = n - 1 - i;
   
17   begin_for_2:  
17   bgeti r3, r1, end_for_2 ; if r1 >= r3 goto end_for_2 iff if j >= n - 1 - i ; delta = 8 = 0x0008 cambio
   
18   lw r4, 0x00A(r1) ; r4 = mem[10 + j]
19   lw r5, 0x00B(r1) ; r5 = mem[10 + 1 + j]
   
20   bleti r5, r4, end_if ; if r4 <= r5 iff if mem[10 + j] <= mem[ 10 + j + 1 ] ; delta 3 = 0x003 cambio
   
    ; swap values
;    21   xor r4, r4, r5 ; r4 = r4 xor r5
;    22   xor r5, r4, r5 ; r5 = r4 xor r5
;    23   xor r4, r4, r5 ; r4 = r4 xor r5
   
    ; load them in the mmap again
21   sw r4, 0x00B(r1) ; mem[r1 + 11] = r4 iff mem[j + 10] = mem[10 + j + 1]
22   sw r5, 0x00A(r1) ; mem[r1 + 10] = r5 iff mem[j + 11] = mem[10 + j]
   
23  end_if:
   
23  addi r1, r1, 0x0001 ; cambio
24  b begin_for_2 ; b 0x0011 ; cambio
25  end_for_2:
   
25 addi r0, r0, 0x0001 ; cambio
26 b begin_for_1  ; b 0x000E
27    end_for_1:
   
27   done: 
27  	nop       ; 
29   	b done    ; b 0x001B
  