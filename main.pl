:- style_check(-singleton).
:- dynamic question_Male/0.
:- dynamic compare_Male/0.
:- dynamic compare_bastard/0.
:- dynamic information/2.

%symbolic fact
information(A, B).

% Main cast
% Name, gender, house, region, bastard, hair_color, dead, religion, skin_color, age, has_child, been_to_theWall

character('Jon Snow', 'M', 'stark', 'north', 'yes', 'black', 'no', 'oldgods', 'white', 'adult', 'no', 'yes').
character('Aria Start', 'F', 'stark', 'north', 'no', 'black', 'no', 'oldgods', 'white', 'teenager', 'no', 'no').
character('Tyrion Lannister','M','lannister', 'east','no','blond','no','theSeven','white','adult','no','yes').

compare_Male(A,B,C) :-
	( A == B
	  -> C = 'M'
	  ;  C = 'F'
    ).

compare_bastard(A,B,C) :-
	( A == B
	  -> C = 'yes'
	  ;  C = 'no'
    ).

main :-	
	nl, write('Bem-vindo ao Game of faces'), nl,nl,
	is_Male.

is_Male :-
	write('O seu personagem é Homem? (y/n).'),
	read(AnswerMale),
	compare_Male(AnswerMale,'y',C),
	asserta(information(gender,C)),
	findall(X, character(X, C, _, _, _, _, _, _, _, _, _, _), L),
  	length(L, N), N == 1,
  	character(Z,C, _, _, _, _, _, _, _, _, _, _),
	write('Hmm... Eu acho que... '), write(Z);
	is_bastard.

is_bastard :-
	write('O seu personagem é bastardo? (y/n).'),
	read(AnswerBastard),
	compare_bastard(AnswerBastard,'y',D),
	information(gender, G),
	character(Z,G, _, _, D, _, _, _, _, _, _, _),
	write('Hmm... Eu acho que... '), write(Z).