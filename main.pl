:- style_check(-singleton).
:- dynamic is_Male/0.
:- dynamic is_bastard/0.
:- dynamic has_black_hair/0.
:- dynamic has_child/0.
:- dynamic information/2.

%symbolic fact
information(A, B).

main :-	
	nl, write('Bem-vindo ao Game of faces'), nl,nl,
	popula,
    popula_information,

	is_Male.

% TODO: Se o cabelo já é preto, por exemplo, não vai perguntar se é ruivo, e já adicionar o information das outras cores como FALSE

is_Male :-
	write('O seu personagem é Homem? (s/n).'),
	read(AnswerMale),
	compare_Male(AnswerMale,'s', Asw_gender),
	asserta(information(gender, Asw_gender)),
	is_bastard.

is_bastard :-
	write('O seu personagem é bastardo? (s/n).'),
	read(AnswerBastard),
	compare_boolean(AnswerBastard,'s', Asw_bastard),
	asserta(information(bastard, Asw_bastard)),
	information(gender, Asw_gender),
	findall(X, character(X, Asw_gender, _, _, Asw_bastard, _, _, _, _, _, _, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess , Asw_gender, _, _, Asw_bastard, _, _, _, _, _, _, _),
	write('Hmm... Eu acho que... '), write(Guess);
	has_black_hair.

has_black_hair :-
	write('O seu personagem tem cabelo preto? (s/n).'),
	read(AnswerHair),
	compare_boolean(AnswerHair,'s', Asw_black_hair),
	asserta(information(blackHair, Asw_black_hair)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
	findall(X, character(X, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess , Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _),
	write('Hmm... Eu acho que... '), write(Guess);
	has_child.

has_child :-
	write('O seu personagem tem filhos(as)? (s/n).'),
	read(AnswerChild),
	compare_boolean(AnswerChild,'s', Asw_child),
    asserta(information(child, Asw_child)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(blackHair, Asw_black_hair),
    findall(X, character(X, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_child, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_child, _),
	write('Hmm... Eu acho que... '), write(Guess);
    been_to_theWall.

been_to_theWall :-
    write('O seu personagem já esteve na Muralha? (s/n).'),
	read(AnswerWall),
	compare_boolean(AnswerWall,'s', Asw_wall),
    asserta(information(wall, Asw_wall)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(blackHair, Asw_black_hair),
    information(child, Asw_child),
    findall(X, character(X, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_child, Asw_wall),
	write('Hmm... Eu acho que... '), write(Guess);
    has_white_skin.

has_white_skin :-
    write('O seu personagem tem pele branca? (s/n).'),
	read(AnswerSkin),
	compare_boolean(AnswerSkin,'s', Asw_white_skin),
	asserta(information(wall, Asw_wall)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(blackHair, Asw_black_hair),
    information(child, Asw_child),
    information(wall, Asw_wall),
    information(whiteSkin, Asw_white_skin),
    findall(X, character(X, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, Asw_white_skin, _, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, Asw_white_skin, _, Asw_child, Asw_wall),
	write('Hmm... Eu acho que... '), write(Guess);
    findall(Z, character(Z, Asw_gender, _, _, Asw_bastard, Asw_black_hair, _, _, Asw_white_skin, _, Asw_child, Asw_wall), Character_list_dois),
    [Head | Tail] = Character_list_dois,
    write('Hmm... Fiquei em dúvida... Mas acho que é '), write(Head), nl, write(Tail).
