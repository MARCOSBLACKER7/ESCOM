#include <stdio.h>
#include <stdlib.h>
int main ()
{
unsigned char supervision[][5] = { "RR", "RNR", "RES", "SREJ" };
unsigned char UC [][5] = {"UI","SIM", "", "SARM", "NP","","", "SARME", "PISC","","", "SABM","","","", "SABME", "SNRM","","", "RSET","","","", "XID","","","", "SNRME"};
unsigned char UR [][5] = {"UI","RIM", "", "SARM", };
unsigned char t[] = {0x00, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x, 0x,};
if (t[12]<<8 | t[13] <= 1500) //Trama LLC
switch (t[16] & 3)
{
	case 0: case 2:
	if (e = 1)
		printf("T-I, N(s)= %d, N(r) = %d\n", t[16]>>1, t[17]>>1);
	else
		printf("T-I, N(s)= %d, N(r) = %d\n", (t[16]>>1)&7, t[16]>>5);
	case 1:
	if (e = 0)
		printf("T-S %s, N(r) = %d\n", supervision[(t[16]>>2)&3], t[16]>>5);
	else 
		printf("T-S %s, N(r) = %d\n", supervision[(t[16]>>2)&3], t[17]>>1);
	case 3:
	if (t[16] & 16)
		if(t[15] & 1)
			printf("T-U, %s, f\n", UR[((t[16]>>2)&3) + ((t[16]>>3)&28)]);
		else
			printf("T-U, %s, p\n", UC[((t[16]>>2)&3) + ((t[16]>>3)&28)]);
}
}
