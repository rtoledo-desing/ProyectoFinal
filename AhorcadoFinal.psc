Funcion adivino <- AdivinoPalabra (letrasMostradas, tamanio)
	Definir adivino Como Logico
	Definir pos Como Entero
	adivino = Verdadero
	Para pos = 0 Hasta tamanio - 1 Con Paso 1 Hacer
		Si letrasMostradas[0] == Falso Entonces
			adivino = Falso
		FinSi
	Fin Para
Fin Funcion


Funcion  EscribirLetrasEncontradas(palabraFinal, letrasMostradas, tamanio)
	definir pos Como Entero
	Para pos = 0 Hasta tamanio - 1 Con Paso 1 Hacer
		Si letrasMostradas[pos] == Verdadero Entonces
			Escribir Sin Saltar palabraFinal[pos], " "
		SiNo
			Escribir Sin Saltar "_ "
		FinSi
	Fin Para
	Escribir " "
Fin Funcion


Funcion  EscribirLetrasInsertadas(letrasInsertadas, tamanio)
	//Escribre las letras insertadas por el usuario
	//
	//Par�metros:
	//letrasInsertadas: contiene las letras 
	//tamanio: tama�o del arreglo
	definir pos Como Entero
	Para pos = 0 Hasta tamanio - 1 Con Paso 1 Hacer
		Si letrasInsertadas[pos] != "" Entonces
			si pos == 0 Entonces
				Escribir Sin Saltar letrasInsertadas[pos]
			SiNo
				Escribir Sin Saltar ", " + letrasInsertadas[pos]
			FinSi
		FinSi
	Fin Para
	Escribir " "
Fin Funcion


Algoritmo sin_titulo
	Definir pos Como Entero //Variables para controlar ciclos
	Definir palabras,palabraAzar, palabraFinal Como Caracter
	Definir cantidadDePalabras Como Entero
	
	Definir intentos Como Enteros
	
	Definir contadorLetras Como Entero
	contadorLetras = 0
	
	Definir letra Como Caracter
	
	cantidadDePalabras = 3
	Dimension palabras[cantidadDePalabras]
	
	//llenamos nuestro diccionario de palabras
	palabras[0] = "Hola"
	palabras[1] = "como"
	palabras[2] = "estas"
	
	//Seleccionamos una palabra al azar de nuestro diccionario
	palabraAzar = palabras[Azar(cantidadDePalabras)]
	Escribir palabraAzar
	
	//pasamos nuestra palabra a un arreglo
	Dimension palabraFinal[Longitud(palabraAzar)]
	Para pos = 0 Hasta Longitud(palabraAzar) - 1 Con Paso 1 Hacer
		palabraFinal[pos] = Subcadena(palabraAzar, pos, pos)
	Fin Para
	
	Definir EncontroLetra Como Logico
	Definir letrasInsertadas Como Caracter
	Definir letrasMostradas Como Logico
	Dimension letrasInsertadas[100]
	Dimension letrasMostradas[Longitud(palabraAzar)]
	
	//inicializamos los valores que determinan si nuestras letras 
	//estan mostrados o no
	Para pos = 0 Hasta Longitud(palabraAzar) - 1 Con Paso 1 Hacer
		letrasMostradas[pos] = Falso
	Fin Para
	
	// ciclo del juego
	Repetir
		EncontroLetra = Falso
		
		Escribir "Ingrese una letra:"
		Leer letra
		letrasInsertadas[contadorLetras] = letra
		contadorLetras = contadorLetras + 1
		
		// verificamos si la letra existe en nuestra palabra
		Para pos = 0 Hasta Longitud(palabraAzar) - 1 Con Paso 1 Hacer
			Si	palabraFinal[pos] == letra Entonces
				letrasMostradas[pos] = Verdadero
				EncontroLetra = Verdadero
			FinSi
		Fin Para
		Si EncontroLetra == Falso Entonces
			intentos = intentos + 1
		FinSi
		
		EscribirLetrasEncontradas(palabraFinal, letrasMostradas, Longitud(palabraAzar))
		
		Escribir "Letras ingresadas:"
		EscribirLetrasInsertadas(letrasInsertadas, 100)
		

		Escribir "Presione una tecla para continuar!"
		Esperar Tecla
		Limpiar Pantalla
		
	Hasta Que intentos == 7 o AdivinoPalabra(letrasMostradas, Longitud(palabraAzar)) == Verdadero
	
	Si AdivinoPalabra(letrasMostradas, Longitud(palabraAzar)) == Verdadero Entonces
		Escribir "Felicidades la adivinaste"
	SiNo
		Escribir "perdiste eres duro"
	FinSi
FinAlgoritmo