import java.io.*;
import java.net.*;
import javax.swing.*;

public class Red {
  private Socket cliente;
  private ObjectInputStream oisNet;
  private ObjectOutputStream oosNet;
  private int puerto=9000;
  private LeeRed lee_Red;
    
  public Red(LeeRed lee_Red){  
    this.lee_Red=lee_Red;
    setUpNetworking();
  }

  public void setUpNetworking() { 
    int i=0;
    String host = JOptionPane.showInputDialog("Escriba direccion.IP", "localhost");
    while(i==0){	
      System.out.println("Esperando por el servidor . . ."); i=1;
      try{
        cliente=new Socket(host, puerto);
      } 
      catch ( IOException e){
        System.out.println("Fallo creacion Socket"); i=0;
      }
    }
    System.out.println("Connectado al servidor.");
    try{
      oisNet = getOISNet(cliente.getInputStream());
      oosNet = getOOSNet(cliente.getOutputStream()); 
    }
    catch (IOException e){
      e.printStackTrace();
      System.out.println("Error al crear los fujos de objeto"+e);
    }
    (new Thread( new IncomingReader(lee_Red, oisNet) )).start();
  }

  public void escribeRed(Object obj) {     
    try{
      Mensaje m=(Mensaje)obj;
      oosNet.writeObject(obj);
      System.out.println("escribe red "+ m.getTexto());        
      oosNet.flush();
    } 
    catch(IOException ex){ 
     ex.printStackTrace(); 
    }
  }

  ObjectOutputStream getOOSNet(OutputStream os) throws IOException {
    return new ObjectOutputStream(os);
  }
  
  ObjectInputStream getOISNet(InputStream is) throws IOException {
    return new ObjectInputStream(is);
  }
}
