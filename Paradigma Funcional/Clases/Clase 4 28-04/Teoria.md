# Clase 28-04

## Orden Superior

### Cohesión de los componentes
>Las tres funciones tienen más de un objetivo: por un lado recorren la lista separándola en cabeza y cola y por otro se encargan de definir el criterio por el cual me quedo con ciertos elementos. Esto se relaciona con el concepto de cohesión de los componentes de un sistema, en el caso del paradigma funcional los componentes se implementan mediante funciones: 
* una función es más cohesiva que otra si se enfoca en menos objetivos a la vez. 
* al disminuir la cohesión, no solo tengo más responsabilidades para cubrir, sino que es más probable cometer errores: puedo equivocarme en el criterio para filtrar, o puedo equivocarme en el algoritmo que recorre la lista.

### Ventajas de usar funciones de orden superior
> A nivel responsabilidades: si tuviera una consultora, podría decirle a diferentes programadores:
> Esta es la base para dividir trabajo. ¿En qué necesitan ponerse de acuerdo ambas personas? En la interfaz de la función que determina el criterio, (a -> Bool) y entonces cada una puede trabajar por separado.

### Funciones de Orden Sueperior
* Filter: seleccionar
* Map: transformación
* all / any: algunos o todos...
* fold: reducción
* flip

> En el presente capítulo hemos conocido las funciones de orden superior, una herramienta que reafirma el tratamiento de las funciones como valores, al igual que cualquier otro tipo de dato. La consecuencia es que podemos recibir un bloque de código para evaluar una expresión en el momento en que lo necesitemos, delegando el comportamiento a la función que recibimos como parámetro y logrando de esa manera tener abstracciones mucho más generales. 

## Testing
~~~
runTests = hspec $ do
  describe "Tests con números:" $ do
     it "1 + 1 es 2" $ do
       1 + 1 `shouldBe` 2

~~~

## Composicion y Aplicacion Parcial
> Anteriormente hemos visto que el paradigma funcional cuenta con las funciones como abstracción fundamental, representa un valor tan natural como un entero, un booleano o un string. En este capítulo sumamos la composición y la aplicación parcial como herramientas para poder reutilizar una función en diferentes contextos para resolver requerimientos.

> En la composición, construimos funciones nuevas a partir de la aplicación sucesiva de funciones existentes, mientras que en la aplicación parcial generamos una nueva función con la técnica de no pasar todos los parámetros que la definición propone.
