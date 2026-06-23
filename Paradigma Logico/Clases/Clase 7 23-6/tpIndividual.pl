/*

ENUNCIADO:
Armar un programa Prolog que resuelva el siguiente problema lógico:
- Quien mata es porque odia a su víctima y no es más rico que ella. Además, quien mata debe vivir en la mansión Dreadbury.
- Tía Agatha, el mayordomo y Charles son las únicas personas que viven en la mansión Dreadbury.
- Charles odia a todas las personas de la mansión que no son odiadas por la tía Agatha.
- Agatha odia a todos los que viven en la mansión, excepto al mayordomo.
- Quien no es odiado por el mayordomo y vive en la mansión, es más rico que tía Agatha
- El mayordomo odia a las mismas personas que odia tía Agatha.

*/

% 1a. El programa debe resolver el problema de quién mató a la tía Agatha. 
% 1b. Mostrar la consulta utilizada y la respuesta obtenida.


% MODELADO
persona(agatha).
persona(mayordomo).
persona(charles).
persona(milhouse).

% HECHOS
odia(agatha, agatha).
odia(agatha, charles).
odia(charles, mayordomo).
odia(mayordomo, agatha).
odia(mayordomo, charles).

viveEnLaMansion(Persona) :- persona(Persona).

esMasRicoQue(Persona, agatha) :- 
    viveEnLaMansion(Persona),
    Persona \= agatha,
    not(odia(mayordomo, Persona)).

mata(Asesino, Victima) :-
    viveEnLaMansion(Asesino),
    viveEnLaMansion(Victima),
    odia(Asesino, Victima),
    not(esMasRicoQue(Asesino, Victima)).

% 2
:- begin_tests(persona).

test(nadie_odia_a_milhouse, fail) :-
    odia(_, milhouse).

test(personas_odiadas_por_charles, set(Quien == [mayordomo])) :-
    odia(charles, Quien).

test(personas_que_odian_a_agatha, set(Quien == [agatha, mayordomo])) :-
    odia(Quien, agatha).

test(mapa_completo_de_odio, set(Odiador-Odiado == [agatha-agatha, agatha-charles, mayordomo-agatha, mayordomo-charles, charles-mayordomo])) :-
    odia(Odiador, Odiado).

test(el_mayordomo_odia_a_alguien, nondet) :-
    odia(mayordomo, _).

:- end_tests(persona).
