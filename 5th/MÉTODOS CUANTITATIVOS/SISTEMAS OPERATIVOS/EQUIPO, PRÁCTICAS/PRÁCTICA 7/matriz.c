#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
typedef double *vector;
typedef vector *matriz;
#define N 10

matriz
nueva ()
{
  int i=0;
  matriz A = calloc (N, sizeof (vector));
  for (i = 0; i < N; ++i)
    A[i] = calloc (N, sizeof (double));
  return A;
}

bool
esCero (double x)
{
  return fabs (x) < 1e-8;
}

matriz
suma (matriz A, matriz B)
{
  int i=0;
  int j=0;
  matriz C = nueva ();
  for (i = 0; i < N; ++i)
    for (j = 0; j < N; ++j)
      C[i][j] = A[i][j] + B[i][j];
  return C;
}

matriz
multiplicacion (matriz A, matriz B)
{
  int i=0;
  int j=0;
  int k=0;
  matriz C = nueva ();
  for (i = 0; i < N; ++i)
    for (j = 0; j < N; ++j)
      for (k = 0; k < N; ++k)
	C[i][j] += A[i][k] * B[k][j];
  return C;
}

matriz
inversa (matriz A)
{
  int i=0;
  int j=0;
  int k=0;
  int l=0;
  matriz inv = nueva ();
  for (i = 0; i < N; ++i)
    inv[i][i] = 1;
  i = 0, j = 0;
  while (i < N && j < N)
    {
      if (esCero (A[i][j]))
	{
	  for (k = i + 1; k < N; ++k)
	    {
	      if (!esCero (A[k][j]))
		{
		  vector tmp = A[i];
		  A[i] = A[k];
		  A[k] = tmp;
		  tmp = inv[i];
		  inv[i] = inv[k];
		  inv[k] = tmp;
		  break;
		}
	    }
	}
      if (!esCero (A[i][j]))
	{
	  for (l = 0; l < N; ++l)
	    inv[i][l] /= A[i][j];
	  for (l = N - 1; l >= j; --l)
	    A[i][l] /= A[i][j];
	  for (k = 0; k < N; ++k)
	    {
	      if (i == k)
		continue;
	      for ( l = 0; l < N; ++l)
		inv[k][l] -= inv[i][l] * A[k][j];
	      for ( l = N; l >= j; --l)
		A[k][l] -= A[i][l] * A[k][j];
	    }
	  ++i;
	}
      ++j;
    }
  return inv;
}

matriz
matrizAleatoria ()
{
  int i=0;
  int j=0;
  matriz A = nueva ();
  for (i = 0; i < N; ++i)
    for (j = 0; j < N; ++j)
      A[i][j] = rand () % 10;
  return A;
}

void
writeFile (matriz A, char *nombre)
{
  int i=0;
  int j=0;
  FILE *fp = fopen (nombre, "w");
  for (i = 0; i < N; ++i)
    {
      for (j = 0; j < N; ++j)
	fprintf (fp, "%0.3lf ", A[i][j]);
      fprintf (fp, "\n");
    }
  fclose (fp);
}

void
printMatriz (matriz A)
{
  int i=0;
  int j=0;
  for (i = 0; i < N; ++i)
    {
      for (j = 0; j < N; ++j)
	printf ("%0.3lf\t", A[i][j]);
      printf ("\n");
    }
}


void
writePipe (int tuberia, matriz A)
{
  int i=0;
  int j=0;
  int k=0;
  for (i = 0; i < N; i++)
    for (k = 0; k < N; k++)
      write (tuberia, &A[i][k], sizeof (double));
}

void
readPipe (int tuberia, matriz A)
{
  int i=0;
  int j=0;
  int k=0;
  for (i = 0; i < N; i++)
    for (k = 0; k < N; k++)
      read (tuberia, &A[i][k], sizeof (double));
}
