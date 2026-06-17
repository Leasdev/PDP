# Clase 05-05

## Expresion Lambda
> En el presente capítulo introdujimos las expresiones lambda como una forma de generar funciones anónimas, que son útiles para poder pasarse a funciones de orden superior y también para entender que todas las funciones se definen como una secuencia de expresiones lambda que reciben un parámetro, en ese caso decimos que la función está currificada y se puede aplicar parcialmente.

> Por ejemplo, la función map parece tener 2 argumentos: una función de conversión y una lista, y devuelve una nueva lista correspondiente al resultado de aplicar la función a cada elemento de la lista.
~~~
map :: (a -> b) -> [a] -> [b]
~~~
> Pero, en realidad, lo que pasa es que la función map recibe sólo una función (a -> b) y devuelve otra nueva función, la cual recibe una lista. O sea, el tipo anterior es equivalente al siguiente:
~~~
map :: (a -> b) -> ([a] -> [b])
~~~
> En haskell
~~~
\numero -> numero * 2
doble = (\numero -> numero * 2)
~~~
> Cuando usar
> ¿Esto significa que a partir de ahora todas nuestras funciones las vamos a definir utilizando expresiones lambda? ¡No! ✋ Solo estamos viendo una nueva herramienta dentro del paradigma funcional.
> También se las conoce como funciones anónimas, ya que solemos utilizarlas en casos donde no necesitamos darles demasiada entidad.
* Cuando no tenemos un buen nombre para la función
* Cuando la vamos a usar una sola vez
* Cuando no necesitamos guardas ni pattern matching (con más de una ecuación)
> Además, dentro de los 3 “mundos” del paradigma funcional (tipos, valores y patrones), las lambdas existen únicamente en el mundo de los valores.

## Currificacion
> Sin currificar (forma intuitiva)
~~~
sumaDe3Numeros :: Int -> Int -> Int -> Int
sumaDe3Numeros numero1 numero2 numero3 = numero1 + numero2 + numero3

sumaDe3Numeros' :: Int -> Int -> Int -> Int
sumaDe3Numeros' = (\numero1 numero2 numero3 -> numero1 + numero2 + numero3)
~~~
> En Haskell, programar consiste en:
> construir valores (muchos de ellos funciones) y ligarlos a nombres mediante bindings.
> A partir de esto:
* las lambdas crean funciones
* la aplicación parcial transforma funciones
* la composición combina funciones
* los parámetros implícitos evitan nombrar lo innecesario
> Todo encaja dentro del mismo modelo.
