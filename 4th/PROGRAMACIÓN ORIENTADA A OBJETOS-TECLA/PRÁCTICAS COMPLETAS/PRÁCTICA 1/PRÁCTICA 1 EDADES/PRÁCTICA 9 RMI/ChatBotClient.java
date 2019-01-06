import java.rmi.*;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.event.*;
import java.util.*;

public class ChatBotClient extends JFrame implements ActionListener {

	static JLabel respuesta;
	JButton button;
	JTextField pregunta;
	static String string="";

	public ChatBotClient(){
		pregunta=new JTextField(20);
		respuesta=new JLabel();
		button=new JButton("Preguntar");
		button.addActionListener(this);

		setTitle("ChatBot 3000");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanel panel=new JPanel();
		panel.setLayout(new FlowLayout());
		panel.add(pregunta);
		panel.add(button);
		
		JPanel panel2=new JPanel();
		panel2.setLayout(new FlowLayout());
		panel2.add(respuesta);

		Container cp=getContentPane();
		cp.add(panel,BorderLayout.CENTER);
		cp.add(panel2,BorderLayout.SOUTH);

		setSize(300,150); setVisible(true);
	}

	public void actionPerformed (ActionEvent e){


		try{
			ChatBot c=(ChatBot) Naming.lookup("Calcular");
			string=pregunta.getText();
			String mensaje=c.chatear(string);
			respuesta.setText(mensaje);
			//System.out.println(mensaje);
		}catch(Exception ex){
        	System.out.println("falla pregunta");
		}
	}	
	
	public static void main (String args[]){
		ChatBotClient ch=new ChatBotClient();
	}
}

