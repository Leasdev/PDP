% Vomistar

departamento(maria, ventas).
departamento(juan, ventas).
departamento(roque, ventas).
departamento(nora, compras).
departamento(pedro, compras).
departamento(felipe, administracion).
departamento(hugo, administracion).
departamento(ana, administracion).

cargo(maria, empleado).
cargo(nora, empleado).
cargo(felipe, empleado).
cargo(hugo, empleado).
cargo(juan, cadete).
cargo(pedro, cadete).
cargo(ana, cadete).
cargo(roque, pasante).

% ¿Quiénes trabajan en el departamento de compras? ¿y en el de ventas?

trabajanEnElMismoDepto(Persona1, Persona2):-
    departamento(Persona1, Departamento),
    departamento(Persona2, Departamento).

% puedeDarleOrdenes(maria,pedro). -> No, que deduzca el programa

puedeDarleOrdenes(Persona1, Persona2):-
    trabajanEnElMismoDepto(Persona1, Persona2),
    cargo(Persona1, CargoA),
    cargo(Persona2, CargoB),
    superior(CargoA, CargoB).

superior(empleado, cadete).
superior(empleado, pasante).

seLlevanBien(Persona1, Persona2):-
    cargo(Persona1,_),
    cargo(Persona2,_),
    Persona1 \= Persona2,
    trabajanEnElMismoDepto(Persona1, Persona2),
    not(puedeDarleOrdenes(Persona1, Persona2)),
    not(puedeDarleOrdenes(Persona2, Persona1)).

:-begin_tests(puedeDarleOrdenes).
    test(tiene_el_mismo_departamento_y_es_puesto_superior):-
        puedeDarleOrdenes(maria, juan).
    test(tiene_el_mismo_departamento_y_no_es_puesto_superior, fail):-
        puedeDarleOrdenes(juan, maria).
    test(no_tiene_el_mismo_departamento_aunque_sea_superior, fail):-
        puedeDarleOrdenes(nora, ana).  
:-end_tests(puedeDarleOrdenes).

:-begin_tests(seLlevanBien).
    test(tiene_el_mismo_departamento_y_no_puede_darle_ordenes_al_otro, set(Persona == [felipe])):-
        seLlevanBien(Persona, hugo). 
    test(tiene_el_mismo_departamento_y_puede_darle_ordenes_al_otro, fail):-
        seLlevanBien(maria, juan).
    test(no_tiene_el_mismo_departamento_aunque_pueda_dar_ordenes, fail):-
        seLlevanBien(maria, ana).
:-end_tests(seLlevanBien).