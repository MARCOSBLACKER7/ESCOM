#include <stdio.h>

#define TAM 50

char string[TAM];
char letra;

int BuscaCaracter(char*,char);

int main (void)
{
    printf("Introduce una cadena de caracteres: ");
    scanf("%s",string);
    printf("\nIntroduce caracter a buscar: ");
    fflush(stdin); scanf("%c",&letra);
    if ( BuscaCaracter(string,letra) != -1 ) { printf("La letra esta en la posicion %d de la cadena.\n",BuscaCaracter(string,letra)); } else { printf("Letra no encontrada.\n"); }
    return 0;
}

int BuscaCaracter (char *cadena, char caracter)
{
    for (int i=0;i<TAM;i++)
    { 
        while ( string[i] != '\0' ) { if ( string[i] == caracter ) { return i+1; } }
    }
}
