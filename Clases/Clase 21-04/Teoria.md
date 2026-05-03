# Clase 21-04

## Estructuras de Datos, Guardas y Pattern Matching

### Alias de tipo
> El alias de tipo es una herramienta que nos permite mejorar la expresividad de nuestros tipos, pero no cambia el funcionamiento.
> Me permite utilizar lenguaje de dominio en mi codigo.
~~~
-- Ejemplo:
costoViaje :: Number -> Number
costoViaje = precioViaje.minutos.tiempo

type Precio = Number
type Distancia = Number

costoViaje :: Distancia -> Precio
costoViaje = precioViaje.minutos.tiempo
~~~
### Listas
> * Conjunto de cantidad de elementos que puede ir desde 0 hasta... infinito.
> * Todos los elementos son del mismo tipo
> * Possen constructores que son muy utiles al momentos de hacer funciones que las involucren.
> * Tienen muchos usos si les aplico funciones de orden superior.
~~~
-- Ejemplo: Constructores de Listas
listaDeBooleans :: [Bool]
listaDeBooleans = [True,False,True,False]

> head listaDeBooleans
> True

> tail listaDeBooleans
> [False, True, False]
~~~
~~~
-- Ejemplo: Pattern Matching con Listas
tailGenerica :: [a] -> [a]
tailGenerica = (x:xs) = xs

> tail [1,2,3,4,5]
> [2,3,4,5]
~~~
### Data
> Cuando hablamos de data hablamos de una estructura de dato complejo
> Puede contener distintos tipos de datos dentro de ellas.
> Crea una funcion para pedirle cada elemento que la conforma.
~~~
data Gimnasta = UnGimnasta{
    pesoGimnasta :: Number,
    tonificacionGimnasta :: Number
} deriving(Show,Eq)

alf :: Gimnasta
alf = UnGimnasta 200 10

> pesoGimanasta alf
> 200
~~~
### Tuplas
> Son estructuras de datos de tipo (tipo1,...tipon)
> Pueden ser o no del mismo tipo los datos que se encuentran contenidos.
> Se les puede extraer ambos datos de forma separada usando funciones especificas.
> Su principal y unica funcionalidad en realidad es la de agrupar datos.
~~~
-- Ejemplo:
ayudante1 :: (String, Numeber)
ayudante1 = ("Naza", 19)

> fst ayudante1
> "Naza"

> snd ayudante1
> 19
~~~
## Guardas
> Son una forma de definir funciones segun condiciones
~~~
funcion x
    | condicion1 = resultado1
    | condicion2 = resultado2
    | otherwise = resultadoFinal

Ejemplo:
data Categoria = Menor | Adulto | Jubilado

categoriaEdad :: Number -> Categoria
categoriaEdad edad
    | edad < 18 = Menor
    | edad <= 65 = Adulto
    | otherwise = Jubilado
~~~
> * Las condiciones son booleanas
> siemre tiene que dar True o False.
> * Se evaluan de arriba hacia abajo
> Haskell prueba la primera condicion
> Si es True -> usa ese resultado
> Si es False -> sigue con la siguiente
> * otherwise
> simplemente otherwise = True
> * Funcion no exhaustiva: cuando no se cumple ninguna condicion

> CLAVE:
> Usar guardas cuando: importan las condiciones (>, <, etc. )
> Usar pattern matching cuando: importa la forma de parametro
> Las guardas extienden el pattern matching cuando la decision no depende solo de la forma, sino de propiedades del valor.

