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

***

## Referencias 

* Curso de [Introduction to Computational Thinking](https://computationalthinking.mit.edu/Spring21/) impartido por el MIT, version del 2021.
* [Documentación Oficial](https://docs.julialang.org/en/v1/) de Julia.
* [Guía de Estilo](https://docs.julialang.org/en/v1/manual/style-guide/) de Julia.