#include <stdio.h>
#include <windows.h>

int main(int argc, char *argv[]){
 
 STARTUPINFO si;
 PROCESS_INFORMATION pi;
 HANDLE hSemaforo;
 int i=1;
 ZeroMemory(&si, sizeof(si));
 si.cb=sizeof(si);
 ZeroMemory(&pi, sizeof(pi));
 if(argc!=2){
  printf("Usar:%s Nombre_programa_hijo\n", argv[0]);
  return;
 }
 if((hSemaforo=CreateSemaphore(NULL, 1 , 1, "Semaforo"))==NULL){
  printf("Fallo al invocar CreateSemaphore: %d\n", GetLastError());
  return -1;
 }
 if(!CreateProcess(NULL, argv[1], NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi)){
  printf("Fallo al invocar CreateProcess: %d\n", GetLastError());	
  return -1;
 }
 while(i<4){
  WaitForSingleObject(hSemaforo, INFINITE);
  printf("Soy el padre entrando %i de 3 veces al semaforo\n", i);
  Sleep(5000);
  if(!ReleaseSemaphore(hSemaforo, 1, NULL)){
  	printf("Falla al invocar ReleaseSemaphore: %d\n", GetLastError());
  }
  printf("Soy el padre liberando %i de 3 veces al semaforo\n", i);
  Sleep(5000);
  i++;
 }
 CloseHandle(pi.hProcess);
 CloseHandle(pi.hThread);
}