import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import com.sun.j3d.utils.geometry.*;
import com.sun.j3d.utils.universe.*;
import com.sun.j3d.utils.image.*;
import javax.media.j3d.*;
import javax.vecmath.*;
public class Tamagochi extends JFrame  implements LeeRed {
static String preguntas []= { "COMO TE LLAMAS","DONDE VIVES"};
static String respuestas []= {"MI NOMBRE ES TAMAGOCHI","EN LA COMPU"};
private Canvas3D canvas3D;
private Appearance ap;
private static Texture texture;
private JPanel jp1;
private JButton nauceas,tranquilo,enojado,galanazo,asombrado;
private EventHandler eh;
private String nombres[]={"nauceas.jpg","caratranquilo.jpg","enojado.jpg","galan.jpg","caraasombrado.jpg"};
private int turno;
private Body bodyo, bodyotro;
private MicroChat microChat;
private Red r;
public Tamagochi(){
   super("Tamagochi 3D");
   turno=0;
   //setResizable(false);
   setSize(500, 500);
   GraphicsConfiguration config =
   SimpleUniverse.getPreferredConfiguration();
   canvas3D = new Canvas3D(config);
   canvas3D.setSize(300, 400);
   eh = new EventHandler();
   nauceas=new JButton("nauceas");
   tranquilo=new JButton("tranquilo");
   enojado=new JButton("enojado");
   galanazo=new JButton("galanazo");
   asombrado=new JButton("asombrado");
   nauceas.addActionListener(eh);
   tranquilo.addActionListener(eh);
   enojado.addActionListener(eh);
   galanazo.addActionListener(eh);
   asombrado.addActionListener(eh);
   jp1=new JPanel();
   jp1.add(nauceas);
   jp1.add(tranquilo);
   jp1.add(enojado);
   jp1.add(galanazo);
   jp1.add(asombrado);
   add("North", jp1);
   add("Center",canvas3D);
   setup3DGraphics();
   setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
   setVisible(true);
   r=new Red(this);
   microChat = new MicroChat(r);
   add("South", microChat);
}
void setup3DGraphics(){
   DirectionalLight light1;
   SimpleUniverse universe = new SimpleUniverse(canvas3D);
   universe.getViewingPlatform().setNominalViewingTransform();
   bodyo=new Body(-0.25f,0.0f,0.0f,"",true, this, "Avatar1");
   bodyo.changeTextureCab(texture, "carafeliz.jpg");
   BranchGroup group= bodyo.mybody();
   universe.addBranchGraph(group);
   bodyotro=new Body(0.25f,0.0f,0.0f,"",true, this, "Avatar1");
   bodyotro.changeTextureCab(texture, "carafeliz.jpg");
   group= bodyotro.mybody();
   Color3f light1Color = new Color3f(1.0f, 1.0f, 0.0f);
   BoundingSphere bounds =new BoundingSphere(new Point3d(0.0, 0.0, 0.0), 100.0);
   Vector3f light1Direction = new Vector3f(4.0f, -7.0f, -12.0f);
   light1 = new DirectionalLight(light1Color, light1Direction);
   light1.setInfluencingBounds(bounds);
   group.addChild(light1);
   universe.addBranchGraph(group);
}
public static void main(String[] args) { new Tamagochi(); }
class EventHandler implements ActionListener {
  public void actionPerformed(ActionEvent e) {
  	int b=0;
     Object obj=e.getSource();
     if(obj instanceof JButton){
     	JButton btn=(JButton)e.getSource();
     	if(btn==nauceas)
     		b=0;
      if(btn==tranquilo) 
        	b=1;
      if(btn==enojado)
            b=2;         
      if(btn==galanazo)
            b=3;         
      if(btn==asombrado)
      	    b=4;
		bodyo.changeTextureCab(texture, nombres[b]);
     	r.escribeRed(new Icono(
                     "Tamagochi", turno, nombres[b]));
     }
  }
}
public void leeRed(Object obj){
	if(obj instanceof Icono){
           Icono i=(Icono)obj;
           System.out.println("Recibi"+nombres[i.getTurno()]);
           bodyotro.changeTextureCab(i.getIcon());
	}
        if(obj instanceof Mensaje){
		System.out.println("Recibi"+(Mensaje)obj);
                microChat.recibir((Mensaje)obj);
	}
}
static String findMatch(String str) {
		String result = "";
		for(int i = 0; i < preguntas.length; ++i) {
			if(preguntas[i].equalsIgnoreCase(str)) {
				result = respuestas[i];
				break;
			}
		}
		return result;
}
}
