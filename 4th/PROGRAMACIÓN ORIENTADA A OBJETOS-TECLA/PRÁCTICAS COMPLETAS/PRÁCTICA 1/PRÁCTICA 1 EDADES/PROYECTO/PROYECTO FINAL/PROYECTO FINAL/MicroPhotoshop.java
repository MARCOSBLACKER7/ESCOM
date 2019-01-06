import javax.swing.JOptionPane; 
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.Kernel;
import java.awt.GridLayout;
import javax.swing.BoxLayout;
import java.awt.Insets;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.File;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSlider;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTextField;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.MalformedURLException;
import java.awt.Image;
import javax.swing.SwingConstants;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.image.ConvolveOp;

/*
06 DE JUNIO DE 2018

PROYECTO DE MICROPHOTOSHOP QUE USA COMO BASE EL PROCESAMIENTO DE IMAGENES
PUEDES AGREGAR UNA IMAGEN DESDE TUS ARCHIVOS Y EDITARLA A PLACER, PARA DESPUES
GUARDARLA CON OTRO NOMBRE.

ELABORADO POR VAZQUEZ MORENO MARCOS OSWALDO 2016601777
ESCUELA SUPERIOR DE COMPUTO
INSTITUTO POLITECNICO NACIONAL
PROGRAMACIÓN ORIENTADA A OBJETOS GRUPO 2CM3 

*/

//Clase MicroPhotoshop
public class MicroPhotoshop extends JFrame implements ActionListener, ChangeListener{
	//DECLARACIÓN DE BOTONES, ETIQUETAS, INSERCION DE TEXTO, IMAGENES, FILTROS
	int slider;
	ImageIcon imagenSeleccionada,otroicon,titulo;
	JLabel imgOr, imgMod;
	JTextField txtNombreImg;
	BufferedImage imgsel;
	JButton grises,sepia,azul,rojo,verde,bn, negativo, cuartear,brillo,posterizar,seg,seg2, rgbtogbr, warhol, info,seleccionar,guardar;
	 String extension;
	 BufferedImage imagen;
	 JPanel efectos;
	 JSlider spromedio;
	 Filtros f = new Filtros();
	 
	//CONSTRUCTOR
	public MicroPhotoshop() {
		
		extension ="JPG";
		JPanel pprincipal = new JPanel(); // CREACION DEL PANEL
		pprincipal.setLayout(new BorderLayout());
		JPanel ptitulo = new JPanel();
		setTitle("MICROPHOTOSHOP 3000");
		
		
		efectos= new JPanel(new GridLayout(2, 1, 1, 10));
		sepia = new JButton();
		sepia.setIcon(new ImageIcon("sepia.jpg"));

		
		grises = new JButton();
		grises.setIcon(new ImageIcon("grises.jpg"));


		azul = new JButton();
		azul.setIcon(new ImageIcon("azul.jpg"));
		
		verde = new JButton();
		verde.setIcon(new ImageIcon("verde.jpg"));
		
		rojo = new JButton();
		rojo.setIcon(new ImageIcon("rojo.jpg"));
		
		negativo = new JButton();
		negativo.setIcon(new ImageIcon("negativo.jpg"));
		
		cuartear = new JButton();
		cuartear.setIcon(new ImageIcon("cuartear.jpg"));
		
		bn =  new JButton();
		bn.setIcon(new ImageIcon("bn.jpg"));


		
		brillo = new JButton();
		brillo.setIcon(new ImageIcon("brillo.jpg"));
		
		posterizar = new JButton();
		posterizar.setIcon(new ImageIcon("posterizar.jpg"));
		
		seg= new JButton();
		seg.setIcon(new ImageIcon("seg.jpg"));
		
		seg2 = new JButton();
		seg2.setIcon(new ImageIcon("seg2.jpg"));
		
		rgbtogbr = new JButton();
		rgbtogbr.setIcon(new ImageIcon("rgbtogbr.jpg"));
		
		warhol = new JButton();
		warhol.setIcon(new ImageIcon("warhol.jpg"));
		
		info = new JButton();
		info.setIcon(new ImageIcon("about.jpg"));
		
		efectos.add(sepia);
		efectos.add(azul);
		efectos.add(verde);
		efectos.add(rojo);
		efectos.add(negativo);
		efectos.add(cuartear);
		efectos.add(bn);
		efectos.add(grises);
		efectos.add(brillo);
		efectos.add(posterizar);
		efectos.add(seg);
		efectos.add(seg2);
		efectos.add(rgbtogbr);
		efectos.add(warhol);
		efectos.add(info);
		JPanel pimagenes = new JPanel(new BorderLayout());
		JSplitPane split = new JSplitPane();
		split.setResizeWeight(0.5);
		JPanel pimagenoriginal = new JPanel();
		imgOr = new JLabel();
		pimagenoriginal.add(imgOr);
		JScrollPane spimgoriginal = new JScrollPane(pimagenoriginal);
		split.setLeftComponent(spimgoriginal);
		JPanel pimagengrises = new JPanel();
		imgMod = new JLabel();
		pimagengrises.add(imgMod);
		JScrollPane spimggrises = new JScrollPane(pimagengrises);
		split.setRightComponent(spimggrises);

		pimagenes.add(split);
				
		JPanel pselector = new JPanel();
		txtNombreImg = new JTextField(30);
		seleccionar = new JButton("Seleccionar");
		guardar = new JButton("Guardar");
		seleccionar.addActionListener(this);
		sepia.addActionListener(this);
		guardar.addActionListener(this);
		grises.addActionListener(this);
		azul. addActionListener(this);
		verde.addActionListener(this);
		rojo.addActionListener(this);
		negativo.addActionListener(this);
		cuartear.addActionListener(this);
		bn.addActionListener(this);
		brillo.addActionListener(this);
		posterizar.addActionListener(this);
		seg.addActionListener(this);
		seg2.addActionListener(this);
		rgbtogbr.addActionListener(this);
		warhol.addActionListener(this);
		info.addActionListener(this);
		pselector.add(txtNombreImg);
		pselector.add(seleccionar);
		pselector.add(guardar);
		
		JPanel pescalar = new JPanel();
		pescalar.setLayout(new BoxLayout(pescalar, BoxLayout.Y_AXIS));
		spromedio = new JSlider(0, 255);
		spromedio.setValue(2);
		spromedio.setOrientation(SwingConstants.VERTICAL);
		spromedio.addChangeListener(this);
	

		pescalar.add(spromedio);

		pprincipal.add(ptitulo, BorderLayout.WEST);
		pprincipal.add(pimagenes, BorderLayout.CENTER);
		pprincipal.add(pselector, BorderLayout.SOUTH);
		pprincipal.add(efectos, BorderLayout.NORTH);
		pprincipal.add(pescalar,BorderLayout.EAST);
		add(pprincipal);

		setVisible(true);

		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setBounds(0, 0, 1300, 1000);
		setLocationRelativeTo(null);
	}
	
	public void stateChanged(ChangeEvent arg0) {
		 
		if(slider==1){
			
				Image img = new ImageIcon(f.aplicarFiltroGrises(imgsel,spromedio)).getImage(); //convertimos icon en una imagen
					
				
				if (img != null) {
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					ImageIcon otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
		
		
				}
			}
		if(slider==2){
			
				Image img = new ImageIcon(f.aplicarFiltroBrillo(imgsel,spromedio)).getImage(); //convertimos icon en una imagen
					
				
				if (img != null) {
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					ImageIcon otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
		
		
				}
			}
		if(slider==3){
			
				Image img = new ImageIcon(f.aplicarFiltroPos(imgsel,spromedio)).getImage(); //convertimos icon en una imagen
					
				
				if (img != null) {
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					ImageIcon otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
		
		
				}
			}
		
		
	}
	public void actionPerformed(ActionEvent ee) {
					
				JButton x=(JButton)ee.getSource();
				JFileChooser selector = new JFileChooser("C:/Users/Z480/Documents");
				
				
	if(x==seleccionar){
			int r = selector.showOpenDialog(null); //ABRE CARPETAS PARA SELECCIONAR LA IMAGEN
				if (r == JFileChooser.APPROVE_OPTION) { //CARGAS EL ARCHIVO 
					try {
						imgsel = ImageIO.read(selector.getSelectedFile());
						imagenSeleccionada = new ImageIcon(imgsel); //GENERA ICONO DENTRO DE LA VENTANA DE DIALOGO 
						//imgOr.setIcon(imagenSeleccionada);
					Image img = imagenSeleccionada.getImage(); //CONVERTIMOS EL ICONO EN UNA IMAGEN
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //LE DAMOS UNA NUEVA DIMENSION A LA IMAGEN
					ImageIcon otroicon = new ImageIcon(otraimg); //SI SE SELECCIONA OTRA IMAGEN
					imgOr.setIcon(otroicon);
						
					} catch (IOException e) {
						
						e.printStackTrace();
					}
		}}

		//GUARDADO DE LA NUEVA IMAGEN
	if(x==guardar){
			Image source = otroicon.getImage();
			int w = source.getWidth(null);
			int h = source.getHeight(null);
			BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			Graphics2D g2d = (Graphics2D)image.getGraphics();
			g2d.drawImage(source, 0, 0, null);
			g2d.dispose();
		
			int s = selector.showSaveDialog(null);
			
			if (s == JFileChooser.APPROVE_OPTION) {
			File archivo=selector.getSelectedFile();

     try {
				
      ImageIO.write(image, "jpg", archivo); //EXTENSION JPG
	  JOptionPane.showMessageDialog (  null, "Image saved succesfully" ); //MENSAJE
	  
     } catch (IOException e) {
      
      e.printStackTrace();
     }
	 
    }
			}	

			//FILTRO SEPIA
	if(x==sepia){
					Image img = new ImageIcon(f.aplicarFiltroSepia(imgsel)).getImage(); //CONVERTIMOS ICON EN UNA IMAGEN
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
				
				}
				
			//FILTRO GRISES
	if(x==grises){
				JOptionPane.showMessageDialog (  null, "Utilice la barra de tonalidad" ); //MENSAJE 
				slider = 1;
			}
			//FILTRO DE BRILLO	
			
	if(x==brillo){
				JOptionPane.showMessageDialog (  null, "Utilice la barra de tonalidad" );
				slider = 2;
				
			}

			//FILTRO POSTERIZAR
	if(x==posterizar){
		JOptionPane.showMessageDialog (  null, "Utilice la barra de tonalidad" );
		slider = 3;
	}
	
			//FILTRO AZUL
	if(x==azul){
		Image img = new ImageIcon(f.aplicarFiltroAzul(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
		
		
	}	  //FILTRO VERDE
	if(x==verde){
		Image img = new ImageIcon(f.aplicarFiltroVerde(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
		
	}     //FILTRO ROJO
	if(x==rojo){
		Image img = new ImageIcon(f.aplicarFiltroRojo(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());

	}
	    
	if(x==negativo){
		Image img = new ImageIcon(f.aplicarFiltroNegativo(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
				
	}
	if(x==cuartear){
		
		Image img = new ImageIcon(f.aplicarFiltroCuartear(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());

	}	
	if(x==bn){
		Image img = new ImageIcon(f.aplicarFiltroBN(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
		
	}
	if(x==seg){
		Image img = new ImageIcon(f.aplicarFiltroSeg(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
				
	}	
	if(x==seg2){
	Image img = new ImageIcon(f.aplicarFiltroRGBtoRBG(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());

			}
	if(x==rgbtogbr){
		Image img = new ImageIcon(f.aplicarFiltroRGBtoGBR(imgsel)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
	}
	if(x==warhol){
		int numero = Integer.parseInt( JOptionPane.showInputDialog(
        null,"Introduzca un numero",
        "Warhol",
        JOptionPane.QUESTION_MESSAGE) );
 
		
		Image img = new ImageIcon(f.aplicarFiltroWarhol(imgsel,numero)).getImage(); //convertimos icon en una imagen
					Image otraimg = img.getScaledInstance(600,650,java.awt.Image.SCALE_SMOOTH); //creamos una imagen nueva dandole las dimensiones que queramos a la antigua
					otroicon = new ImageIcon(otraimg);
					imgMod.setIcon(otroicon);
					txtNombreImg.setText(selector.getSelectedFile().getName());
	}
	if(x==info){
		JOptionPane.showMessageDialog (  null, "ABOUT:\nPROYECT: MICROPHOTOSHOP\nNAME: VAZQUEZ MORENO MARCOS OSWALDO \n SUBJECT: POO \nGROUP: 2CM3\n"); 
	}
	}

	public static void main(String[] args) {
		new MicroPhotoshop();
	}

}
