import java.rmi.*;
import java.rmi.server.*;
import java.net.*;

public class ChatBotImpl extends UnicastRemoteObject implements ChatBot{

	String[] preguntas = {"donde vives","como te llamas","estas estudiando","vives cerca","ya hiciste todas tus practicas",
		"eres un alma penante","alan turing era homosexual","cuantas materias cursas","cuantos años tienes","quieres ser mi amigo"};

	String[] respuestas={"cerca de aqui lejos de alla","Es un secreto","clarooo","si","todavia no",
		"investigalo","dice la historia que sí","5 y el ingles","21","Podemos intentarlo"};

	public ChatBotImpl() throws RemoteException{
		super();
	}
	public String chatear (String str) throws RemoteException{
		String e = "No tengo esa respuesta en mi repertorio";
		String result = "";
	  	for(int i = 0; i < preguntas.length; ++i)
	  		if(preguntas[i].equalsIgnoreCase(str)) {
	        	result = respuestas[i];
	  		break;
	      	}
	      	else{
	  			result = e;
	  		}
		return result;
	}
	public static void main(String s[]){
		try{
			ChatBotImpl c=new ChatBotImpl();
			Naming.rebind("Calcular",c);
		}catch(RemoteException re){
		 System.out.println("Exception in ChatBotImpl.main: " + re);}
		 catch(MalformedURLException e) {
      	 System.out.println("MalformedURLException en ChatBotImpl.main: " + e);
   		}
   	}
}