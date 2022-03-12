:- style_check(-singleton).
:- dynamic compare_Male/0.
:- dynamic compare_boolean/0.
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


popula_information :-
    asserta(information(gender, 'undefined')),
    asserta(information(bastard, 'undefined')),
    asserta(information(hair, 'undefined')),
    asserta(information(child, 'undefined')),
    asserta(information(wall, 'undefined')),
    asserta(information(skin, 'undefined')).