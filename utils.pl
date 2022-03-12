:- style_check(-singleton).
:- dynamic compare_Male/0.
:- dynamic compare_boolean/0.
:- dynamic compare_hair/0.
:- dynamic information/2.

compare_Male(A,B,C) :-
	( A == B
	  -> C = 'M'
	  ;  C = 'F'
    ).

compare_boolean(A,B,C) :-
	( A == B
	  -> C = 'TRUE'
	  ;  C = 'FALSE'
    ).

compare_hair(A,B,C) :-
	( A == B
	  -> asserta(information(hair, 'preto'))
    ).

compare_skin(A,B,C) :-
	( A == B
	  -> asserta(information(skin, 'branca'))
    ).


popula_information :-
    asserta(information(gender, _)),
    asserta(information(bastard, _)),
    asserta(information(hair, _)),
    asserta(information(child, _)),
    asserta(information(wall, _)),
    asserta(information(skin, _)).


auxiliar_findall (A,B,C,D,E,F,Z)