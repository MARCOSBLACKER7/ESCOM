import com.sun.j3d.utils.geometry.*;
import com.sun.j3d.utils.image.TextureLoader;
import com.sun.j3d.utils.universe.*;
import javax.media.j3d.*;
import javax.vecmath.*;
import java.awt.*;
import javax.swing.*;
import java.util.*;

public class SistemaSolar {	

	public SistemaSolar(){	 
		BranchGroup grupo1 = new BranchGroup();
		Appearance apaSol = new Appearance();
		Appearance apaMercurio = new Appearance();
		Appearance apaVenus = new Appearance();
		Appearance apaTierra = new Appearance();
	    TextureLoader textura;

	    /*---------------Añadiendo Texturas-------------------*/
	    textura=new TextureLoader("Sol.jpg", null);			//Sol
		apaSol.setTexture(textura.getTexture());
		textura=new TextureLoader("Mercurio.jpg",null);		//Mercurio
		apaMercurio.setTexture(textura.getTexture());
		textura=new TextureLoader("Venus.jpg",null);		//Venus
		apaVenus.setTexture(textura.getTexture());
	    textura=new TextureLoader("Tierra.jpg", null);		//Tierra
		apaTierra.setTexture(textura.getTexture());
		
		/*--------------Creando Planetas--------------*/
		//1parametro es tamaño
		
		Sphere esfSol = new Sphere(0.17f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, apaSol);
		Sphere esfMercurio = new Sphere(0.04f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, apaMercurio);
		Sphere esfVenus = new Sphere(0.055f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, apaVenus);
		Sphere esfTierra = new Sphere(0.08f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, 32, apaTierra);

		/*--------------Rotaciones--------------*/
		TransformGroup rotacionSol = rotacion(esfSol, new Alpha(-1, 2500));
		TransformGroup rotacionMercurio = rotacion(esfMercurio, new Alpha(-1, 800));
		TransformGroup rotacionVenus = rotacion(esfVenus,new Alpha(-1, 1200));
		TransformGroup rotacionTierra = rotacion(esfTierra, new Alpha(-1, 2500));


		/*--------------Traslaciones--------------*/
		TransformGroup traslacionMercurioLejos = traslacion(rotacionMercurio, new Vector3f(0.0f, 0.0f, 0.24f));//lejos
		TransformGroup veloTraslaMercurio = rotacion(traslacionMercurioLejos, new Alpha(-1, 4000));//velocidad

		TransformGroup traslacionVenusLejos = traslacion(rotacionVenus, new Vector3f(0.0f, 0.0f, 0.41f));//lejos
		TransformGroup veloTraslaVenus = rotacion(traslacionVenusLejos, new Alpha(-1, 4000));//velocidad		

		TransformGroup traslacionTierraLejos = traslacion(rotacionTierra, new Vector3f(0.0f, 0.0f, 0.6f));//lejos
		TransformGroup veloTraslaTierra = rotacion(traslacionTierraLejos, new Alpha(-1, 4000));//velocidad
		
		/*Agregando a la ventana*/
	    grupo1.addChild(rotacionSol);
	    grupo1.addChild(veloTraslaMercurio);
	    grupo1.addChild(veloTraslaVenus);
	    grupo1.addChild(veloTraslaTierra);

	    GraphicsConfiguration configura = SimpleUniverse.getPreferredConfiguration();
	    Canvas3D ventana = new Canvas3D(configura); ventana.setSize(1000, 800);
	    
	    SimpleUniverse universo = new SimpleUniverse(ventana);
	    universo.getViewingPlatform().setNominalViewingTransform();
	    universo.addBranchGraph(grupo1); 
 			 
	    JFrame ftitulo = new JFrame("Sistema Solar by RuPe");
	    ftitulo.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);  
	    ftitulo.add(ventana); ftitulo.pack(); ftitulo.setVisible(true);
	    
	}

	public static void main(String a[]) {
		 new SistemaSolar();
	}

	/*-----------------------Función Rotación------------------------*/
	TransformGroup rotacion(Node node,Alpha alpha) {
		TransformGroup xformGroup;
		xformGroup=new TransformGroup();
		xformGroup.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		
		RotationInterpolator interpolator;
		interpolator=new RotationInterpolator(alpha, xformGroup);
		interpolator.setSchedulingBounds(new BoundingSphere(new Point3d(0.0, 0.0, 0.0), 1.0));
		xformGroup.addChild(interpolator); 
		xformGroup.addChild(node);
		return xformGroup; 
	}




	/*------------------------Función Traslación---------------------*/
	TransformGroup traslacion(Node node, Vector3f vector) {
		Transform3D transforma3D = new Transform3D();
		transforma3D.setTranslation(vector);
		TransformGroup transformGroup =new TransformGroup();
		transformGroup.setTransform(transforma3D); 
	    transformGroup.addChild(node);
		return transformGroup; 
	}
}                                                                         
