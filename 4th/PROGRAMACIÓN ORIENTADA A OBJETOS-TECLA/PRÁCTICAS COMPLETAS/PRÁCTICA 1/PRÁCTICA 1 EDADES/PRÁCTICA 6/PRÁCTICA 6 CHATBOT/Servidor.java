//librerías
import java.net.*;
import java.io.*;


public class Servidor{ //arreglos de preguntas la cual cada numero del arreglo corresponde número a número
	private static String[] preguntas = {"como te llamas","a que te dedicas","como estas","estudias ingles","en que nivel de ingles vas", "en donde vives","a que hora te despiertas","tienes novia","como se llama tu novia"};
	private static String[] respuestas = {"Marcos Oswaldo Vazquez","Estudiante de ESCOM","Super bien","Of course my friend","Intermedio 5" ,"Ticoman" ,"a las 9","si","Fernanda"};


	static String findMatch(String str) { //comparador de lo que hay en la caja de texto a lo que hay en un numero de la posición del arreglo
	  	String result = ""; //reciber la cadena
	  	for(int i = 0; i < preguntas.length; ++i) //ciclo que recorre la cadena
	  		if(preguntas[i].equalsIgnoreCase(str)) { //si la pregunta es exactamente igual a lo escrito 
	        	result = respuestas[i];
	  			break;
	      	}
		if(result=="")  //caso contrario
	    	result="No tengo esa respuesta en mi repertorio";  
		return result; 
	}

	public static void main(String[] args){
		try{
			ServerSocket ss= new ServerSocket(1234);
			System.out.println("Servidor Iniciado ..."+ss.getInetAddress()+":"+ss.getLocalPort()+" Esperando conexion ...");
			
			while(true){

				Socket cl=ss.accept(); //Recibir la conexion
				System.out.println("cliente conectado: "+cl.getInetAddress()+cl.getPort());

				ObjectInputStream ois= new ObjectInputStream(cl.getInputStream());
				ObjectOutputStream oos= new ObjectOutputStream(cl.getOutputStream());
				while(true){
					String cadena=(String)ois.readObject();//pregunta del cliente
					System.out.println("Llego: "+ cadena);
					oos.writeObject("Marquitos: "+findMatch(cadena));
				}
			}
		}catch(IOException|ClassNotFoundException e){}		
	}
}
