# Clase 23-6

## Predicado not/1
~~~
juega(julia, 3).
juega(beto, 6).
juega(dodain, 5).
juega(juana, 15).
juega(sergio, 3).

yeta(Numero):-not(juega(_, Numero)).
~~~
> ¿Qué aridad tiene el predicado not? → 1 Pero el argumento que recibe... es un predicado. Entonces es un predicado de orden superior.
~~~
numeroRuleta(Numero):- between(1, 36, Numero).
~~~
> numeroRuleta/1 es un predicado inversible, esto significa que admite tanto consultas individuales (sí/no) como consultas existenciales:
~~~
? numeroRuleta(1).
true

? numeroRuleta(37).
false

? numeroRuleta(Numero)
Numero = 1 ;
Numero = 2 ;
~~~

## Predicado forall/2
~~~
materia(algoritmos, 1).
materia(analisisI, 1).
materia(pdp, 2).
materia(proba, 2).
materia(sintaxis, 2).

nota(nicolas, pdp, 10).
nota(nicolas, proba, 7).
nota(nicolas, sintaxis, 8).
nota(malena, pdp, 6).
nota(malena, proba, 2).
nota(raul, pdp, 9).
~~~

> Un alumno terminó un año si aprobó todas las materias de ese año
~~~
terminoAnio(Alumno, Anio):- 
     forall(materia(Materia, Anio), 
           (nota(Alumno, Materia, Nota), Nota >= 6)).
~~~
~~~
terminoAnio(Alumno, Anio):- 
	forall(materia(Materia, Anio), aprobo(Alumno, Materia)).
aprobo(Alumno, Materia):-nota(Alumno, Materia, Nota), Nota >= 6.
~~~

## Findall
~~~
padre(homero,bart). 
padre(homero,maggie). 
padre(homero,lisa).
~~~
> ¿cuántos hijos tiene homero?

~~~
findall(UnIndividuoOVariable, Consulta, Conjunto)
~~~

> Entonces: findall es un predicado que relaciona 
* un individuo o variable. 
* con una consulta
* y con el conjunto (lista) de los individuos que satisfacen la consulta.
~~~
cantidadDeHijos(Padre, Cantidad) :- 
	findall(Hijo, padre(Padre, Hijo), Hijos),
	length(Hijos, Cantidad).
~~~
~~~
?- cantidadDeHijos(homero, Cantidad). 
Cantidad = 3
~~~