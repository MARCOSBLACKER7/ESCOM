"""
Escuela Superior de Computo
Entrega: 24 de Septimebre de 2018
Redes de Computadoras
Alumnos: 
	De los Santos Díaz Luis Alejandro  2017630451
	Vázquez Moreno Marcos Oswaldo      2016601777

Programa que reraliza el Subnetting con una IP dada, entrando a la opcion que puede ser
por numero de subredes deseadas
por numero de host deseados
por mascara personalizada con /#

Realizado todo lo anterior mediante una validacion de clasificacion de red 
"""

def PotenciaSR(Clase, numSR):  #Funcion para obtener la potencia esperada dado el rango mas cercano para el numero de subredes
	if (Clase == 'A'):  #Clase A
		for i in range (0, 22): #Rango de hasta 2 a la 22 (por el -2)
			if ((2 ** i) >= numSR):
				return i
	if (Clase == 'B'):  #Clase B
		for i in range (0, 14):  #Rango de hasta 2 a la 14
			if ((2 ** i) >= numSR):
				return i
	if (Clase == 'C'): #Clase C 
		for i in range (0, 6): #Rango de hasta 2 a la 6 
			if ((2 ** i) >= numSR):
				return i

def PotenciaH(Clase, numH):  #Funcion para obtener la potencia esperada dado el rango mas cercano para el numero de host solicitados
	if (Clase == 'A'):  #Clase A
		for i in range (1, 25):  #Rango de hasta 2 a la 24 +2 
			if ((2 ** i) >= numH):
				return i
	if (Clase == 'B'):  #Clase B
		for i in range (1, 17): #Rango de hasta 2 a la 16 +1
			if ((2 ** i) >= numH):
				return i
	if (Clase == 'C'):  #Clase C
		for i in range (1, 9): #Rango de hasta 2 a la 8 +1
			if ((2 ** i) >= numH):
				return i

def maxS(Clase):   # Numeor del maximo de Subredes -2 por clase
	if (Clase == 'A'):
		return ((2 ** 22) - 2)
	if (Clase == 'B'):
		return ((2 ** 14) - 2)
	if (Clase == 'C'):
		return ((2 ** 6) - 2)
 
def maxH(Clase): #Numero del maximo de host menos 2 por clase
	if (Clase == 'A'):
		return ((2 ** 24) - 2)
	if (Clase == 'B'):
		return ((2 ** 16) - 2)
	if (Clase == 'C'):
		return ((2 ** 8) - 2)

def bitsDefault(Clase):  #Funcion para tomar los bits de Red por default dados dependiendo  la clase que sea
	if (Clase == 'A'):
		return 8
	if (Clase == 'B'):
		return (8 * 2)
	if (Clase == 'C'):
		return (8 * 3)

def ClaseIP(IP): #Condicion clasica :v para entrar a los rangos
	if (IP & 128): 
		if (IP & 64):
			if (IP & 32):
				if (IP & 16):
					if (IP & 8):
						return "E"
					else:
						return "E"
				else:
					return "D"
			else:
				return "C"
		else:
			return "B"
	else:
		return "A"

def funcionbits(t, Clase): #Nuestra bella funcion para que todo funcione y poder hacer casteos
	cadena = ''
	if (Clase == 'A'):
		tam = 24 - t
		for i in range(tam):
			cadena = cadena + "0"
		return cadena
	if (Clase == 'B'):
		tam = 16 - t
		for i in range(tam):
			cadena = cadena + "0"
		return cadena
	if (Clase == 'C'):
		return ((2 ** 6) - 2)


if __name__ == '__main__':
	print("Ingrese IP de red para subnetting: ", end = '')
	aux = input()

	DireccionIP = [int(i) for i in ((aux).split('.'))]
	print("\nOpcion:\n1.- Numero de Subredes\n2.- Numero de Host/Subred\n3.- Máscara de Subred personalizada(/)\n", end = '') #multiopcion
	opcion = int(input())
	Clase = ClaseIP(DireccionIP[0])
	maxSub = maxS(Clase)
	maxHost = maxH(Clase)
	minMascara = bitsDefault(Clase)
	#Por numero de Host
	if (opcion == 1):
		numSR = maxSub + 1
		while (numSR > maxSub):
			print("Ingresa el # de Subredes: ", end = '')
			numSR = int(input())
		if (Clase == 'A'):
			bPrestados = PotenciaSR(Clase, numSR)
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast") #cabecera de tabla
			for i in range (0, numSR):
				aa = bin(i << (24 - bPrestados)).split("0b") #Convierte el numero de red en binario 
				bb = funcionbits(len(aa[1]), Clase) + aa[1]  
				cc = bin((i << (24 - bPrestados))+((2**(24 - bPrestados))-1)).split("0b") #Guarda los bits para el numeor de broacast
				dd = funcionbits(len(cc[1]), Clase) + cc[1] 
				#Lo que hacemos aquí es utilizar una concatenación de los 8 bits de cada octeto dependiendo la clase, 
				#De esta manera podemos tenerlo en binario, despues en entero y al utlimo poder concatenar como cadena, 
				# el metodo o sintaxis de usar el -> [:8] es que desde el inicio de cadena a la posicion 8 
				# el metodo o sintaxis de usar el -> [16:] es que desde la posicion 16 hasta el fin de cadena
				Red = str(DireccionIP[0]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:16],2)) + '.' + str(int(bb[16:],2)) #Hacemos un doble casteo de bits a entero y de entero a cadena
				Broadcast = str(DireccionIP[0]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:16],2)) + '.' + str(int(dd[16:],2))
				# [8:16] Rango desde la posicion 8 a la 16
				Desde = str(DireccionIP[0]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:16],2)) + '.' + str(int(bb[16:],2) + 1) 
				Hasta = str(DireccionIP[0]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:16],2)) + '.' + str(int(dd[16:],2) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)

		if (Clase == 'B'):
			bPrestados = PotenciaSR(Clase, numSR)
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				aa = bin(i << (16 - bPrestados)).split("0b")
				bb = funcionbits(len(aa[1]), Clase) + aa[1]
				cc = bin((i << (16 - bPrestados))+((2**(16 - bPrestados))-1)).split("0b") #El cambio es la potencia  a la 16 menos los prestados
				dd = funcionbits(len(cc[1]), Clase) + cc[1]
				Red = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:],2))
				Broadcast = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:],2))
				Desde = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:],2) + 1)
				Hasta = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:],2) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)

		if (Clase == 'C'):
			bPrestados = PotenciaSR(Clase, numSR)
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				Red = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str(i << (8 - bPrestados)) #Corrimiento del rango a la posicion 8 menos los bits prestados
				Broadcast = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str((i << (8 - bPrestados)) + ((2 ** (8 - bPrestados)) - 1))
				Desde = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str((i << (8 - bPrestados)) + 1) #Join concatena cierta cantidad de cadena de a cuerdo al caracter tomado como apuntador
				Hasta = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str(((i << (8 - bPrestados)) + ((2 ** (8 - bPrestados)) - 1)) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)

	if (opcion == 2):
		numH = -1
		while (numH > maxHost or numH < 2):
			print("Ingresa el # de Host/Subred: ", end = '')
			numH = int(input())

		if (Clase == 'A'): 
			bitsHots = PotenciaH(Clase, numH + 2)
			numSR = 2 ** (16 - bitsHots)
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				aa = bin(i << (bitsHots)).split("0b") #Separamiento de cadena omitiendo los carácteres dentro del parametro de la funcion 
				bb = funcionbits(len(aa[1]), Clase) + aa[1]
				cc = bin((i << (bitsHots))+((2**(bitsHots))-1)).split("0b")
				dd = funcionbits(len(cc[1]), Clase) + cc[1]
				Red = str(DireccionIP[0]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:16],2)) + '.' + str(int(bb[16:],2))
				Broadcast = str(DireccionIP[0]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:16],2)) + '.' + str(int(dd[16:],2))
				Desde = str(DireccionIP[0]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:16],2)) + '.' + str(int(bb[16:],2) + 1)
				Hasta = str(DireccionIP[0]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:16],2)) + '.' + str(int(dd[16:],2) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)


		if (Clase == 'B'):
			bitsHots = PotenciaH(Clase, numH + 2)
			numSR = 2 ** (16 - bitsHots)
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				aa = bin(i << (bitsHots)).split("0b")
				bb = funcionbits(len(aa[1]), Clase) + aa[1]
				cc = bin((i << (bitsHots))+((2**(bitsHots))-1)).split("0b")
				dd = funcionbits(len(cc[1]), Clase) + cc[1]
				Red = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:],2))
				Broadcast = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:],2))
				Desde = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:],2) + 1)
				Hasta = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:],2) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)

		if (Clase == 'C'):
			bitsHots= PotenciaH(Clase, numH + 2)
			numSR = 2 ** (8 - bitsHots)
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				Red = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str(i << bitsHots)
				Broadcast = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str((i << (bitsHots)) + ((2 ** (bitsHots)) - 1))
				Desde = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str((i << (bitsHots)) + 1)
				Hasta = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str(((i << (bitsHots)) + ((2 ** (bitsHots)) - 1)) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)

	if (opcion == 3):
		maskSR = -1
		while (maskSR > 30 or maskSR < minMascara):
			print ("Ingresa la Máscara de Subred: ", end = '')
			aux = input()
			maskSR = int(aux[1:])
		bPrestados = maskSR - minMascara
		numSR = 2 ** bPrestados

		if (Clase == 'A'):
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				aa = bin(i << (24 - bPrestados)).split("0b")
				bb = funcionbits(len(aa[1]), Clase) + aa[1]
				cc = bin((i << (24 - bPrestados))+((2**(24 - bPrestados))-1)).split("0b")
				dd = funcionbits(len(cc[1]), Clase) + cc[1]
				Red = str(DireccionIP[0]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:16],2)) + '.' + str(int(bb[16:],2))
				Broadcast = str(DireccionIP[0]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:16],2)) + '.' + str(int(dd[16:],2))
				Desde = str(DireccionIP[0]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:16],2)) + '.' + str(int(bb[16:],2) + 1)
				Hasta = str(DireccionIP[0]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:16],2)) + '.' + str(int(dd[16:],2) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)

		if (Clase == 'B'):
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				aa = bin(i << (16 - bPrestados)).split("0b")
				bb = funcionbits(len(aa[1]), Clase) + aa[1]
				cc = bin((i << (16 - bPrestados))+((2**(16 - bPrestados))-1)).split("0b")
				dd = funcionbits(len(cc[1]), Clase) + cc[1]
				Red = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:],2))
				Broadcast = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:],2))
				Desde = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(bb[:8],2)) + '.' + str(int(bb[8:],2) + 1)
				Hasta = '.'.join([str(i) for i in DireccionIP[:2]]) + '.' + str(int(dd[:8],2)) + '.' + str(int(dd[8:],2) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)

		if (Clase == 'C'):
			print ("   Red\t" + "\t\t  Rango de Host" + "\t\t\t Broadcast")
			for i in range (0, numSR):
				Red = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str(i << (8 - bPrestados))
				Broadcast = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str((i << (8 - bPrestados)) + ((2 ** (8 - bPrestados)) - 1))
				Desde = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str((i << (8 - bPrestados)) + 1)
				Hasta = '.'.join([str(i) for i in DireccionIP[:3]]) + '.' + str(((i << (8 - bPrestados)) + ((2 ** (8 - bPrestados)) - 1)) - 1)
				print (Red + "\t|" + Desde + "\ta\t" + Hasta + "\t|" + Broadcast)
