move(a, b, a).
move(b, c, a).
move(b, e, i).
move(b, g, d).
move(b, i, e).
move(c, d, y).
move(d, z, e).
move(e, f, y).
move(f, z, a).
move(g, h, a).
move(g, z, a).
move(h, l, n).
move(h, z, n).
move(i, j, l).
move(j, k, i).
move(k, z, n).
move(l, m, e).
move(m, n, d).
move(n, o, h).
move(o, p, e).
move(p, z, l).

% Estado final aceptado
accepting_state(z).

go_over_automaton(ListtoCheck) :-
    % Llamar a la función con el primer estado del autómata (A)
    automatonCheck(ListtoCheck, a).

% Caso base: cuando la lista está vacía, comprobar si es un estado aceptado
automatonCheck([], InitialState) :-
    accepting_state(InitialState).

% Si la lista tiene elementos por recorrer
automatonCheck([Symbol | RestofList], InitialState) :-
    % Comprobar si el estado inicial y el símbolo están conectados en la base de conocimiento
    move(InitialState, NextState, Symbol),
    % Si están conectados, llamar de nuevo a la función hasta alcanzar el caso base
    automatonCheck(RestofList, NextState).

% Pruebas con palabras específicas
aaye :-
    write('Aaye'), nl,
    write('Expected: true'), nl,
    go_over_automaton([a, a, y, e]).

aiya :-
    write('Aiya'), nl,
    write('Expected: true'), nl,
    go_over_automaton([a, i, y, a]).

ada :-
    write('Ada'), nl,
    write('Expected: true'), nl,
    go_over_automaton([a, d, a]).

adan :-
    write('Adan'), nl,
    write('Expected: true'), nl,
    go_over_automaton([a, d, a, n]).

aelin :-
    write('Aelin'), nl,
    write('Expected: true'), nl,
    go_over_automaton([a, e, l, i, n]).

adanedhel :-
    write('Adanedhel'), nl,
    write('Expected: true'), nl,
    go_over_automaton([a, d, a, n, e, d, h, e, l]).

hello :-
    write('Adanedhel'), nl,
    write('Expected: false'), nl,
    go_over_automaton([h, e, l, l, o]).