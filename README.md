# Introducción al lenguaje de programación Julia

El propósito de estas notas es tener una guía de estudio y referencia para el interesado en aprender en español el lenguaje de programación Julia. No es un curso formal, ni pretende serlo. La mayoria de la información proviene de la documentación oficial de [Julia](https://docs.julialang.org/en/v1/).
***

## Índice
* [Instalación](#instalación)
* [Ejecutando Hola Mundo](#ejecutando-hola-mundo)
* [Julia Esencial](#julia-esencial)
    * [Variables](#variables)
    * [Tipos de datos](#tipos-de-datos)
        * [Números enteros y de punto flotante](#números-enteros-y-de-punto-flotante)
        * [Literales numéricos como coeficientes](#literales-numéricos-como-coeficientes)
        * [Números racionales](#números-racionales)
        * [Números complejos](#números-complejos)
        * [Strings](#strings)
    * [Operadores matemáticos y funciones elementales](#operadores-matemáticos-y-funciones-elementales)
        * [Operadores aritméticos](#operadores-aritméticos)
        * [Operadores booleanos](#operadores-booleanos)
        * [Operadores de actualización](#operadores-de-actualización)
        * [Operadores de comparación](#operadores-de-comparación)
        * [Funciones matemáticas básicas](#funciones-matemáticas-básicas)
        * [Funciones vectorizadas](#funciones-vectorizadas)
    * [Funciones](#funciones)
        * [Bloque function](#bloque-function)
        * [Funciones por asignación](#funciones-por-asignación)
        * [Funciones anónimas](#funciones-anónimas)
        * [Argumentos keywords](#argumentos-keyword)
        * [Tipado de argumentos](#tipado-de-argumentos)
        * [Vectorización de funciones](#vectorización-de-funciones)
        * [Composición de funciones](#composición-de-funciones)
        * [Return nothing](#return-nothing)
    * [Bloques de control de flujo](#bloques-de-control-de-flujo-condicionales-ciclos-y-otros)
        * [Condicionales](#condicionales)
        * [Evaluación short-circuit](#evaluación-short-circuit)
        * [Ciclos while y for](#ciclos-while-y-for)
        * [Bloque de expresiones compuestas](#bloque-de-expresiones-compuestas)
        * [Bloque do](#bloque-do)
    * [Estructura de datos](#estructura-de-datos)
        * [Vectores y arreglos](#vectores-y-arreglos)
        * [Tuplas](#tuplas)
        * [Diccionarios](#diccionarios)
* [Julia Intermedio](#julia-intermedio) 
    * [Arreglos multidimensionales](#arreglos-multidimensionales)
        * [Funciones básicas para arreglos](#funciones-básicas-para-arreglos)
        * [Construcción de arreglos e inicialización](#construcción-de-arreglos-e-inicialización)
        * [Arreglos literales](#arreglos-literales)
        * [Concatenación](#concatenación)
        * [Array comprehension](#array-comprehension)
        * [Vistazo a los generadores](#vistazo-a-los-generadores)
        * [Indexación](#indexación)
        * [Broadcasting](#broadcasting)
    * [Leer y escribir archivos](#leer-y-escribir-archivos)
    * [Gestor de paquetes Pkg](#) **↓ Pendiente ↓**
        * [Manejo de ambientes virtuales en Julia](#)
* [Julia Avanzado](#)                           **↓ Pendiente ↓**
    * [Bloque try-catch-finally](#)
    * [Tipo de datos compuestos: Struct](#)
    * [Métodos de funciones: Despacho multiple](#)
    * [Constructores](#)
    * [Módulos](#)
    * [Documentación](#)
* [Referencias](#referencias)
***

## Instalación
Para instalar el intérprete de Julia en nuestra computadora, debemos descargarlo directamente de los [repositorios](https://julialang.org/downloads/) oficiales. Elegimos la versión deseada, dependiendo del sistema operativo y arquitectura donde vamos a trabajar.

En mi caso, usaré la versión 1.7.3 para el sistema operativo Linux x86 a 64-bits. Se descargará un archivo con extensión **.tar.gz**. 

Para extraer el contenido, dentro de una terminal ejecutaremos el siguiente comando:

```console
$ tar -xvzf julia-1.7.3-linux-x86_64.tar.gz
```

donde ustedes deben sustituir por el nombre del archivo que descargaron. El comando les habrá generado una carpeta con el `julia-1.7.3` que contiene los binarios del interprete.

Ahora, copiaremos todo el contenido de dicha carpeta al directorio `/opt/` de nuestro sistema de la siguiente manera:

```console
$ sudo cp -r julia-1.7.3 /opt/
```

Finalmente, crearemos un enlace simbólico (_symbolic link_) de **Julia** dentro del directorio `/usr/local/bin/` para que sea visible para todo el sistema:

```console
$ sudo ln -s /opt/julia-1.7.3/bin/julia /usr/local/bin/julia
```

Listo, tenemos Julia instalado. Podemos verificar la instalación, reabriendo la terminal y ejecutando el comando

```console
$ julia
```
el cual, nos permitirá abrir el interprete de Julia.
***

## Ejecutando Hola Mundo
Para ejecutar código en Julia, se pueden utilizar varias opciones. La más fácil es usando el intérprete de Julia, también conocido como **REPL**. Lo abrímos en una terminal ejecutando `$ julia`. Una vez dentro del REPL, ejecutaremos el hola mundo, con esta sencilla instrucción para imprimir en pantalla:

```julia
julia> println("Hola Mundo")
Hola Mundo  
```
Listo, tenemos nuestro 'Hola Mundo'. 😄 

Otra forma para ejecutar código, es escribiendo el código dentro archivos con extensión `.jl`, por ejemplo, en un archivo `script.jl` como sigue:

```julia
println("Hola Mundo")
```
y ejecutar el script en la terminal:

```console
$ julia script.jl
Hola Mundo
```
Podemos personalizar nuestro 'Hola, mundo', preguntando el nombre del usuario, con la siguiente línea:

```julia
println("¿Cuál es tu nombre?")
nombre = readline()                   # Con esta instrucción podemos introducir datos desde la terminal.

println("Hola, ", nombre)
```

Listo, hemos ejecutado un nuevo 'Hola Mundo'. 😄 
***

## Julia Esencial

## Variables
En Julia, una variable es un nombre asociado a un valor, útil para almacenar ese valor en memoria para su uso posterior. Para declarar variables en Julia, se usa la asignación directa:

```julia
variable = 1 + 2
nombre = "Juan"
mensaje = "Hola Mundo"
```
Las variables son sensibles a mayúsculas y minúsculas, pero estás diferencias no tienen significado semántico, es decir, si tienen propiedades diferentes si se escriben en una forma u otra.

El nombre de las variables pueden usar cualquier carácter de UTF-8, por ejemplo:

```julia
δ = 0.001
```
En el REPL de Julia u otros editores, se pueden escribir carácteres especiales de LaTeX presionando el backslash \\ y el nombre del carácter, seguido de un TAB. Por ejemplo, \alpha + TAB = α.

Los nombres de las variables en Julia por convención deben iniciar por una letra (A-Z ó a-z), guiones bajos o carácteres especiales Unicode, ya sea letras o simbolos matemáticos. En estos últimos, se debe tener precaución ya que algunos se podría confundir con los operadores matemáticos que usa Julia.

Los nombres para variables no validos son aquellas dentro de la lista de *palabras reservadas* del lenguaje. Por ejemplo: *begin, break, function, do, if*, etc.

Julia impone pocas restricciones al asignar nombre a las variables, se recomienda las siguientes **convenciones de estilo**:

1. El nombre de las variables son escritas en minúsculas. 
2. La separación de palabras puede ser indicada por el guión bajo, pero se desaconseja a menos de que el nombre sea díficil de leer en otro caso.
3. El nombre de **Type**s y **Module**s deben empezar por una letra mayúscula y se debe utilizar *CamelCase* entre palabras de nombres compuestos, en lugar de guiones bajos.
4. El nombre de **function**s y **macro**s deben escribirse siempre en minúsculas y sin guiones bajos.
5. Las funciones que modifican o escriben en sus argumentos en lugar de simplemente devolver un resultado, por convención sus nombres siempre finalizan con **!**. Este tipo de funciones se les conoce como "mutantes" (*mutating*) o (*in-place*).

Para más ver más recomendaciones, por favor revise la [guía de estilo](https://docs.julialang.org/en/v1/manual/style-guide/) de Julia.

## Tipos de Datos
Una de las fortalezas de Julia es su amplia variedad de tipo de datos. Además, cada tipo de dato es muy especifico a las necesidades que requiere la tarea.

A diferencia de otros lenguajes de programación como Javascript donde se tienen solo unos tipos de datos genéricos, por ejemplo, "number" para cualquier dato númerico, en Julia se tiene que ser muy especifico, es especial sí se quiere tener un buen desempeño del lenguaje. Esto, aunque a primera vista podría parecer engorroso, nos dará ventajas que veremos más adelante.

Empecemos a ver los diferentes tipos de datos que nos ofrece Julia. 

### Números Enteros y de Punto Flotante
Julia proporciona una amplia gama de tipos numéricos primitivos, y sobre ellos se define un conjunto completo de operadores aritméticos y bit a bit, así como funciones matemáticas estándar.

En la parte de números enteros, Julia nos proporciona los siguientes tipos numéricos primitivos:

|Tipo|Signo|Número de bits|Valor mínimo|Valor máximo|
|--|--|--|--|--|
|Int8|✓|8|-2^7|2^7 - 1|
|UInt8|	|8|0|2^8 - 1|
|Int16|✓|16|-2^15|2^15 - 1|
|UInt16| |16|0|2^16 - 1|
|Int32|✓|32|-2^31|2^31 - 1|
|UInt32| |32|0|2^32 - 1|
|Int64|✓|64|-2^63|2^63 - 1|
|UInt64| |64|0|2^64 - 1|
|Int128|✓|128|-2^127|2^127 - 1|
|UInt128| |128|0|2^128 - 1|
|Bool|N/A|8|false (0)|true (1)

Y para datos de números de punto flotante, tiene los siguiente tipos primitivos:

|Tipo|Precisión|Número de bits|
|--|--|--|
|Float16|half|16|
|Float32|single|32|
|Float64|double|64|

Por defecto, el tipo de dato que usa Julia depende de la arquitectura del sistema donde se ejecuta, si se trata de 32-bits o de 64-bits.

Para saber el tipo de dato con el que se está trabajando algún literal, podemos usar la instrucción:

```julia
julia> typeof(25)
Int64

julia> typeof(3.1416)
Float64
```

Existe un truco muy útil al trabajar con números muy grandes, se pueden separar los cifras con guiones bajos, y Julia los omitira internamente:

```julia
julia> a = 1_234_567
1234567

julia> b = 0.000_000_000_5
5.0e-10
```

Los números UInt se representan el prefijo *0x* seguido del número en hexadecimal (digitos 0-9a-f). El tamaño del valor UInt es determinado por el número hexadecimal.

```julia
julia> x = 0x1
0x01

julia> typeof(x)
UInt8

julia> x = 0x12f
0x012f

julia> typeof(x)
UInt16
```

También es soportado la representación binaria u octal de los literales númericos, usando los prefijos *0b* y *0o* respectivamente.

```julia
julia> x = 0b101
0x05

julia> typeof(x)
UInt8

julia> x = 0o217
0x8f

julia> typeof(x)
UInt8
```

Se puede revisar los valores mínimos y máximos que puede representar los diferentes tipos de datos númericos con la siguientes instrucciones:

```julia
julia> typemin(Int32)
-2147483648

julia> typemax(Int32)
2147483647
```

Se pueden convertir los tipos de datos simplemente indicando el nuevo tipo de dato.

```julia
julia> Float64(2)
2.0
julia> Int64(3.0)
3
```

Los números de punto flotante se pueden declarar usando las estandars representaciones, incluyendo la notación E-exponencial:

```julia
julia> 2.
2.0

julia> 2.5e-4
0.00025

julia> 3.5f-4
0.00035f0
```

Y aunque, el literal 3.5, Julia lo interpreta como de tipo Float64, se puede declarar como de tipo Float32 agregandole al final el sufijo *f0*

```julia
julia> typeof(3.5)
Float64

julia> typeof(3.5f0)
Float32
```

En los tipos de punto flotante, existen **dos ceros**, el cero positivo y el cero negativo. Aunque son iguales el uno del otro, pero tienen diferente representación binaria.

```julia
julia> 0.0 == -0.0
true
```
Existe tres valores especificos de números de punto flotante, los cuales no se corresponden a ningún punto en la recta real;

|Nombre|Float16|Float32|Float64|Descripción|
|--|--|--|--|--|
|Infinito positivo|Inf16|Inf32|Inf|Un valor más grande que cualquier número de punto flotante finito|
|Infinito negativo|-Inf16|-Inf32|-Inf|Un valor menor que cualquier número de punto flotante finito|
|No es un número|NaN16|NaN32|NaN|Un valor que no es igual (==) a ningún número de punto flotante, incluyendo a el mismo|

Existe un tipo de número, entero y flotante, que sirve para trabajar con números de precisión arbitraria, aún de los límites por tipo. Estos son **BigInt** y **BigFloat**.

### Literales numéricos como coeficientes
La síntaxis de Julia nos permite tener literales numéricos como coeficientes de expresiones o fórmulas. De está forma, podemos tener expresiones claras, ya que un literal que precede a una variable es interpretado como una multiplicación:

```julia
julia> x = 3
3

julia> 2x^2 - 3x + 1
10

julia> 1.5x^2 - .5x + 1
13.0
```

Aunque hay que tener cierto cuidado al interpretar esta última regla, ya que Julia parseara, por ejemplo 2^3x como 2^(3x) y 2x^3 será interpretado como 2*(x^3).

También los coeficiente númericos funciona con expresiones entre paréntesis:

```julia
julia> 2(x-1)^2 - 3(x-1) + 1
3
```

Julia proporciona funciones para retornar cero o uno del tipo especifico del argumento dado:

```julia
julia> zero(Float32)
0.0f0

julia> zero(1.0)
0.0

julia> one(Int32)
1

julia> one(BigFloat)
1.0
```
### Números racionales
Julia incluye nativamente los tipos de datos de números racionales (aquellos que se pueden escribir como una fracción de enteros) y números complejos (aquellos con parte real y parte imaginaria).

Los **números racionales** son construidos usando el operador **//** como sigue:

```julia
julia> typeof(2//3)
Rational{Int64}
```
Si el numerador y el denominador tienen factores comúnes, la fracción será reducida a su mínima expresión:

```julia
julia> 5//10
1//2
```

Como está normalización es única, ambos números son iguales, y se pueden comparar directamente con cualquier operador de comparación valido:

```julia
julia> 1//2 == 5//10
true

julia> 3//4 < 2//3
false
```

Sin problemas se puede convertir un racional en tipo de punto flotante como:

```julia
julia> float(3//4)
0.75
```

La promoción de tipo nos ayuda a que un racional pueda operar con cualquier otro tipo de dato númerico directamente.

### Números complejos
Para el tipo de datos **numéricos complejos**, Julia implementa la constante global **im** ligada a la unidad imaginaria matemática $i$, que representa la $\sqrt{-1}$. Además, dado que Julia acepta la yuxtaposición de literales númericos como coeficientes para las variables, la notación utilizada para la definición de números complejos es similiar a la forma tradicional matemática:

```julia
julia> typeof(1 + 2im)
Complex{Int64}
```
Y pueden realizarse cualquier tipo de operación matemática entre números complejos, e inclusive, por promoción de tipo, puede operar con otros tipos de datos númericos sin problema:

```julia
julia> (1 + 2im) * (2 + 3.im)
-4 + 7im

julia> 3(1 + 2im)^2.0
-9.0 + 12.0im
```

Tenga cuidado cuando los coeficientes de la parte imaginaria son fracciones, ya que puede presentarse confusiones en expresiones de este estilo: $3/4im == 3/(4*im) == -(3/4)*im$.

Julia provee de funciones estandar básicas para la manipulación de números complejos:

```julia
julia> z = 1 + 2im
1 + 2im

julia> real(z) # Parte real de z
1

julia> imag(z) # Parte imaginaria de z
2

julia> conj(z) # Complejo conjugado z
1 - 2im

julia> abs(z) # Norma o valor absoluto de z
2.23606797749979

julia> abs2(z) # Norma cuadrada o valor absoluto cuadrado de z
5

julia> angle(z) # Ángulo o fase de z
1.1071487177940904
```
Si bien es posible construir complejos a partir de variables númericas que representen sus coeficientes:

```julia
julia> a = 1; b = 2;
julia> a + b*im
1 + 2im
```
es recomendable y más eficiente construirlo a partir de la función *complex*, donde directamente lo construye pasando la parte real e imaginaria del complejo:

```julia
julia> complex(a, b)
1 + 2im
```

### Strings
Los literales tipo string son cadenas finitas de carácteres. Cada carácter es un elemento de tipo Char. Julia puede aceptar, en términos sencillos, cualquier carácter UTF-8. 

Se puede definir los strings entre comillas dobles o entre dos pares de comillas triples, como el siguiente ejemplo:

```julia
julia> str1 = "Hola \
mundo"
"Hola mundo"
julia> str2 = """Hola, estoy escribiendo en un párrafo.
Ahora estoy escribiendo en la segunda línea,
pero finalizaré aquí."""
"Hola, estoy escribiendo en un párrafo. \nAhora estoy escribiendo en la segunda línea, \npero finalizaré aquí."
```

donde se puede posponer la escritura del string mediante `\`, además de que dentro del string se pueden agregar los carácteres especiales de salto de línea y tabulador.

Los strings con objetos iterables, y puedes obtener los carácteres que lo integran de la siguiente forma:

```julia
julia> str1[1]
'H': ASCII/Unicode U+0048 (category Lu: Letter, uppercase)

julia> str1[4]
'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
```
**Nota**: aúnque esto es cierto en la mayoria de casos, Julia indexa los string realmente por la cantidad de bytes que ocupa el carácter para ser codificado. UTF-8 incluye carácteres de longitud en byte variable. El índice arriba indicado, se refiere a la posición de byte que observa para retornar el carácter, en lugar de referirse a la posición relativa del carácter dentro del string. Esto es algo para tener en cuenta y cuidado a la hora de trabajar con strings. Para revisar más detalles al respecto, [aquí](https://docs.julialang.org/en/v1/manual/strings/#Unicode-and-UTF-8).

Para usar símbolos o carácteres Unicode, sólo se tienen que declarar como:

```julia
julia> s = "\u2200 x \u2203 y"
"∀ x ∃ y"
```

Para realizar la **concatenación** de dos o más strings, se puede realizar de manera sencilla de dos formas, la primera es usando la función *string*, la cual toma dos o más strings, y crea uno nuevo:

```julia
julia> str1 = "Hola "; str2 = "Mundo";

julia> string(str1, str2)
"Hola Mundo"
```

Las segunda forma es utilizando el operador **\*** (de multiplicación). 
```julia
julia> str1 * str2
"Hola Mundo"
```
Si bien, en otros lenguajes utilizan el operador **+** para realizar la acción de concatenación de strings, sintacticamente es un poco incorrecto, ya que la operación de concatenación es no-conmutativo. De hecho, matemáticamente, el conjunto de todos los strings de longitud finita **S** junto con el operador de concatenación **\*** forma un monoide libre $(S,*)$, que no es conmutativo. Y es común representar la operación concatenación con el símbolo **\***, por lo que Julia es coherente con esa notación.

Para utilizar el valor de variables con literales strings dentro de nuevos string, Julia utiliza la interpolación mediante el simbolo **$**, de la siguiente forma:

```julia
julia> "$str1 a todos, hoy salió el sol para todo el $str2"
"Hola a todos, hoy salió el sol para todo el Mundo"
```
De hecho se pueden evaluar expresiones y retornarlas dentro del string con el mismo simbolo como sigue:

```julia
julia> "El resultado de sumar 1 y 2 es $(1 + 2)"
"El resultado de sumar 1 y 2 es 3"
```

## Operadores matemáticos y funciones elementales

Julia provee con un colección completa de operadores aritméticos y bit a bit en todos los tipos de primitivos. Así como una colección de funciones matemáticas éstandar implementadas eficientemente.

### Operadores aritméticos
En la siguiente tabla, se muestran los **operadores aritméticos** básicos:

|Expresión|Descripción|
|---|---|
|x **+** y|Suma o adición|
|x **-** y|Resta o sustracción|
|x **\*** y|Multiplicación|
|x **/** y|División|
|x **÷** y|División truncada al entero|
|x **\\** y|División invertida equivalente a y/x|
|x **^** y|Potencia|
|x **%** y|Residuo|

### Operadores booleanos
En la siguiente tabla, se muestra los **operadores booleanos**:

|Expresión|Descripción|
|---|---|
|**!** x|Negación lógica|
|x **&&** y|Operador AND|
|x **\|\|** y|Operador OR|

### Operadores de actualización
Todos los operadores aritméticos tienen su correspondiente **operador de actualización**, esto es, toma el valor de una variable, ejecuta la operación y guarda el resultado en la misma variable. Por ejemplo, x **+=** 1 equivale a x = x **+** 1. Los operadores son:
```julia
+=   -=   *=   /=   \=   ÷=   ^=   %=
```

### Operadores de comparación
Los siguientes son los **operadores de comparación**:

|Expresión|Descripción|
|---|---|
|==|Igualdad|
|!=,   ≠|Desigualdad o diferente|
|<|Menor que|
|>|Mayor que|
|<=,  ≤|Menor o igual que|
|>=,  ≥|Mayor o igual que|

Al igual que Python, Julia acepta cadena de comparaciones de la siguiente forma:

```julia
julia> -21 < 1 < x <= 4 < 10 
true
```
### Funciones matemáticas básicas
Las siguientes son las **funciones de redondeo**:
|Función|Descripción|
|---|---|
|round(x)|Redondea al entero más cercano|
|floor(x)|Redondea al entero más cercano en dirección a **-∞**|
|ceil(x)|Redondea al entero más cercano en dirección a **+∞**|
|trunc(x)|Redonde al entero más cercano en dirección a cero|

Algunas funciones de **valor absoluto y signo**:

|Función|Descripción|
|---|---|
|abs(x)|Valor absoluto o magnitud de un número, según corresponda|
|abs2(x)|Cuadrado del valor absoluto o de la magnitud del número|
|sign(x)|Regresa el signo del valor, ya sea -1, 0 ó 1. Para el caso de un número complejo, lo regresa normalizado|

La siguiente tabla contienen las principales **funciones potencia, raíces y logaritmos*:
|Función|Descripción|
|---|---|
|sqrt(x),   √x|Raíz cuadrada|
|cbrt(x),   ∛x|Raíz cúbica|
|hypot(x, y)|Hipótenusa de un triángulo rectángulo cuyos cátetos miden x e y|
|exp(x)|Función exponencial de x|
|log(x)|Logaritmo natural de x|
|log(b, x)|Logaritmo base b de x|
|log2(x)|Logaritmo base 2 de x|
|log10(x)|Logaritmo base 10 de x|

También, Julia incluye las funciones **trigonométricas** estandar:
```
sin     asin     sinh   asinh
cos     acos     cosh   acosh
tan     atan     tanh   atanh
cot     acot     coth   acoth
sec     asec     sech   asech
csc     acsc     csch   acsch
```
Adicionalmente, ya ofrece en el repertorio funciones **sinpi(x)** y **cospi(x)** que son versiones mejor implementadas y optimizadas para calcular **sin(π\*x)** y  **cos(π\*x)**.
De manera paralela, se incluyen funciones trigonométricas que hacen los cálculos en grados en lugar de radianes, agregandole una *d* al nombre de la función: sind(x), cosd(x), tand(x) ...

### Funciones vectorizadas
Todas las funciones y operadores tienen su versión **vectorizada**, eso es, que aplicadas a un arreglo o vector, las funciones actuan sobre cada uno de los elementos (*elementwise*), mediante el *operador punto (.)*. Por ejemplo, si tenemos la instrucción [1, 2, 3]^2, dicha instrucción no está definida en la base estandar. En cambio, utilizando el operador punto como [1, 2, 3] **.^** 2, ahora sí, la operación potencia se aplicada a cada elemento del vector [1^2, 2^2, 3^2]. Este operador puede ser aplicado a cualquier operador básico. Por convención y para evitar confusiones con los literales exponentes, se recomienda siempre dejar un espacio blanco en cada lado de los operadores.

Las **funciones básicas vectorizadas** tambien se pueden aplicar elemento a elemento agregando un punto al final del nombre de la función. Por ejemplo, **sin.(x)** aplicará la función **sin** a cada elemento del vector x. 

```julia
julia> vec = [1, 2, 3, 4, 5, 6];

julia> sqrt.(vec)
6-element Vector{Float64}:
 1.0
 1.4142135623730951
 1.7320508075688772
 2.0
 2.23606797749979
 2.449489742783178
```

## Funciones
### Bloque function
Las funciones en Julia son objetos que toman una tupla de valores y retornan un valor. En general, las funciones no son puras en Julia, ya que pueden ser afectadas por el estado global del programa.

La síntaxis básica para declarar funciones en Julia es la siguientes:

```julia
julia>  function f(x, y)
            x + y
        end
```
La definición de la función comienza con la palabra reservada ***function*** seguida por el nombre de la función y sus argumentos. Siempre se debe finalizar el bloque de definción de la función con la palabra reservada ***end***. 

Por default, las funciones regresan siempre el valor de la última instrucción de su definición. Sin embargo, también existe la palabra reservada ***return*** que explicitamente indica el valor que la función retornará. Toda expresión después de la línea de *return* será ignorada. 

Es recomendable siempre incluir explicitamente el return de las funciones:

```julia
julia>  function f(x, y)
            return x^2 - 2x + y
        end
```
### Funciones por asignación
Existe otra síntaxis para declarar funciones más compacta, llamada ***por asignación***, ideal cuando la definición de la función se puede hacer en una sola expresión:

```julia
julia> f(x, y) = x^2 - 2x + y
```

Al igual que con el nombre de las variables, se pueden usar carácteres Unicode para el nombre de las funciones:

```julia
julia> ∑(x, y) = x + y

julia> ∑(2, 7)
9
```

### Funciones anónimas
Existe una tercera síntaxis para declarar funciones, las llamadas ***funciones anónimas*** (equivalentes a las *lambda functions* de Python o las *arrow functions* de JavaScript), que principalmente se utilizan como argumentos de otras funciones, y que no se requieren conservar después de su ejecución. Las dos formas equivalenes para declararlas es como sigue:

```julia
julia> x -> x^2 - 2x + 1            # En una sola línea

julia>  function (x)                # Sin incluir un nombre a la función
            x^2 - 2x + 1
        end
```

Las funciones anónimas pueden aceptar múltiples argumentos, con la siguiente síntaxis:

```julia
julia> (x, y) -> x^2 - 2x + y
```
Existe una tercera forma para declarar funciones anónimas, es por medio del [Bloque do](#bloque-do), que se describirá más adelante.

### Argumentos keyword
Se pueden incluir **keyword arguments** en las funciones (al igual que en Python), separandolos de los argumentos posicionales con `;` de la siguiente forma:

```julia
julia>  function f(x, y; radio=1.0, eje=1.0)
            return x + y * radio / eje
        end
```
### Tipado de argumentos
Es posible indicar el tipo de dato de los argumentos (tanto de los argumentos posicionales como los keyword), al igual que el tipo de dato que retorna la función.

La síntaxis para declarar el tipo de dato se realiza con los cuadripuntos **::** (similares a Fortran), de la siguiente forma:

```julia
julia>  function prediccion(x::Float64; n::Int64 = 5, p::Float64 = 0.5)::Float64
            return (n * x) ^ p 
        end
```
Julia se asegurará de convertir el resultado al tipo de dato que declara como salida de la función.

Si bien, el tipado de argumentos no da ninguna ventaja en el desempeño del código, será sumamente útil para aplicaciones más avanzadas de Julia (veáse el [Despacho múltiple](#métodos-de-funciones-despacho-múltiple)). 

### Vectorización de funciones
Una de las implementaciones más interesantes en Julia incluida en sus sistema base, es la implementación vectorizada (elemento a elemento) de las funciones al ser aplicadas a arreglos, vectores o matrices. Para conseguirlo, usamos la síntaxis punto (*dot syntax*) que ya vimos anteriormente con las funciones elementales, pero esta vez a nuestras funciones:

```julia
julia> A = [1.0, 1.5, 2.0, 3.0, 5.0]

julia> prediccion.(A, n=5, p=0.5)       # Si se ejecuta la función sin el punto, salta un error
5-element Vector{Float64}:
 2.23606797749979
 2.7386127875258306
 3.1622776601683795
 3.872983346207417
 5.0
```
**Nota**: La síntaxis *punto* es azucar sintáctica de la función [broadcast](#broadcasting) que justamente realiza la operación de aplicar una función a cada uno de los elementos de los arreglos.

### Composición de funciones
Otra curiosidad de Julia, es que se puede realizar de manera sencilla **composición de funciones**, esto es, aplicar una función sobre el resultado de otra función (algo muy natural en matemáticas). Esto se logra con el operador de composicion `∘` esto es, `(f ∘ g)(args...)` es lo mismo que `f(g(args...))`. Dentro del REPL, el operador composición se obtiene escribiendo **\circ + TAB**.

Otra implementación de la composición de funciones es utilizando el operador *pipe* `|>` (algo más común entre los programadores). Realiza exactamente lo mismo, la salida de una función pasa como argumento de la siguiente:

```julia
julia> x = [1, 2, 3, 4, 5]

julia> sqrt(sum(x))         # Composición de funciones normal
3.872983346207417

julia> (sqrt ∘ sum)(x)      # Al estilo matemático
3.872983346207417

julia> x |> sum |> sqrt     # Utilizando pipe al estilo programador
3.872983346207417
```

### Return nothing
Finalmente, las funciones que no regresan algún valor y sólo realizan cambios, por convención se retorna la expresión ***nothing*** como sigue:

```julia
julia>  function imprime(nombre)
            println("Buenos días, $nombre")
            return nothing
        end
```

## Bloques de Control de Flujo: Condicionales, Ciclos y Otros
### Condicionales

Los bloques condicionales permiten evaluar porciones de código dependiendo si se cumple o no cierta expresión booleana. La estructura condicional sigue el siguiente patrón `if-elseif-else`:

```julia
julia>  if condición_1
            # Bloque de código 1
        elseif condición_2
            # Bloque de código 2
        else
            # Bloque de código 3
        end
```
El bloque condicional no introduce un alcance local de las variables, lo que significa que variables definidas o modificadas dentro del bloque, pueden ser accedidas fuera de él después de la ejecución del bloque condicional.

Existe otra síntaxis para evaluar condicionales, principalmente cuando se pueden escribir en una sóla expresión, el llamado ***operador ternario*** **? :** que tiene la siguiente estructura sintáctica:

```julia
julia> condición ? expresión_1 : expresión_2
```
La expresión condicional se pone antes del signo **?** . Si la ***condición*** es verdadera, se ejecuta el ***expresión_1***. En caso contrario, si la ***condición*** es falsa, se ejecuta ***expresión_2***.

### Evaluación Short-Circuit 
Al evaluar dos o más condiciones lógicas, Julia utiliza tanto **&&** como **||** como operadores lógicos AND y OR respectivamente. Sin embargo, estos operadores tienen una propiedad adicional, la evaluación ***short-circuit*** o de cortocircuito, el cual consiste en no evaluar necesariamente el segundo argumento. En una serie de expresiones booleanas conectadas con estos operadores, sólo el mínimo de expresiones necesarias son evaluadas para determinar el valor del booleano final. En otras palabras, tenemos estas dos condiciones:

1. En la expresión `A && B`, la subexpresión ***B*** es evaluada solamente si la expresión ***A*** es **verdadera**.
2. En la expresión `A || B`, la subexpresión ***B*** es evaluada solamente si la expresión ***A*** es **falsa**.

La razón de estas dos condiciones es la siguiente: 

1. Si ***A*** es falsa, entonce la expresión `A && B` debe ser falsa, independientemente del valor que tenga ***B***.
2. Si ***A*** es verdadera, entonces las expresión `A || B` debe ser verdadera, independientemente del valor que tenga ***B***.

La evaluación *short-circuit* de los operadores **&&** y **||** se realiza de izquierda a derecha, teniendo la preferencia la evaluación de **&&** sobre **||**. 

Si se desea hacer la evaluación explicita de las dos subexpresiones **A** y **B**, entonces se puede usar los operadores lógicos bit a bit **&** y **|**.

La evaluación *short-circuit* frecuentemente es utilizado en Julia como un truco para hacer evaluaciones `if <condición> <expresión> end`. Por ejemplo, los siguiente ejemplos son equivalentes:

```julia
julia>  if condición
            # expresión
        end

julia> condición && # expresion
```

```julia
julia>  if ! condición                                      # Negación de la condición
            # expresión
        end

julia> condición || # expresion
```

### Ciclos While y For
El primer bloque para realizar ciclo de repeticiones es el **while**, el cual evalua una expresión condicional. En el caso de que la expresión condicional sea verdadera, el ciclo se ejecutará, hasta que se deje de cumplir la expresión. La estructura sintáctica del ciclo while es el siguiente:

```julia
julia>  while condición
            # Bloque de código
        end
```

El otro bloque para realizar repeticiones es el ciclo **for**, el cual recorre sobre algún objeto iterable (por ejemplo, objetos de **rango**) repitiendo la ejecución del bloque de código, hasta que se alcance el final del objeto iterable. La estructura sintáctica del ciclo for es el siguiente:

```julia
julia>  for i in objeto_iterable        # Forma pythonica de pertenencia
            # Bloque de código
        end

julia>  for i ∈ objeto_iterable         # Forma matemática de pertenencia
            # Bloque de código
        end

julia>  for i = objeto_iterable         # Forma matemática o de Fortran de declarar el loop
            # Bloque de código
        end
```
Se puede utilizar la palabra clave **in** o el símbolo ∈ (\in + TAB) o el símbolo igual (=) para índicar la pertenencia del índice mudo a cada elemento del objeto iterable.

Las objetos **range** son los más frecuentemente utilizados para iterar sobre un rango de valores numéricos. Hay dos formas equivalente de declarar rangos en Julia:

```julia
julia> range(inicio, final, step=n)         # Declaración de rango como en Python, pero es incluyente.

julia> inicio:step:final                    # Declaración preferida en Julia.
```

Para ciclos for anidados, se puede hacer de la forma tradicional, escribiendo dentro de un primer ciclo for el segundo ciclo for. Sin embargo, para muchos casos, puede ser conveniente y posible sustituir el anidamiento en un solo ciclo for como sigue:

```julia
julia>  for i in [1, 2], j in [3, 4]
            println((i, j))
        end
(1, 3)
(1, 4)
(2, 3)
(2, 4)
```
Hay que tener cuidado, ya que a diferencia del ciclo for anidado tradicional, donde recorre uno por uno los elementos de cada índice, en este último ciclo for hace el producto cartesiano de los elementos de los iterables, e itera sobre esos nuevos elementos. Para la mayoría de casos, ambos ciclos son equivalentes, pero se debe tener cuidado al trabajar con ellos dependiendo que la tarea que se quiera realizar.

### Bloque de Expresiones Compuestas
Muchas veces es conveniente y útil tener un sola expresión que evalue varias subexpresiones y que únicamente devuelva el valor de la última subexpresión. Hay dos formas equivalentes de hacer esto en Julia, la primera es con el ***bloque begin*** y la segunda es con cadenas ***;*** como sigue:

```julia
julia>  suma =  begin
                    x = 3
                    y = 5
                    x + y
                end

julia>  suma = (x = 3; y = 5; x + y)
```
En ambos casos, el valor que se guarda en la variable siempre será el resultado de la última instrucción. Aunque típicamente esta es la forma de utilizar las cadenas ***;*** y el bloque ***begin***, nada restringe la posibilida de tener un bloque begin en una línea, y una cadena ; multilínea.

```julia
julia>  suma =  begin; x = 3; y = 5; x + y; end

julia>  suma = (x = 3;
                y = 5;
                x + y)
```

### Bloque Do
Al pasar funciones como argumentos a ***funciones de orden superior***, tipicamente se usan [funciones anónimas](#funciones-anónimas). Pero muchas veces de dichas funciones requieren multiples líneas para su definición, lo que hace engorrosa y díficil la lectura del código. Afortunadamente, el bloque `do` solventa este problema.

El bloque `do` creará una función anónima que en autómatico se la pasará a la *función de orden superior*. Para esto, es necesario que la *función de orden superior* **reciba como primer argumento un función**. La síntaxis del bloque `do` es la siguiente:

```julia
# Invocación sin el bloque do sería: 
julia>  función_orden_superior(función_anonima, otros_args...)

# Usando el bloque Do
julia>  función_orden_superior(otros_args...) do argumentos_función_anonima,...
            # Intrucciones de la función anónima
        end
```
Por ejemplo:

```julia
julia> numeros = [(1,2),(9,2),(5,5),(7,3),(3,4)];

# Sin bloque Do:
julia> map(x -> begin
                    if x[1] < x[2]
                        return "Es menor"
                    elseif x[1] > x[2]
                        return "Es mayor"
                    else
                        return "Son iguales"
                    end
                end, numeros)

# Con el bloque Do:
julia>  map(numeros) do x
            if x[1] < x[2]
                return "Es menor"
            elseif x[1] > x[2]
                return "Es mayor"
            else
                return "Son iguales"
            end
        end 
```
La instrucción `do x` crea una función anónima con un argumento, `x -> ...` . Así, la instrucción `do x, y` creará una función anónima de dos argumentos, `(x, y) -> ...` . En cambio, la expresión `do (x, y)` creará una función anónima cuyo único argumento será una tupla que será deconstruida. Finalmente, la simple instrucción `do` definirá una función anónima sin argumentos `()-> ...` .

## Estructura de Datos
### Vectores y Arreglos
Los vectores son colecciones de elementos ordenados, los cuales pueden estar duplicados y ser de diferente tipo de dato cada uno. Los vectores son mutables, esto es, pueden agregarse elementos y eliminarlos. Es un objeto iterable y se puede acceder a sus elementos mediante indexación. Es muy similar a las listas en Python.

Hay varias formas de declarar un vector:

```julia
julia> a = [valor1, valor2, valor3, etc]

julia> b = Vector{T}([valor1, valor2, valor3, etc])

julia> c = Array{T, 1}([valor1, valor2, valor3, etc])
```
La primera forma es la forma más directa, donde Julia identifica el mejor tipo de vector que se definirá dependiendo del tipo de dato de los elementos.

La segunda forma, se define el objeto ***Vector***, donde *T* es el tipo de dato de los elementos que contendrá la lista. En este caso, los elementos futuros no pueden tener un tipo de dato distinto al declarado, por lo que hay que tener precaución.

La tercerda forma, se define al vector como un objeto ***Array*** de una dimensión. De la misma forma que el caso anterios, *T* es el tipo de dato de los elementos del vector. Realmente en el fondo, *Vector* es un alias de *Array* de una dimensión.


Como se mencionó con anterioridad, se pueden acceder a los valores de los vectores mediante la indexización usando los ***[]***. Se puede pasar el índice, número natural, o un rango, siempre y cuando tenga sentido. Julia es un lenguaje **1-indexado**, lo que significa que el índice del primer elemento es uno, a diferencia de lenguajes de programación como Python o JavaScript, que son 0-indexados, su primer elemento se indexa  a partir del cero.

```julia
julia> a = ["Hola", "¿Cómo estás?", "Muy bien", "Igualmente", "Adiós"]
5-element Vector{String}:
 "Hola"
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"
 "Adiós"

 julia> a[1]                                    # Accediendo al primer elemento
 "Hola"

 julia> a[2:4]                                  # Accediendo con un rango de índices
 3-element Vector{String}:
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"

julia> a[end]                                   # Accediendo al último elemento
"Adiós"
```

Las vectores se pueden modificar sobrescribiendo sobre algun elemento con un determinado índice:

```julia
julia> a[1] = "Buenos días"                     # Se sobreescribe directamente en el primer elemento

julia> a
5-element Vector{String}:
 "Buenos días"
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"
 "Adiós"
```
También se pueden agregar o quitar elementos al final del vector, de la siguiente forma:
```julia
julia> push!(a, "Postdata")                     # Agrega un elemento al final del vector
6-element Vector{String}:
 "Buenos días"
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"
 "Adiós"
 "Postdata"

julia> pop!(a)                                  # Elimina el último elemento del vector
5-element Vector{String}:
 "Buenos días"
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"
 "Adiós"
```
O se puede agregar o quitar elementos al principio del vector como sigue:
```julia
julia> pushfirst!(a, "Antes que nada")          # Agrega un elemento al principio del vector
6-element Vector{String}:
 "Antes que nada"
 "Buenos días"
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"
 "Adiós"

julia> popfirts!(a)                             # Elimina el primer elemento del vector
5-element Vector{String}:
 "Buenos días"
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"
 "Adiós"
```

También se pueden agregar los elementos de una lista a otra ya existente con la función **append** como sigue:

```julia
julia> append!(a, ["Buenas tardes", "Buenas noches"])
7-element Vector{String}:
 "Buenos días"
 "¿Cómo estás?"
 "Muy bien"
 "Igualmente"
 "Adiós"
 "Buenas tardes"
 "Buenas noches"
```

Como se mencionó anteriormente, los *vectores* son un caso particular de los *Array*, de una dimensión. Ahora, los *Array* de dos dimensiones, en Julia se le llama ***Matrices***, ya que representan datos ordenados en filas y columnas. Para definir las matrices o arreglos de dos dimensiones, los elementos de una misma fila se separan solo por espacio en blanco, mientras que para separar las filas se usa ; de la siguiente forma:

```julia
julia> b = [1 2 3; 4 5 6]
2×3 Matrix{Int64}:
 1  2  3
 4  5  6
```
Para acceder a los elementos de la matriz, tenemos que usar dos índices, el primero para la fila, el segundo para la columna:

```julia
julia> b[1, 2]
2
julia> b[2, 1]
4
```

Para agregar nuevos datos al final de la matrix, y modificando así su dimensión matricial, se realiza de la siguiente forma
```julia
julia> c = [b; [7 8 9]]                             # Se agrega como una nueva fila
3×3 Matrix{Int64}:
 1  2  3
 4  5  6
 7  8  9

julia> c = vcat(b, [7 8 9])                         # Se agrega como una fila al final
3×3 Matrix{Int64}:
 1  2  3
 4  5  6
 7  8  9

julia> c = hcat(b, [7; 8])                          # Se agrega como una nueva columna al final
2×4 Matrix{Int64}:
 1  2  3  7
 4  5  6  8
```

Los arreglos 3-dimensional, son arreglos de arreglos que se extienden una dimensión más. Para crearlos, se requiere usar la función ***cat*** o ***reshape*** de la siguiente forma:

```julia
julia> d = cat([1 2; 3 4], [5 6; 7 8], dims=3)
2×2×2 Array{Int64, 3}:
[:, :, 1] =
 1  2
 3  4

[:, :, 2] =
 5  6
 7  8
```
Para acceder a sus elementos, se requieren tres índices:

```julia
julia> d[1,2,2]
6

julia> d[2,1,1]
3
```

### Tuplas
Otra estructura de datos son las ***tuplas***, los cuales son contenedores de longitud fija y cuyos valores no se pueden modificar (son inmutables). Pero al igual que los vectores, sus valores se pueden acceder via índices. Las tuplas se definen con paréntesis y comas, como sigue:

```julia
julia> (1,)
(1,)

julia> (1, 1 + 1)
(1, 2)

julia> a = (2, "Hola", 3.0)
(2, "Hola", 3.0)

julia> typeof(a)
Tuple{Int64, String, Float64}

julia> a[2]
"Hola"
```
Note que para la tupla unidimensional, se requiere definirlo como $(1,)$ y no como $(1)$ ya que este último significa simplemente el valor 1 entre paréntesis.

Opcionalmente, los elementos de las tuplas se pueden nombrar, en tal caso, el objeto se llamará ***tupla nombrada***, y se construye como sigue:

```julia
julia> b = (nombre="Juan", apellido="Pérez", edad=15)
(nombre="Juan", apellido="Pérez", edad=15)

julia>  for element in b
            println(element)
        end
Juan
Pérez
15

julia> b.nombre                     # Accediendo al valor por su nombre mediante la notación punto
"Juan"

julia> b.edad
15
```

### Diccionarios
Los diccionarios en Julia, al igual que en Python, son colecciones de pares clave-valor (key-value), donde cada valor puede ser accedido por su clave, en lugar de índices, ya que en general, los diccionarios son desordenados. Cada diccionario debe tener claves diferentes, preferentemente deben ser strings, enteros o simbolos (:*simbolo*), mientras que en los valores no hay restricciones.

Un diccionario es definido mediante un constructor ya incluido **Dict()**, y separando la clave con el valor mediante el símbolo **=>** siguiendo la siguiente estructura y síntaxis:

```julia
julia> a = Dict("nombre" => "Juan", "apellido" => "Pérez", "edad" => 15, :Δ => "Hola")
Dict{Any, Any} with 4 entries:
  "edad"     => 15
  "nombre"   => "Juan"
  "apellido" => "Pérez"
  :Δ => "Hola"

julia> a["nombre"]
Juan

julia> a["edad"]
15

julia> a[:Δ]
"Hola"
```

Julia provee una función muy útil definida de base **get(diccionario, clave, default)**, que nos ayuda a traer el valor asociado a una clave, y en caso de no existir, lanzar un valor o mensaje por default:

```julia
julia> get(a, "nombre", "Beto")
"Juan"

julia> get(a, "domicilio", "Domicilio no registrado")
"Domicilio no registrado"
```

Al igual que en Python, existen funciones para obtener todas las claves o valores de un diccionario en un objeto iterable . Estas son **keys()** y **values** con la siguiente síntaxis:

```julia
julia> claves = keys(a)
KeySet for a Dict{Any, Any} with 4 entries. Keys:
  "edad"
  "nombre"
  "apellido"
  :Δ

julia> collect(claves)
4-element Vector{Any}:
 "edad"
 "nombre"
 "apellido"
 :Δ

julia> valores = values(a)
ValueIterator for a Dict{Any, Any} with 4 entries. Values:
  15
  "Juan"
  "Pérez"
  "Hola"

julia> collect(valores)
4-element Vector{Any}:
 15
 "Juan"
 "Pérez"
 "Hola"
```

Tanto los objetos regresados por las funciones *keys()* y *values()* pueden ser utilizados como iterables en ciclos *for*, se puede acceder a dichos elementos clave-valor directamente (como en Python con el método .items()) con la siguiente síntaxis:

```julia
julia>  for (clave, valor) in a
            println(clave, " => ", valor)
        end
edad => 15
nombre => Juan
apellido => Pérez
Δ => Hola
```

Los diccionarios se pueden modificar. Las tres principales modificaciones son: Agregar nuevos elementos clave-valor, actualizar el valor de claves ya existentes, y borrar claves-valor.

```julia
julia> a["ciudad"] = "Monterrey"                # Agregando un nuevo par clave - valor
"Monterrey"

julia> a["ciudad"] = "Guadalajara"              # Actualizamos el valor de una clave
"Guadalajara"

julia> println(a)
Dict{Any, Any}("ciudad" => "Guadalajara", "edad" => 15, "nombre" => "Juan", "apellido" => "Pérez", :Δ => "Hola")

julia> delete!(a, "ciudad")                     # Borrar un par clave - valor
Dict{Any, Any} with 4 entries:
  "edad"     => 15
  "nombre"   => "Juan"
  "apellido" => "Pérez"
  :Δ         => "Hola"
```

Se pueden unir dos o más diccionarios mediante la función ***merge()***. Esto crea un nuevo diccionario, o se puede modificar el primer diccionario con ***merge!***, como sigue:

```julia
julia> domicilio = Dict("ciudad" => "Guadalajara", "estado" => "Jalisco", "pais" => "México")
Dict{String, String} with 3 entries:
  "ciudad" => "Guadalajara"
  "pais"   => "México"
  "estado" => "Jalisco"

julia> merge(a, domicilio)
Dict{Any, Any} with 7 entries:
  "ciudad"   => "Guadalajara"
  "edad"     => 15
  "pais"     => "México"
  "nombre"   => "Juan"
  "apellido" => "Pérez"
  "estado"   => "Jalisco"
  :Δ         => "Hola"
```
***

## Julia Intermedio
### Arreglos multidimensionales
Julia provee de un implementación de alta calidad para el manejo de arreglos multidimensionales. Su biblioteca de arreglos está escrita enteramente en Julia y su eficiencia se debe enteramente al compilador. Es posible definir tipos personalizados de arreglos, gracias a la herencia del tipo AbstractArray.

En el caso general, los arreglos pueden contener objetos del tipo `Any` (cualquiera, indistinto). Pero para la mayoria de propositos computacionales, los arreglos pueden contener objetos de tipos más especificos como `Int64` o `Float64`. Y para cuestiones cientificas, incluve tipos `Complex`.

A diferencia de otros lenguajes de programación, Julia no espera que los programas sean escritos de forma "vectorizada" por mejorar su eficiencia. En cambio, el compilador de Julia utiliza la inferencia de tipos para generar código optimizado permitiendo que escribir el código con un estilo conveniente y legible, sin sacrificar el desempeño y memoria.

### Funciones Básicas para Arreglos
Estas son algunas de las funciones básicas para obtener información de los arreglos:

|Función|Descripción|
|---|---|
|**eltype(A)**|El tipo de dato de los elementos contenidos en A.|
|**length(A)**|Número de elementos en A.|
|**ndims(A)**|Números de dimensiones de A, p. ej. si A es un arreglo de **n** x **m**, el número de dimensiones es 2.|
|**size(A)**|Tupla con la dimensión de A. p. ej. si A es un arreglo de **n** x **m**, su dimensión es (n, m).|
|**size(A,n)**|Longitud de A a lo largo de la dimensión n.|
|**axes(A)**|Tupla con los índices validos para cada dimensión de A.|
|**axes(A,n)**|Un rango con los índices validos a lo largo de la dimensión n.|
|**eachindex(A)**|Un eficiente iterador para visitar cada posición de A.|

### Construcción de arreglos e inicialización
Existe muchas funciones para construir e inicializar arreglos. La siguiente lista contiene algunas de ellas, en las cuales, el argumento `dims...` son las dimensiones del arreglo y puede ser pasado ya sea como tupla con cada una de las dimensiones, o como una sucesion de argumentos númericos individuales. La mayoria de las funciones acepta como primer argumento el tipo de dato de los elementos del arreglo (***T***), que si se omite, por defecto será `Float64`.

|Función|Descripción|
|---|---|
|**Array{T}(undef, dims...)**|Construye un arreglo sin inicializar.|
|**zeros(T, dims...)**|Regresa un arreglo de todo ceros.|
|**ones(T, dims...)**|Regresa un arreglo de todo unos.|
|**trues(dims...)**|Regresa un arreglo binario con todos los valores true.|
|**falses(dims...)**|Regresa un arreglo binario con todos los valores false.|
|**reshape(A, dims..)**|Regresa un arreglo con todos los elementos de A pero de diferentes dimensiones.|
|**copy(A)**|Regresa una copia superficial del arreglo A.|
|**deepcopy(A)**|Regresa una copia profunda del arreglo A, esto es, recursiva a cada uno de sus elementos (en caso de tener arreglo de arreglos).|
|**similar(A, T, dims...)**|Regresa un arreglo sin inicializado del mismo tipo de A, pero con tipo de dato de cada elemento y dimensión personalizada. Si los argumentos `T` y `dims` se omiten, se toman directamente de A.|
|**rand(T, dims...)**|Arreglo con valores aleatorios uniformemente distribuidos sobre el intervalo abierto $[0,1)$.|
|**randn(T, dims...)**|Arreglo con valores aleatorios normal y estandarmente distribuidos.|
|**Matrix{T}(I, m, n)**|Matriz identidad de dimensión **m** x **n**. Requiere usar el paquete de `LinearAlgebra` para usar `I`.|
|**range(start, stop, length=n)**|Rango de **n** elementos linealmente espaciados, empezando en `start` y finalizando en `stop`. Es similar a np.linspace de Python.|
|**fill!(A, x)**|Llena el arreglo A con el valor x.|
|**fill(x, dims...)**|Regresa un arrego llena con el valor x, con dimensiones `dims`.|  

### Arreglos literales
Como vimos en secciones pasadas, se pueden definir arreglos especificando directamente sus elementos mediante parentesis cuadrados siguiendo la síntaxis `[a, b, c, ...]`, separando los elementos con comas. Esto genera un arreglo 1-dimensional (o vector columna). Con esta forma de declaración, el tipo del arreglo se determinará automáticamente a partir del tipo de dato de los elementos. Si el tipo de dato de los elementos es diferente, se determinará el tipo de dato común mediante la función de `promoción de tipo` (es decir, si tenemos enteros y flotantes, todos será promovidos a flotantes). En el caso de que los tipos de datos sean heterogéneos, entonces se definirá como tipo `Any`.

```julia
julia> [1, 2.3, 4//5]               # Cada elemento tiene un tipo de dato diferente 
3-element Vector{Float64}:
 1.0
 2.3
 0.8
 ```

 ### Concatenación
 Existen varias síntaxis para realizar la contatenación de arreglos.
 
 * Si los arreglos dentro de los paréntesis cuadrados son separados por punto y coma (`;`) o por saltos de línea, en lugar de comas (`,`), entonces esos elementos se concatenan verticalmente, en lugar de que sean elementos en sí mismos.

 ```julia
 julia> [1:2, 3:4, 5:6]                         # Arreglos separados por coma. Cada arreglo será 
 3-element Vector{UnitRange{Int64}}:            # un elemento en sí mismo.
 1:2
 3:4
 5:6


julia> [1:2; 3:4; 5:6]                         # Arreglos separados por punto y coma. Los elementos  
6-element Vector{Int64}:                       # de los rangos se concatena verticalmente.
 1
 2
 3
 4
 5
 6

 julia> [1:2                                    # Arreglos separados por salto de línea. Los
         3:4                                    # elementos de los rangos se concatena verticalmente.
         5:6]
6-element Vector{Int64}:
 1
 2
 3
 4
 5
 6
 ```
* Si los arreglos son separados por tabuladores, espacios vacíos, o dobles punto y coma (`;;`), entonces, los elementos son concatenados horizontalmente. *Nota: Recordemos que los arreglos unidimensionales se representan como vectores columna*.

```julia
julia> [1:3 4:6 7:9]                            # Arreglos separados por espacios vacios,
3×3 Matrix{Int64}:                              # sus elementos se concatenan horizontalmente
 1  4  7
 2  5  8
 3  6  9

julia> [[1, 2, 3] [4, 5, 6] [7, 8, 9]]
3×3 Matrix{Int64}:
 1  4  7
 2  5  8
 3  6  9

julia> [1 2 3]                                  # Arreglo de números concatenados horizontalmente.
1×3 Matrix{Int64}:                              # El resultado es un vector renglón.
 1  2  3

julia> [[1 2 3] [4 5 6] [7 8 9]]                # Se concatenan horizontalmente los elementos de los 
1×9 Matrix{Int64}:                              # vectores renglón para formar un vector reglón mayor.
 1  2  3  4  5  6  7  8  9

julia> [[1 2 3], [4 5 6], [7 8 9]]              # Se define un vector de vectores renglón. Realmente
3-element Vector{Matrix{Int64}}:                # no se están concatenando los elementos.
 [1 2 3]
 [4 5 6]
 [7 8 9]
```

* Los espacios vacíos, saltos de línea o punto y coma individual o doble se pueden combinar para hacer concatenaciones horizontales y verticales.

```julia
julia> [[1 2 3]; [4 5 6]; [7 8 9]]             # Se concatenan verticalmente los tres vectores renglón.
3×3 Matrix{Int64}:
 1  2  3
 4  5  6
 7  8  9

julia> [zeros(Int, 2, 2)    [1; 2]
        [3 4]               5]
3×3 Matrix{Int64}:
 0  0  1
 0  0  2
 3  4  5
```
Existe una jerarquía de orden al realizar las concatenaciones horizontales si se combinan simbolos para realizarlas:
* Los espacios y los tabuladores tienen preferencia sobre los `;`, realizando primero las concatenaciones horizontal y después las verticales.
* En cambio, si se utiliza punto y coma dobles `;;` para indicar la concatenación horizontal,  entonces las concatenaciones verticales tienen preferencia, y al finalizar se realizan las concatenaciones horizontales.

En otras palabras, se resuelven las concatenaciones en este orden: **tabs o espacios → `;` →  `;;`→**...
```julia
julia> [1:2; 4;; 1; 3:4]
3×2 Matrix{Int64}:
 1  1
 2  3
 4  4
```
Se puede realizar concatenaciones a más altas dimensiones, agregando triples, cuadruples,..., puntos y comas. El símbolo `;;;` significa una concatenación sobre una tercera dimensión, y así sucesivamente.
```julia
julia> [1; 2;; 3; 4;; 5; 6;;; 7; 8;; 9; 10;; 11; 12]
2×3×2 Array{Int64, 3}:
[:, :, 1] =
 1  3  5
 2  4  6

[:, :, 2] =
 7   9  11
 8  10  12
```
Más en general, cada uno de las formas anteriores, son azucar sintáctica de la función `cat` o alguna de sus variaciones: `vcat`, `hcat`, `hvcat`, `hvncat`.

### Array Comprehension
Los array comprehension son muy similares a los list comprehension de Python. Son arreglos que se construyen a partir de la iteración sobre los elementos de objetos iterables. Su construcción es muy similar a la notación de la definición de conjuntos:
```julia
A = [f(x,y,...) for x in iterable1, y in iterable2]$$
```
donde $f(x,y,...)$ es un expresión que será evaluada por cada uno de los iterables y cuyo resultado se guardará en el nuevo arreglo. Al igual que en Python, los arrays comprehension pueden evaluar condicionales `if` durante su construcción.

```julia
julia> numeros = [2, 3, 4, 5, 6];

julia> cuadrados = [x^2 for x in numeros]
5-element Vector{Int64}:
  4
  9
 16
 25
 36

julia> pares = [i for i in numeros if i % 2 == 0]
3-element Vector{Int64}:
 2
 4
 6
```
### Vistazo a los Generadores
A diferencia de los `array comprehension`, que se construyen completos a partir de las iteraciones y se guarda todo en memoria, en los `generadores` sólo se declara la expresión de su construcción y los elementos se van generando conforme se vayan necesitando, sin ser guardados en memoria.

Los `generadores` se construyen casi igual que los `array comprehension`, pero en lugar de usar paréntesis cuadrados `[]`, se usan paréntesis normales `()`. Los generadores también aceptan la evaluación de condicionales `if` es su construcción.

```julia
julia> pares = (n for n in 1:1000 if n % 2 == 0)
Base.Generator{Base.Iterators.Filter{var"#40#41", UnitRange{Int64}}, typeof(identity)}(identity, Base.Iterators.Filter{var"#40#41", UnitRange{Int64}}(var"#40#41"(), 1:1000))

julia> sum(pares)
250500
```
Se puede obtener los elementos de `generador` utilizando la función `iterate()`. Para mayor referencia a como recorrer un generador, por favor dirijase a la siguiente [documentación](https://docs.julialang.org/en/v1/base/collections/).

### Indexación
Para traer los elementos de los arreglos, se usan índices con la siguiente síntaxis general: 
$$A[i_1, i_2, i_3, ..., i_n]$$
donde cada $i_j$ puede ser un entero, un arreglo de enteros o un conjunto de índices soportados. Esto último incluye al símbolo (`:`) que selecciona todos los elementos indexados en la dimensión correspondiente. También incluye rangos del tipo *start:end*, *start:step:end*, o arreglo de booleanos donde se seleccionan los elementos con índice `true`.

```julia
julia> A = [ 1  2  3  4
             5  6  7  8
             9 10 11 12
            13 14 15 16 ]
4×4 Matrix{Int64}:
  1   2   3   4
  5   6   7   8
  9  10  11  12
 13  14  15  16

julia> A[2, 3]                          # Par de índices enteros. Retornan el valor de un elemento.
7

julia> A[[1, 3], [2, 4]]                # Par de vectores de índices.
2×2 Matrix{Int64}:
  2   4
 10  12

julia> A[:, 3]                          # Uso de : para traer todos los elementos en la primera dimensión.
4-element Vector{Int64}:
  3
  7
 11
 15

julia> A[3, :]                          # Uso de : para traer todos los elementos en la segunda dimensión
4-element Vector{Int64}:
  9
 10
 11
 12

julia> A[[1, 4], 1:2:4]                 # Uso de rangos para seleccionar una secuencia de elementos
2×2 Matrix{Int64}:
  1   3
 13  15
```
Dentro de los índices especiales soportados, existe la palabra `end` para indicar el último índice del arreglo, y su valor varía dependiendo de la dimensión y forma del arreglo.

```julia
julia> A[:, end]
4-element Vector{Int64}:
  4
  8
 12
 16
```

Ahora, sí se pasa un arreglo bidimensional de índices `I`, entonces elemento $i_j$ de `I` corresponde al índice individual del elemento `a_j` de A. Esto es, a cada elemento $a_j$ de A, le corresponde un índice individual:

```julia
julia> for (indice, elemento) in enumerate(A)
           println("A[$indice] = $elemento")
       end
A[1] = 1
A[2] = 5
A[3] = 9
A[4] = 13
A[5] = 2
A[6] = 6
A[7] = 10
A[8] = 14
A[9] = 3
A[10] = 7
A[11] = 11
A[12] = 15
A[13] = 4
A[14] = 8
A[15] = 12
A[16] = 16
```
Así, si creamos una matrix B cuyos elementos son los índices de los elementos de A, retornara los valores de A que le corresponden a dichos indices, por ejemplo:

```julia
julia> B = [1 5; 9 13]                      # Matriz de índices
2×2 Matrix{Int64}:
 1   5
 9  13

julia> A[B]                                 # Retorna los valores correspondientes a los índices
2×2 Matrix{Int64}:
 1  2
 3  4

julia> B = [6 2 13; 9 5 1]                  # Las dimensiones de la matriz de índices será
2×3 Matrix{Int64}:                          # la dimensión de la matriz resultado.
 6  2  13
 9  5   1

julia> A[B]
2×3 Matrix{Int64}:
 6  5  4
 3  2  1

```
Como se mencionó anteriormente, también se puede pasar un arreglo de valores booleanos, llamados *índices lógicos* o *máscara lógica*, donde solamente se seleccionan los elementos cuyo indice corresponde al valor `true`.

```julia
julia> logic = [false, true, true, false]
4-element Vector{Bool}:
 0
 1
 1
 0

julia> A[logic,:]
2×4 Matrix{Int64}:
 5   6   7   8
 9  10  11  12

julia> mascara = map(ispow2, A)
4×4 Matrix{Bool}:
 1  1  0  1
 0  0  0  1
 0  0  0  0
 0  0  0  1

julia> A[mascara]
5-element Vector{Int64}:
  1
  2
  4
  8
 16
```
### Broadcasting
Anteriormente vimos que se puede aplicar operaciones o funciones elemento a elemento sobre vectores o arreglos. Pero en otras será útil realizar operaciones binarias sobre arreglos de diferentes dimensiones, como por ejemplo, sumar un vector a cada una de las columnas de una matriz. Una manera poco eficiente de realizarlo sería hace una matriz con multiples copias del vector, y después hacer la suma de matrices. Al trabajar con matrices de altas dimensiones, esta estrategía se vuelve laboriosa de manejar y causa un desperdicio de memoria.

Es por eso que Julia provee de la función `broadcast`, que duplica un singletón para que coincidan con las dimensiones de la matriz correspondiente, creando una nueva matriz sin usar memoria adicional, y realizar la operación elemento a elemento. La función `broadcast` tiene la siguiente síntaxis `broadcast(f, args,...)`, donde `f` es la función que se quiere aplicar.

```julia
julia> a = [3, 5]
2-element Vector{Int64}:
 3
 5

julia> B = [1 2 3; 4 5 6]
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> broadcast(+, a, B)
2×3 Matrix{Int64}:
 4   5   6
 9  10  11
```
La *notación punto* para operadores o funciones es azúcar sintáctica de la función `broadcast`, es decir, `f.(args, ...)` es equivalente a `broadcast(f, args, ...)`. Además el `broadcast` no está limitado a arreglos únicamente, sino también es posible aplicarlo a otros objetos como escalares (`Numbers`, `Strings`, `Symbols`, `Types`, `Functions`), tuplas u otra colección. Los siguiente ejemplos son equivalentes:

```julia
julia> broadcast(string, 1:3, ".- ", ["Primero", "Segundo", "Tercero"])
3-element Vector{String}:
 "1.- Primero"
 "2.- Segundo"
 "3.- Tercero"

julia> string.(1:3, ".- ", ["Primero", "Segundo", "Tercero"])
3-element Vector{String}:
 "1.- Primero"
 "2.- Segundo"
 "3.- Tercero"
```
### Leer y escribir archivos
Antes de entrar al tema, revisemos lo siguiente. Julia provee dos funciones para leer y escribir datos sobre flujo de datos `stream`, estas son: `write`, `read`. Ambas funciones toman al `stream` como primer argumento:

```julia
julia> write(stdout, "Hola mundo");                         # Standard output
Hola mundo

julia> read(stdin, Char)                                    # Standard input
a
'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
```
En particular, para leer una línea completa, se puede realizar con una función más especifica: `readline` como sigue:

```julia
julia> readline(stdin)
Hola a todos.
"Hola a todos."
```

Para el caso de datos dentro de un archivo de texto, Julia provee la función `open`, la cual toma el nombre del archivo y regresa un objeto tipo `IOStream`, que puede ser usado con `read` y `write` para leer y escribir dentro del archivo. Por ejemplo:

```julia
julia> file = open("hola.txt")
IOStream(<file hola.txt>)

julia> readlines(file)
2-element Vector{String}:
 "¡Hola a todo el mundo!"
 "Sean felices :D"

julia> close(file)
```
O si lo que se desea es escribir sobre el archivo, se debe pasar como argumento "w" a la función `open`, como sigue:

```julia
julia> file = open("hola.txt", "w")
IOStream(<file hola.txt>)

julia> write(file, "Buenos días a todo el mundo.");
```
Si examinas el contenido del archivo en este punto, estará vacío. Esto es debido a que `IOStream` debe cerran antes de que los datos se escriban finalmente en el archivo.

```julia
julia> close(file)                      # Ahora sí los datos se escribirán en el archivo.
```
El patrón que se sigue al manejar datos en archivos: 
1. Se abren el archivo. 
2. Se trabaja con el contenido.
3. Se cierra el archivo. 

Es tan recurrente ese patrón, que existe otra forma de invocar la función `open`, la cual toma como primer argumento una función y como segundo argumento el nombre del archivo, e internamente abre el archivo, ejecuta la función tomando el objeto `IOStream` como argumento, y al terminar, lo cierra en automático. Por ejemplo:

```julia
julia> function leer_y_mayusculas(file::IOStream)
           return uppercase.(readlines(file))
       end

julia> open(leer_y_mayusculas, "hola.txt")
2-element Vector{String}:
 "¡HOLA A TODO EL MUNDO!"
 "SEAN FELICES :D"
```

Ahora, recordando lo mencionado en la sección del [Bloque Do](#bloque-do), es muy frecuente invocar a la función `open` de esta segunda forma pasandole como primer argumento una función anónima definida dentro de un bloque do, y tener una síntaxis parecida a la expresión ***with*** de Python, como la siguiente:

```julia
julia>  open("numeros.txt") do file
            return parse.(Int64, readlines(file))
        end
```

## Julia Avanzado
### Métodos de funciones: Despacho múltiple
***

## Referencias 

* [Introduction to Computational Thinking](https://computationalthinking.mit.edu/Spring21/). Curso impartido por el MIT, versión del 2021.
* [Documentación Oficial](https://docs.julialang.org/en/v1/) de Julia.
* [Guía de Estilo](https://docs.julialang.org/en/v1/manual/style-guide/) de Julia.
* [Aprendizaje de Julia](https://riptutorial.com/Download/julia-language-es.pdf). Ebook open-source en español en PDF.
* [Blog tutorial](https://www.analyticslane.com/2020/07/14/hola-julia/) en español muy amigable sobre Julia.
* [Breve introducción a Julia](https://mauriciotejada.com/programacionjulia/) en español.
* [Código básico con comentarios](https://github.com/aerdely/introJulia) para una introducción didáctica a Julia en español.