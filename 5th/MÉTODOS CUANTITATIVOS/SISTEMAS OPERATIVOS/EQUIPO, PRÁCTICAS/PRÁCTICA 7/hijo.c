#include <stdio.h>
#include <windows.h>

int main(){
 HANDLE hSemaforo;
 int i=1;
 if((hSemaforo=OpenSemaphore(SEMAPHORE_ALL_ACCESS, FALSE, "Semaforo"))==NULL){
  printf("Falla al invocer OpenSemaphore: %d\n", GetLastError());
  return -1;
 }
 while(i<4){
  WaitForSingleObject(hSemaforo, INFINITE);
  printf("Soy el hijo entrando %i de 3 veces al semaforo\n", i);
  Sleep(5000);
  if(!ReleaseSemaphore(hSemaforo, 1, NULL)){
  	printf("Falla al invocar ReleaseSemaphore: %d\n", GetLastError());
  }
  printf("Soy el hijo liberando %i de 3 veces al semaforo\n", i);
  Sleep(5000); 
  i++;
 }
 return 0;
}