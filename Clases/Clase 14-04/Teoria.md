# Clase 14-04

## PARADIGMA FUNCIONAL

### Que es un Programa?
> Depende del paradigma, procesar datos; entra algo y sale algo.
> La idea de cajita que transforma.

- Procedural: Un programa es un conjunto de instrucciones ordenadas y logicas, escritas en un lenguaje de programcion.
- Funcional: Un programa en programacion funcional es aquel que se basa en el uso de funciones para resolver problemas.

> Una funcion en matematicas es una relacion entre dos conjuntos, el conjunto de entrada (dominio) y el conjunto de salida (codominio), que asigna a cada elemento del dominio un unico elemento de codominio. (Unicidad y existencia).

### Transparencia referencial
> f(1) es un expresion E cuyo resultado da un valor V. Tenemos un programa y si podemos reemplazar en todas las expresiones E por el valor V sin alterar el resultado del programa, independientemente del lugar donde aparezca E (no depende del contexto de ejecucion, ni de orden de evaluacion de dicha expresion).

### Tipos en Haskell
#### Valores
- Numbers
- Strings
- Booleanos

#### Funciones
- Infijas + - / * %
- == (comparacion por igualdad)
- < y > (menor que y mayor que)
- not (para negar)
  
#### Consulta de tipos
> :t length
> length :: [a] -> Number

### Sintaxis en Haskell
~~~
-- nombreFuncion :: TipoDelParam1 -> TipoDelParam2 -> ... -> TipoDelImagen
-- nombreFuncion param1 param2 ... = lo que hace la funcion

doble :: Number -> Number
doble numero = numero + numero
~~~

### Composicion
- Definicion
> Matematicamente, podemos aplicar dos funciones esto termina generando una nueva funcion. Como restriccion, la imagen de f tiene que coicidir con el dominio de g.
- Implementacion
> El mismo concepto se da en Haskell, donde la notacion es g(fx) = (g.f) x
- Ejemplo
~~~
cuadruple numero = (doble . doble) numero
cuadruple = (doble . doble)
~~~