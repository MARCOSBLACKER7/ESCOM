import java.util.Scanner;
import java.util.regex.*;
import java.util.regex.Pattern.*;
import java.util.regex.Matcher.*;

/* Autor: Reyes Medrano Alexis Daniel
   Boleta: 2013081006
   Fecha: 18 de Marzo del 2018
   Grupo: 2CM4
   Practica 2
   Etiqueta en HTML de apertura y cierre*/
   
public class web{
	public static void main (String s[]){
		String cadena = "";
		int n, rep =1;
		Scanner scan = new Scanner(System.in);
		Scanner scan1 = new Scanner(System.in);

		do{
			System.out.println("Ingrese las etiquetas que desee");
			cadena = scan.nextLine();
			Pattern p = Pattern.compile ("<[\\w&&[^0-9]]+>[\\s\\w\\s]*</[\\w&&[^0-9]]+>");
			Matcher m = p.matcher (cadena);
			if (m.matches ()){
				System.out.println("Valida");
				System.out.println("Quieres evaluar otra expresion? 1=si & 2=nel");
				n = scan.nextInt();
				if(n==1) {
					rep=1;
					scan.nextLine();
				}
				else if (n==2) 
					rep=0;
			}
			else {
				System.out.println("Te fallo :c");
				System.out.println("Quieres evaluar otra expresion? 1=si & 2=nel");
				n = scan.nextInt();
				if(n==1) {
					rep=1;
				scan.nextLine();
			}
				else if (n==2) 
					rep=0;
			}
	} while(rep == 1);
}


}