#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(void){
int id_proc, x=100, y=10, z=5;
 	if ((id_proc=fork())==0){
 		x+=z;
 		printf("Valor =%i\n",x);
 			if((id_proc=fork())==0){
 				y+=x;
 				printf("Valor y=%i\n",x);
 					if ((id_proc=fork())==0){
 						y+=x;
 						printf("Valor y=%i\n",y);
 					}
 					z*=y;
 					printf("Valor z=%i\n",z);
 						if((id_proc=fork())==0){
 							y*=x;
 							printf("Valor y=%i\n, y");
 							if((id_proc=fork())==0){
	 							x+=z;
	 							printf("Valor x=%i\n",x);
 							}
 						}
 					}
 					z+=y;
 					printf("Valor z=%i\n", z);
 					if((id_proc=fork())==0){
 						y-=x;
 						printf("Valor y=%i\n",y);
 						if((id_proc=fork())==0){
 							z*=y;
 							printf("Valor z=%i\n",z);
 							if((id_proc=fork())==0){
 								x-=y;
 								printf("Valor x=%i\n", x);
 								exit(0);
 							}
 							if((id_proc=fork())==0){
 								y-=z;
 								printf("Valor y=%i\n", y);
 								if((id_proc=fork())==0){
 								x*=y;
 								printf("Valor x=%i\n,x");
 								exit(0);
 							}
 							exit(0);
 						}
 					if((id_proc=fork())==0){
 						z+=x;
 						printf("Valor z=%i\n", z);
 						exit(0);
 						}
 					}
 				if((id_proc=fork())==0){
 					z=x+y;
 					printf("Valor z=%i\n, z");
 				}
 			}
 	}

}
