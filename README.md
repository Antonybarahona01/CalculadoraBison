# Integrantes
1. David Martinez
2. Franco Comas
3. Antony Barahona

# Calculadora en Flex y Bison

Este documento proporciona instrucciones detalladas sobre cómo instalar, configurar y ejecutar una calculadora simple desarrollada en Flex y Bison.

## Antes de Empezar

### Verificar la Instalación de Flex y Bison

1. **Abrir una Terminal:**
   - Utiliza el atajo `Ctrl + Alt + T` para abrir una terminal en Kali Linux.

2. **Verificar la Instalación de Bison:**
   - Ingresa el comando `bison --version` en la terminal. Esto mostrará la versión de Bison instalada.

3. **Verificar la Instalación de Flex:**
   - Ingresa el comando `flex --version` en la terminal. Esto mostrará la versión de Flex instalada.

### Instalar Flex y Bison

1. **Instalar Bison:**
   - Abre una terminal con `Ctrl + T`.
   - Ejecuta el comando `sudo apt-get install bison` y presiona Enter. Esto instalará Bison en tu sistema.

2. **Instalar Flex:**
   - En la misma terminal, ejecuta el comando `sudo apt-get install flex` y presiona Enter. Esto instalará Flex en tu sistema.

## Guía para la Creación del Archivo `calculadora.l` y `calculadora.y`

### Descarga de los Archivos

1. **Descargar los Archivos:**
   - Navega al repositorio donde se encuentran los archivos `calculadora.l` y `calculadora.y`.
   - Descarga estos archivos a tu máquina local.

2. **Abrir una Terminal en la Carpeta Descargada:**
   - Navega a la carpeta donde descargaste los archivos.
   - Haz clic derecho en la carpeta y selecciona "Abrir terminal aquí".

### Implementación de Flex y Bison

1. **Generar el Archivo `lex.yy.c` con Flex:**
   - En la terminal abierta en la carpeta con los archivos, ejecuta el comando:
     ```bash
     flex calculadora.l
     ```
   - Esto generará el archivo `lex.yy.c`.

2. **Generar los Archivos `calculadora.tab.c` y `calculadora.tab.h` con Bison:**
   - Ejecuta el comando:
     ```bash
     bison -d calculadora.y
     ```
   - Esto generará los archivos `calculadora.tab.c` y `calculadora.tab.h`.

### Archivos Generados

- **`lex.yy.c`**: Archivo generado por Flex que contiene el analizador léxico.
- **`calculadora.tab.c`**: Archivo generado por Bison que contiene el analizador sintáctico.
- **`calculadora.tab.h`**: Archivo generado por Bison que contiene las definiciones de tokens y estructuras necesarias para el analizador sintáctico.

## Compilación del Programa

1. **Compilar y Unir los Archivos:**
   - Utiliza el siguiente comando para compilar y unir los archivos generados:
     ```bash
     gcc -o calculadora calculadora.tab.c lex.yy.c -lfl -lm
     ```
   - Esto creará un ejecutable llamado `calculadora`.

## Ejecución del Programa

1. **Ejecutar el Programa:**
   - Una vez compilado, puedes ejecutar el programa con:
     ```bash
     ./calculadora
     ```
### Ejemplos de Ejecucion:
![Ejemplo1](https://github.com/user-attachments/assets/90648786-9ffa-422f-9b19-1e7a752c1a9b)
![Ejemplo2](https://github.com/user-attachments/assets/0e0c0ee9-4333-4d2a-bd54-d1c38507bed2)


Este fragmento incluye ejemplos de entradas válidas y errores que la calculadora maneja, con capturas de pantalla y descripciones detalladas para facilitar la comprensión de cómo el programa responde a diferentes situaciones.

## Explicación del Código

### Análisis Léxico (`calculadora.l`)

El archivo `calculadora.l` define las reglas para el análisis léxico de la entrada. Utiliza expresiones regulares para identificar tokens como números, operadores y paréntesis.

### Análisis Sintáctico (`calculadora.y`)

El archivo `calculadora.y` define las reglas para el análisis sintáctico. Incluye la gramática de la calculadora, especificando cómo se combinan los tokens para formar expresiones válidas y cómo se evalúan estas expresiones. Se han añadido las siguientes funcionalidades:
- **Fracciones**: Soporte para operaciones con números fraccionarios.
- **Potencia**: Soporte para la operación de potencia utilizando `^`.
- **Valor Absoluto**: Implementación de la función de valor absoluto.

### Generación del Ejecutable

El comando `gcc` se utiliza para compilar los archivos generados por Flex y Bison y crear un ejecutable llamado `calculadora`. Este ejecutable puede ser utilizado para realizar cálculos matemáticos básicos a través de la línea de comandos.


