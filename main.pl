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
	write('O seu personagem tem cabelo ruivo? (s/n).'),
	read(AnswerHair),
	compare_hair(AnswerHair, 'ruivo', AuxList),
  	length(AuxList, List_length), List_length == 1,
  	[Head | Tail] = AuxList,
	write('Hmm... Eu acho que... '), write(Head);
	has_child.

has_child :-
	write('O seu personagem tem filhos(as)? (s/n).'),
	read(AnswerChild),
	compare_boolean(AnswerChild,'s', Asw_child),
    asserta(information(child, Asw_child)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(hair, Asw_hair),
    findall(X, character(X, Asw_gender, _, _, Asw_bastard, Asw_hair, _, _, _, _, Asw_child, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, Asw_bastard, Asw_hair, _, _, _, _, Asw_child, _),
	write('Hmm... Eu acho que... '), write(Guess);
    been_to_theWall.

been_to_theWall :-
    write('O seu personagem já esteve na Muralha? (s/n).'),
	read(AnswerWall),
	compare_boolean(AnswerWall,'s', Asw_wall),
    asserta(information(wall, Asw_wall)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(hair, Asw_hair),
    information(child, Asw_child),
    findall(X, character(X, Asw_gender, _, _, Asw_bastard, Asw_hair, _, _, _, _, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, Asw_bastard, Asw_hair, _, _, _, _, Asw_child, Asw_wall),
    has_white_skin.

has_white_skin :-
    write('O seu personagem tem pele branca? (s/n).'),
	read(AnswerSkin),
	compare_skin(AnswerSkin,'s', _),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(hair, Asw_hair),
    information(child, Asw_child),
    information(wall, Asw_wall),
    information(skin, Asw_skin),
    findall(X, character(X, Asw_gender, _, _, Asw_bastard, Asw_hair, _, _, Asw_skin, _, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, Asw_bastard, Asw_hair, _, _, Asw_skin, _, Asw_child, Asw_wall),
	write('Hmm... Eu acho que... '), write(Guess);
    findall(Z, character(Z, Asw_gender, _, _, Asw_bastard, Asw_hair, _, _, Asw_skin, _, Asw_child, Asw_wall), Character_list_dois),
    [Head | Tail] = Character_list_dois,
    write('Hmm... Fiquei em dúvida... Mas acho que é '), write(Head), nl, write(Tail).
