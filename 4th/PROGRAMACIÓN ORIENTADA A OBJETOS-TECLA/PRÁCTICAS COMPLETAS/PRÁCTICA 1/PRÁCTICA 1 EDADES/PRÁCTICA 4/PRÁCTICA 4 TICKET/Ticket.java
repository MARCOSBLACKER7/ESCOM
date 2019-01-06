/*
HECHO POR MARCOS OSWALDO VAZQUEZ MORENO 2016601777
*/
public class Ticket implements Runnable {
	Thread T;
	String cad, cadaux = "";
	int count;
	int sleepTime;
public Ticket(String s, int howMany, int sleep){
	count=howMany;
	cad=s;
	sleepTime=sleep;
	T=new Thread(this);
	T.start();
	}
	public void run(){
		System.out.println("\n");
		while(count>0){
			for (int i = 0; i < cad.length(); i++)
			{
				cadaux += cad.charAt((i + 1) % cad.length ());
			}
			System.out.println(cad);
			cad = cadaux;
			cadaux = "";	
	try{
			Thread.sleep(sleepTime);
			} catch (Exception e) {
			return;
			}
		}
		System.out.println("\n");
	}
	public static void main(String args[]){
	new Ticket("VAMOS VAMOS AMERICA ESTA NOCHE TENEMOS QUE GANAR ", 80, 100);
	//new Printer_("Pong", 5, 500);
	}
}
