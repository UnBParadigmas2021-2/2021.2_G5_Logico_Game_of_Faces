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

compare_black_hair(A,B,C) :-
	( A == B
	    -> C = 'TRUE',
            asserta(information(blondeHair, 'FALSE')),
            asserta(information(redHair, 'FALSE')),
            asserta(information(brownHair, 'FALSE')),
            asserta(information(grayHair, 'FALSE'))
	    ; C = 'FALSE'
    ).

compare_blonde_hair(A,B,C) :-
	( A == B
	    -> C = 'TRUE',
            asserta(information(redHair, 'FALSE')),
            asserta(information(brownHair, 'FALSE')),
            asserta(information(grayHair, 'FALSE'))
	    ; C = 'FALSE'
    ).

compare_age_elder(A,B,C) :-
	( A == B
	    -> C = 'TRUE',
            asserta(information(ageAdult, 'FALSE')),
            asserta(information(ageChild, 'FALSE'))
	    ; C = 'FALSE'
    ).

compare_age_adult(A,B,C) :-
	( A == B
	    -> C = 'TRUE',
            asserta(information(ageChild, 'FALSE'))
	    ; C = 'FALSE',
            asserta(information(ageChild, 'TRUE'))
    ).

popula_information :-
    asserta(information(gender, 'undefined')),
    asserta(information(bastard, 'undefined')),
    asserta(information(hair, 'undefined')),
    asserta(information(child, 'undefined')),
    asserta(information(wall, 'undefined')),
    asserta(information(skin, 'undefined')).