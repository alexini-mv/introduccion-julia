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
        * [Números racionales y complejos](#números-racionales-y-complejos)
        * [Strings](#strings)
    * [Operadores matemáticos y funciones elementales](#operadores-matemáticos-y-funciones-elementales)

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
Listo, hemos ejecutado un nuevo 'Hola Mundo'. 😄 
***

## Julia Esencial

### Variables
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

### Tipos de Datos
Una de las fortalezas de Julia es su amplia variedad de tipo de datos. Además, cada tipo de dato es muy especifico a las necesidades que requiere la tarea.

A diferencia de otros lenguajes de programación como Javascript donde se tienen solo unos tipos de datos genéricos, por ejemplo, "number" para cualquier dato númerico, en Julia se tiene que ser muy especifico, es especial sí se quiere tener un buen desempeño del lenguaje. Esto, aunque a primera vista podría parecer engorroso, nos dará ventajas que veremos más adelante.

Empecemos a ver los diferentes tipos de datos que nos ofrece Julia. 

#### Números Enteros y de Punto Flotante
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
#### Números racionales y complejos
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

#### Strings
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

### Operadores matemáticos y funciones elementales

Julia provee con un colección completa de operadores aritméticos y bit a bit en todos los tipos de primitivos. Así como una colección de funciones matemáticas éstandar implementadas eficientemente.

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

En la siguiente tabla, se muestra los **operadores booleanos**:

|Expresión|Descripción|
|---|---|
|**!** x|Negación lógica|
|x **&&** y|Operador AND|
|x **\|\|** y|Operador OR|

Todos los operadores aritméticos tienen su correspondiente **operador de actualización**, esto es, toma el valor de una variable, ejecuta la operación y guarda el resultado en la misma variable. Por ejemplo, x **+=** 1 equivale a x = x **+** 1. Los operadores son:
```julia
+=   -=   *=   /=   \=   ÷=   ^=   %=
```

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
***

## Referencias 

* Curso de [Introduction to Computational Thinking](https://computationalthinking.mit.edu/Spring21/) impartido por el MIT, version del 2021.
* [Documentación Oficial](https://docs.julialang.org/en/v1/) de Julia.
* [Guía de Estilo](https://docs.julialang.org/en/v1/manual/style-guide/) de Julia.
* Ebook open-source para el [Aprendizaje de Julia](https://riptutorial.com/Download/julia-language-es.pdf) en español.
* [Blog tutorial](https://www.analyticslane.com/2020/07/14/hola-julia/) en español muy amigable sobre Julia.