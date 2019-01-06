import java.util.Stack;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.EmptyStackException;
import java.io.*;

public class AuPila extends JFrame implements ActionListener{

	Stack<Character> pila = new Stack<Character>();
	JTextField cadena;
	JLabel resultado;
	JButton verifica;

	public AuPila() {
		cadena=new JTextField(30);
		resultado=new JLabel();
		verifica=new JButton("verifica");
		verifica.addActionListener(this);

		setTitle("Automata de Pila");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JPanel panel=new JPanel();
		panel.setLayout(new FlowLayout());
		panel.add(cadena);
		panel.add(verifica);
		
		JPanel panel2=new JPanel();
		panel2.setLayout(new FlowLayout());
		panel2.add(resultado);

		Container cp=getContentPane();
		cp.add(panel,BorderLayout.CENTER);
		cp.add(panel2,BorderLayout.SOUTH);

		setSize(380,150); setVisible(true);
	}

	public void actionPerformed(ActionEvent e){
		String c=cadena.getText();
		vaciar(pila);
		boolean flag=false;
		try{
			if(validar(c)){
				for (int n=0;n<c.length();n++ ) {
					char a = c.charAt (n);
					if (a=='a'&& pila.empty()&&flag==false) {
						pila.push('A');
						System.out.println(pila);
						flag=true;
					}
					else if(a=='a'&& pila.peek()=='A'){
						pila.push('A');
						System.out.println(pila);
						//respuesta.setText(pila);
					}
					else if (a=='b'&&pila.peek()=='A') {
						pila.pop();
						System.out.println(pila);
						//respuesta.setText(pila);
					}
					else if (a=='a'&&pila.empty()&&flag) {
						resultado.setText("Cadena rechazada");
					}
					else if (a=='b'&&pila.empty()) {
						resultado.setText("Cadena rechazada");
					}
					else 
						resultado.setText("Cadena rechazada");
					
				}
				if (pila.empty()) 
					resultado.setText("Cadena aceptada");
				else
					resultado.setText("Cadena rechazada");
			}
			else
				resultado.setText("EL lenguaje no pertenece al automata");
		}
		catch(EmptyStackException ex){
			resultado.setText("Cadena rechazada");
		}
		System.out.println("----------------------------");
	}

	public boolean validar(String s){
		for (int n=0;n<s.length() ;n++ ) {
			 char c = s.charAt (n);
			 if (c!='a'&&c!='b') 
				return false;
			 				
		}
		return true;
	}

	public void vaciar(Stack pila){
		while(pila.empty()==false)
			pila.pop();
	}

	public static void main(String[] args) {
		AuPila a= new AuPila();	
	}
}