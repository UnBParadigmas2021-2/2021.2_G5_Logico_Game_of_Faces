:- style_check(-singleton).
:- dynamic compare_Male/0.
:- dynamic compare_boolean/0.
:- dynamic information/2.

compare_Male(A,C,D) :-
	( A == 's'
	  -> C = 'M', D = 'F'
	  ;  C = 'F', D = 'M'
    ).

compare_boolean(A,C,D) :-
	( A == 's'
	  -> C = 'TRUE', D = 'FALSE'
	  ;  C = 'FALSE', D = 'TRUE'
    ).

checks_if_has_only_one_element_and_returns_it(List, Head) :-
    length(List, List_length),
    List_length == 1,
	[Head | Tail] = List.

print_character(Character) :-
    write('Já sei! Tenho certeza que seu personagem é:  '),
    write(Character).

remove_non_match_characters(List) :-
    [Head | Tail] = List,
    retract(character(Head, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)),
    remove_non_match_characters(Tail).

remove_non_match_characters(_).

check_empty_characters :-
    findall(X, character(X, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
    length(Character_list, List_length),
    List_length == 0,
    write('As características informadas não batem com nenhum personagem na nossa base de dados!'), nl,
    halt.

check_empty_characters.
