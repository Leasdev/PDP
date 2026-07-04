# Paradigma Logico

## Introduccion
> Lenguaje a usar: Prolog
> Lenguaje interpretado
> swipl (nombre del programa)
## Base de Conocimientos
~~~
juega(naza, lol).
juega(facu, aoe).
juega(cande, aoe).
juega(cande, lol).
juega(diana, lol).
~~~
> juega/2 es un predicado. Es una relación entre 2 individuos. Está compuesto por 5 cláusulas, que son hechos.
~~~
laRompe(cande).
~~~
> laRompe/1 es un predicado. Es una propiedad. Está compuesta por 1 cláusula que es un hecho.
> naza, facu, cande, diana, cande, aoe, y lol son átomos, que a su vez son individuos.
~~~
compartenJuego(Pers1, Pers2):-
       juega(Pers1, Juego),
       juega(Pers2, Juego).
~~~
> Pers1, Pers2 y Juego son variables.
~~~
% Consultas:
?- juega(naza,lol).
true.
?- juega(cande, _).
true.
?- juega(cande, Juego).
Juego = aoe;
Juego = lol.
~~~
> Inversibilidad: Es la principal diferencia entre el paradigma lógico y el resto: Aquí no sólo puedo hacer consultas “enviando” mis datos (mis individuos) sino que además puedo preguntar muchas otras cosas, empezando con “existe un X que cumpla....”.
> Tips de Prolog:

> Las reglas son:
* consecuente :- antecedente .
* % Esto es un comentario de una línea
* /*Esto es un comentario de varias líneas*/
* ¡No olvidar el punto al final! .
* Las Variables Comienzan Con Mayúscula
* los predicados e individuos con minúscula