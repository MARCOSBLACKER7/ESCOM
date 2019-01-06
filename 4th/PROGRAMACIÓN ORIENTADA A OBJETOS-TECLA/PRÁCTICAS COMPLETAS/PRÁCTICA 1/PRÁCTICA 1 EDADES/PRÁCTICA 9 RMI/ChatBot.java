import java.rmi.*;

public interface ChatBot extends Remote{
	String chatear(String str) throws RemoteException;
}