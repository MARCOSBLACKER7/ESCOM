import java.awt.Color;
import java.awt.image.BufferedImage;
import java.awt.Color.*;
import javax.swing.JSlider;


public class Filtros{

//FILTRO SEPIA
	public BufferedImage aplicarFiltroSepia(BufferedImage imgsel) {
        BufferedImage bi = null;
        if(imgsel != null ) {
            bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(), imgsel.getType());
            Color colorImagen = null; int red = 0, green = 0, blue = 0;
            for(int i = 0; i < imgsel.getWidth(); i++) {
                for (int j = 1; j < (imgsel.getHeight()-1); j++) {
                    colorImagen = new Color(imgsel.getRGB(i, j));
                    try {
                    red = (int)(colorImagen.getRed() * 0.393 + colorImagen.getGreen() * 0.769 + colorImagen.getBlue() * 0.189);
                    green = (int)(colorImagen.getRed() * 0.349 + colorImagen.getGreen() * 0.686 + colorImagen.getBlue() * 0.168);
                    blue = (int)(colorImagen.getRed() * 0.272 + colorImagen.getGreen() * 0.534 + colorImagen.getBlue() * 0.131);
                    colorImagen = new Color((red>255)?255:red, (green>255)?255:green, (blue>255)?255:blue);
                    } catch (Exception e) {}                    
                    bi.setRGB(i, j, colorImagen.getRGB());
                }
            }
        }
        return bi;
    }
	//FILTRO ESCALA DE GRISES
	
	public BufferedImage aplicarFiltroGrises(BufferedImage imgsel, JSlider spromedio) {
		BufferedImage bi = null;
		if (imgsel != null) {
			bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),BufferedImage.TYPE_BYTE_BINARY);
			for (int x = 0; x < imgsel.getWidth(); x++) {
				for (int y = 0; y < imgsel.getHeight(); y++) {
					Color c = new Color(imgsel.getRGB(x, y));
					int r=c.getRed();
					int g=c.getGreen();
					int b=c.getBlue();
					if(r<spromedio.getValue()){
						r=0;
					}else{
						r=255;
					}
					if(g<spromedio.getValue()){
						g=0;
					}else{
						g=255;
					}
					if(b<spromedio.getValue()){
						b=0;
					}else{
						b=255;
					}
					bi.setRGB(x, y, new Color(r, g, b).getRGB());
				}
			}
		}
		return bi;
	}
	
	//FILTRO BRILLO
	public BufferedImage aplicarFiltroBrillo(BufferedImage imgsel, JSlider spromedio) {
		BufferedImage bi = null;
		if (imgsel != null) {
			bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),imgsel.getType());
			for (int x = 0; x < imgsel.getWidth(); x++) {
				for (int y = 0; y < imgsel.getHeight(); y++) {
					Color c = new Color(imgsel.getRGB(x, y));
					int r = c.getRed();
					int g = c.getGreen();
					int b = c.getBlue();
					r+=spromedio.getValue();
                    g+=spromedio.getValue();
                    b+=spromedio.getValue();
                    if (r>255){
                        r=255;
                    }
                    if (g>255){
                        g=255;
                    }
                    if (b>255){
                        b=255;
                    }
                    if (r<0){
                        r=0;
                    }
                    if (g<0){
                        g=0;
                    }
                    if (b<0){
                        b=0;
                    }

					bi.setRGB(x, y, new Color(r, g, b).getRGB());
				}
			}
		}
		return bi;
	}
	
	//FILTRO COLOR AZUL
	public BufferedImage aplicarFiltroAzul(BufferedImage imgsel) {
  BufferedImage bi = null;
  if (imgsel != null) {
   bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
     imgsel.getType());
   for (int i=0;i<imgsel.getWidth();i++){
                for (int j=0;j<imgsel.getHeight();j++){

               int r=new Color(imgsel.getRGB(i, j)).getRed();
               int g=new Color(imgsel.getRGB(i, j)).getGreen();
               int b=new Color(imgsel.getRGB(i, j)).getBlue();
      
               if(b<r){
                   if (r>g){
                       int color=b;
                       b=r;
                       r=color;
                   }
                   else{
                      int color=b;
                       b=g;
                       g=color; 
                   }
               }else if (b<g){
                   if (g>r){
                       int color=b;
                       b=g;
                       g=color;
                   }
                   else{
                       int color=b;
                       b=r;
                       r=color; 
                   }
               }
               bi.setRGB(i, j, new Color(r,g,b).getRGB());
                }
   }
  }
  return bi;
 }
 
 //FILTRO COLOR VERDE
  public BufferedImage aplicarFiltroVerde(BufferedImage imgsel) {
  BufferedImage bi = null;
  if (imgsel != null) {
   bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
     imgsel.getType());
   for (int i=0;i<imgsel.getWidth();i++){
                for (int j=0;j<imgsel.getHeight();j++){

               int r=new Color(imgsel.getRGB(i, j)).getRed();
               int g=new Color(imgsel.getRGB(i, j)).getGreen();
               int b=new Color(imgsel.getRGB(i, j)).getBlue();
      
               if(g<r){
                   if (r>b){
                       int color=g;
                       g=r;
                       r=color;
                   }
                   else{
                      int color=g;
                       g=b;
                       b=color; 
                   }
               }else if (g<b){
                   if (b>r){
                       int color=g;
                       g=b;
                       b=color;
                   }
                   else{
                       int color=g;
                       g=r;
                       r=color; 
                   }
               }
               bi.setRGB(i, j, new Color(r,g,b).getRGB());
                }
   }
  }
  return bi;
 }
 
 //FILTRO ROJO
 	public BufferedImage aplicarFiltroRojo(BufferedImage imgsel) {
		BufferedImage bi = null;
		Color auxColor;
		if (imgsel != null) {
			bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
					imgsel.getType());
			for (int i=0;i<imgsel.getWidth();i++){
                for (int j=0;j<imgsel.getHeight();j++){
					auxColor=new Color(bi.getRGB(i, j));
		             int r=new Color(imgsel.getRGB(i, j)).getRed();
		             int g=new Color(imgsel.getRGB(i, j)).getGreen();
		             int b=new Color(imgsel.getRGB(i, j)).getBlue();
					 int prom = (r+g+b)/3;
					 bi.setRGB(i, j,this.colorRGBaSRGB(new Color(prom,0,0,auxColor.getAlpha())));
		             
		             }
		             
                }
			}
		
		return bi;
	}

	//FILTRO NEGATIVO
	 public BufferedImage aplicarFiltroNegativo(BufferedImage imgsel) {
  BufferedImage bi = null;
  if (imgsel != null) {
   bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),imgsel.getType());
   for (int x = 0; x < imgsel.getWidth(); x++) {
    for (int y = 0; y < imgsel.getHeight(); y++) {
     Color c = new Color(imgsel.getRGB(x, y));
     int r = c.getRed();
     int g = c.getGreen();
     int b = c.getBlue();
     r=255-r;
     g=255-g;
     b=255-b;
     bi.setRGB(x, y, new Color(r, g, b).getRGB());
    }
   }
  }
  return bi;
 }
 
 //FILTRO CUARTEAR
public BufferedImage aplicarFiltroCuartear(BufferedImage imgsel) {
  BufferedImage bi = null;
  if (imgsel != null) {
   bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
     imgsel.getType());
   Color colorImagen=null;
   for (int i=0;i<imgsel.getWidth();i++){
       for (int j=0;j<imgsel.getHeight();j++){
           colorImagen=new Color(imgsel.getRGB(i, j));
           int color=(int)((colorImagen.getRed()+colorImagen.getGreen()+colorImagen.getBlue())/3);
           
           if(color>227){
            color=255;
           }else if(color>202){
            color=202;
           }else if(color>177){
            color=177;
           }else if(color>153){
            color=153;
           }else if(color>127){
            color=127;
           }else if (color>102){
               color=102;
           }else if (color>76){
               color=76;
           }else if (color>51){
               color=51;
           }else if (color>25){
               color=25;
           }else{
               color=0;
           }
           colorImagen=new Color(color,color,color);
           bi.setRGB(i, j, colorImagen.getRGB());
       }
   }
  }
  return bi;
 }
 //FILTRO BLANCO Y NEGRO
 public BufferedImage aplicarFiltroBN(BufferedImage imgsel) {
	BufferedImage bi = null;
	
  if (imgsel!= null) {
	bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
     imgsel.getType());
	int mediaPixel,colorSRGB;
     Color colorAux;
                 
        //Recorremos la imagen PIXEL a PIXEL
        for( int i = 0; i < imgsel.getWidth(); i++ ){
            for( int j = 0; j < imgsel.getHeight(); j++ ){
                //Almacenamos el color del PIXEL
                colorAux=new Color(imgsel.getRGB(i, j));
                //Calculamos la media de los tres canales (rojo, verde, azul)
                mediaPixel=(int)((colorAux.getRed()+colorAux.getGreen()+colorAux.getBlue())/3);
                //Cambiamos a formato sRGB
                colorSRGB=(mediaPixel << 16) | (mediaPixel << 8) | mediaPixel;
                //Asignamos el nuevo valor al BufferedImage
                bi.setRGB(i, j,colorSRGB);
            }
        }
   
	  }
        //Retornamos la imagen
        return bi;
    
 }
 //FILTRO POSTERIZAR
 	public BufferedImage aplicarFiltroPos(BufferedImage imgsel, JSlider snivel) {
		BufferedImage bi = null;
		if (imgsel != null) {
			bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
					imgsel.getType());
			for (int i = 0; i < imgsel.getWidth(); i++) {
				for (int j = 1; j < imgsel.getHeight(); j++) {
					Color color = new Color(imgsel.getRGB(i, j));
					int rojo = color.getRed();
					int verde = color.getGreen();
					int azul = color.getBlue();
					rojo = (rojo - (rojo % snivel.getValue()));
					verde = (verde - (verde % snivel.getValue()));
					azul = (azul - (azul % snivel.getValue()));
					bi.setRGB(i, j, new Color(rojo,verde,azul).getRGB());
				}
			}
		}
		return bi;
	}
//FILTRO SEGMENTACION POR COLOR
public BufferedImage aplicarFiltroSeg(BufferedImage imgsel) {
		BufferedImage bi = null;
		if(imgsel != null ) {
			bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(), imgsel.getType());
			Color colorImagen = null, colorAnt = null, colorSig = null; 
			int tmp0, tmp1, tmp2, tolerancia = 30;
			for(int i = 0; i < imgsel.getWidth(); i++) {
				for (int j = 1; j < (imgsel.getHeight()-1); j++) {
					colorImagen = new Color(imgsel.getRGB(i, j));
					tmp1 = (colorImagen.getRed()+colorImagen.getGreen()+colorImagen.getBlue())/3;
					colorAnt = new Color(imgsel.getRGB(i, j-1));
					tmp0 = (colorAnt.getRed()+colorAnt.getGreen()+colorAnt.getBlue())/3;
					colorSig = new Color(imgsel.getRGB(i, j+1));
					tmp2 = (colorSig.getRed()+colorSig.getGreen()+colorSig.getBlue())/3;
					if ((Math.abs(tmp1 - tmp0) > tolerancia) && (Math.abs(tmp2 - tmp1) < tolerancia))
					{
	                	colorImagen = new Color(0, 0, 0);
	                }
	                else
	                {
						colorImagen = new Color(255, 255, 255);
	                }
					bi.setRGB(i, j, colorImagen.getRGB());
				}
			}
		}
		return bi;
	}
//FILTRO RGB A RBG
public BufferedImage aplicarFiltroRGBtoRBG(BufferedImage imgsel) {
		BufferedImage bi = null;
		if (imgsel != null) {
			bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
					imgsel.getType());
			for (int x = 0; x < imgsel.getWidth(); x++) {
				for (int y = 0; y < imgsel.getHeight(); y++) {
					Color c = new Color(imgsel.getRGB(x, y));
					int r = c.getRed();
					int g = c.getGreen();
					int b = c.getBlue();
					bi.setRGB(x, y, new Color(r, b, g).getRGB());
				}
			}
		}
		return bi;
	}
//FILTRO RGB A GBR
public BufferedImage aplicarFiltroRGBtoGBR(BufferedImage imgsel) {
		BufferedImage bi = null;
		if (imgsel != null) {
			bi = new BufferedImage(imgsel.getWidth(), imgsel.getHeight(),
					imgsel.getType());
			for (int x = 0; x < imgsel.getWidth(); x++) {
				for (int y = 0; y < imgsel.getHeight(); y++) {
					Color c = new Color(imgsel.getRGB(x, y));
					int r = c.getRed();
					int g = c.getGreen();
					int b = c.getBlue();
					bi.setRGB(x, y, new Color(g, b, r).getRGB());
				}
			}
		}
		return bi;
	}
//FILTRO WARHOL
  public BufferedImage aplicarFiltroWarhol(BufferedImage  image, int num) {
      int width = image.getWidth();
      int height = image.getHeight();
      BufferedImage bufferedImage = new BufferedImage(width, height,
      BufferedImage.TYPE_INT_RGB);
      for (int j = 0; j < width; j++) {
    	 for (int k = 0; k < height; k++) {
            int pixel = image.getRGB(j, k);
    	    bufferedImage.setRGB(j, k, posterize(pixel, num));
    	 }
      }
      return bufferedImage;
   }
   private int posterize(int x, int factor) {
      int modulo = 10;
      while (x % (modulo * 10) != x) {
         modulo *= 10;
      }
      return modulo * factor * -1;
   }		

 public int calcularMediaColor(Color color){
        int averageColor;
        averageColor=(int)((color.getRed()+color.getGreen()+color.getBlue())/3);
        return averageColor;
    }
  public Color chequearUmbral(Color color, int umbral){
        Color colorSalida;
        if (calcularMediaColor(color)>=umbral){
            colorSalida=new Color(255,255,255, color.getAlpha());
        }else{
            colorSalida=new Color(0, 0, 0, color.getAlpha());
        }
        return colorSalida;
    }
	 public int colorRGBaSRGB(Color colorRGB){
        int colorSRGB;
        colorSRGB=(colorRGB.getRed() << 16) | (colorRGB.getGreen() << 8) | colorRGB.getBlue();
        return colorSRGB;
    }
	
	}
