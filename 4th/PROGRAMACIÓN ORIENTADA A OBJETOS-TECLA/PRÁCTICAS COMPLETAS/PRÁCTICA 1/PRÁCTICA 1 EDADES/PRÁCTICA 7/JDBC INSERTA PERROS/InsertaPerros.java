import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import java.sql.*;
import java.util.*;

public class InsertaPerros extends JFrame implements ActionListener
{
	JLabel eNombre;
	JLabel eRaza;
	JLabel eEdad;
	JLabel eGenero;
	JTextField cNombre;
	JTextField cRaza;
	JTextField cEdad;
	JTextField cGenero;
	JButton bConectar;
	JButton bInsertar;

	//Variables de conexión
	Connection conex;
	public InsertaPerros()
	{
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setBounds(25,10,350,250);
		setLayout(null);
		setTitle("Inserta Perros a la base de datos");
		setResizable(false);

		eNombre = new JLabel("Nombre");
		eNombre.setBounds(10,10,100,30);
		add(eNombre);

		eRaza = new JLabel("Raza");
		eNombre.setBounds(10,45,100,30);
		add(eRaza);

		eEdad = new JLabel("Edad");
		eNombre.setBounds(10,80,100,30);
		add(eEdad);

		eGenero = new JLabel("Genero");
		eNombre.setBounds(10,115,100,30);
		add(eGenero);

		cNombre = new JTextField();
		cNombre.setBounds(110,10,200,30);
		add(cNombre);

		cRaza = new JTextField();
		cRaza.setBounds(110,45,200,30);
		add(cRaza);

		cEdad = new JTextField();
		cEdad.setBounds(110,80,200,30);
		add(cEdad);

		cGenero = new JTextField();
		cGenero.setBounds(110,115,200,30);
		add(cGenero);

		bConectar = new JButton("Conectar");
		bConectar.setBounds(60,160,100,30);
		bConectar.addActionListener(this);
		add(bConectar);

		setVisible(true);

	} 

	public void conectar()
	{
		String url = "jdbc:mysql://localhost:3307/", dbName = "perros";
		try{
				Class.forName("com.mysql.jdbc.Driver");
				conex=DriverManager.getConnection(url+dbName, "root","root");
		}
		catch(Exception ex){System.out.println(ex); System.exit(0);}
	}

	public void insertar(String nom, String raz, String edad, String genero)
	{
		try{
				Statement statement=conex.createStatement();
				String insercion = "INSERT INTO canes VALUES(\""+ nom +"\",\""+raz+"\","+edad+",\""+genero+"\")";
				int ins=statement.executeUpdate(insercion);

		} catch(Exception ex){System.out.println(ex); System.exit(0);}
	}

	@Override
	public void actionPerformed(ActionEvent e){
			if(e.getSource() == bConectar)
			{
				conectar();
			}
			else if(e.getSource() == bInsertar)
			{
				insertar(cNombre.getText(),cRaza.getText(),cEdad.getText(),cGenero.getText());
			}		
	}

	public static void main(String args[])
	{
		InsertaPerros insp = new InsertaPerros();
	}
}