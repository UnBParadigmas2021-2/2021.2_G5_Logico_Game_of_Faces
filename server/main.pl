:- style_check(-singleton).
:- dynamic is_Male/0.
:- dynamic is_bastard/0.
:- dynamic has_black_hair/0.
:- dynamic has_child/0.
:- dynamic information/2.

%symbolic fact
information(A, B).

% Nome(1) Sexo(2) CasaStark(3)  CasaTargaryen(4)  CasaLannister(5) CasaBaratheon(6)  CasaGreyjoy(7)  CasaBolton(8)  CasaTyrell(9)  CasaMartell(10)
% CasaArryn(11)  CasaTully(12)  CasaReed(13)  OrdemdosMeistres(14)  OsSete(15) HomensSemRosto(16)  IrmandadeSemBandeiras(17)  PatrulhadaNoite(18)
% PovoLivre(19) Norte(20) Sul(21) Oeste(22) Leste(23) ExNorte(24) ExSul(25) ExOeste(26) ExLeste(27) Bastardo(28) Preto(29) Loiro(30) Ruivo(31) Castanho(32) Grisalho(33)
% EstaMorto(34) Dothraki(35)  DeusesAntigosdaFloresta(36)  FédosSete(37)  Ghiscari(38)  DeusdeMuitasFaces(39)  Rhllor(40)  DeusAfogado(41)
% Branca(42) Parda(43) Negra(44) Adulto(45) Criança(46) Idoso(47) TemFilhos(48) FoiMuralha(49)

% Modelo para uso (49 campos no TOTAL): character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)

main :-	
	nl, write('Bem-vindo ao Game of faces'), nl,nl,
	popula,
    popula_information,

	is_Male.


% TODO: Se o cabelo já é preto, por exemplo, não vai perguntar se é ruivo, e já adicionar o information das outras cores como FALSE
% Obs.: pras perguntas que (se é um não é outro (ex.: cor do cabelo)), tem um compare específico pra cada (ex.: compare_black_hair),
% pq aí asserta os outros como FALSE ja

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
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess , Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _),
	write('Hmm... Eu acho que... '), write(Guess);
	has_black_hair.

has_black_hair :-
	write('O seu personagem tem cabelo preto? (s/n).'),
	read(AnswerHair),
	compare_black_hair(AnswerHair,'s', Asw_black_hair),
	asserta(information(blackHair, Asw_black_hair)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess , Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _),
	write('Hmm... Eu acho que... '), write(Guess);
	has_child.

has_blonde_hair :-
	write('O seu personagem tem cabelo loiro? (s/n).'),
	read(AnswerHair),
	compare_boolean(AnswerHair,'s', Asw_blonde_hair),
	asserta(information(blondeHair, Asw_blonde_hair)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
	information(blackHair, Asw_black_hair),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _),
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
	information(blondeHair, Asw_blonde_hair),
	information(redHair, Asw_red_hair),
	information(brownHair, Asw_brown_hair),
	information(grayHair, Asw_gray_hair),
    findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, _), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, _),
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
	information(blondeHair, Asw_blonde_hair),
	information(redHair, Asw_red_hair),
	information(brownHair, Asw_brown_hair),
	information(grayHair, Asw_gray_hair),
    information(child, Asw_child),
    findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall),
	write('Hmm... Eu acho que... '), write(Guess);
    is_dead.

is_dead :-
    write('O seu personagem está morto? (s/n).'),
	read(AnswerDead),
	compare_boolean(AnswerDead,'s', Asw_dead),
    asserta(information(dead, Asw_dead)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(blackHair, Asw_black_hair),
	information(blondeHair, Asw_blonde_hair),
	information(redHair, Asw_red_hair),
	information(brownHair, Asw_brown_hair),
	information(grayHair, Asw_gray_hair),
    information(child, Asw_child),
	information(wall, Asw_wall),
    findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall),
	write('Hmm... Eu acho que... '), write(Guess);
    is_elder.

is_elder :-
	write('O seu personagem é idoso? (s/n).'),
	read(AnswerElder),
	compare_age_elder(AnswerElder,'s', Asw_ageElder),
    asserta(information(ageElder, Asw_ageElder)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(blackHair, Asw_black_hair),
	information(blondeHair, Asw_blonde_hair),
	information(redHair, Asw_red_hair),
	information(brownHair, Asw_brown_hair),
	information(grayHair, Asw_gray_hair),
    information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
    findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, _, _, _, _, _, Asw_ageElder, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, _, _, _, _, _, Asw_ageElder, Asw_child, Asw_wall),
	write('Hmm... Eu acho que... '), write(Guess);
	has_white_skin.

is_adult :-
	write('O seu personagem é adulto? (s/n).'),
	read(AnswerAdult),
	compare_age_adult(AnswerAdult,'s', Asw_ageAdult),
    asserta(information(ageAdult, Asw_ageAdult)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
    information(blackHair, Asw_black_hair),
	information(blondeHair, Asw_blonde_hair),
	information(redHair, Asw_red_hair),
	information(brownHair, Asw_brown_hair),
	information(grayHair, Asw_gray_hair),
    information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageElder, Asw_ageElder),
	information(ageChild, Asw_ageChild),
    findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, _, _, _, Asw_ageAdult, Asw_ageChild, Asw_ageElder, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, _, _, _, Asw_ageAdult, Asw_ageChild, Asw_ageElder, Asw_child, Asw_wall),
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
	information(blondeHair, Asw_blonde_hair),
	information(redHair, Asw_red_hair),
	information(brownHair, Asw_brown_hair),
	information(grayHair, Asw_gray_hair),
    information(child, Asw_child),
    information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageElder, Asw_ageElder),
	information(ageAdult, Asw_ageAdult),
	information(ageChild, Asw_ageChild),
    findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, Asw_white_skin, _, _, Asw_ageAdult, Asw_ageChild, Asw_ageElder, Asw_child, Asw_wall), Character_list),
  	length(Character_list, List_length), List_length == 1,
	character(Guess, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, Asw_white_skin, _, _, Asw_ageAdult, Asw_ageChild, Asw_ageElder, Asw_child, Asw_wall),
	write('Hmm... Eu acho que... '), write(Guess);
    findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, Asw_blonde_hair, Asw_red_hair, Asw_brown_hair, Asw_gray_hair, Asw_dead, _, _, _, _, _, _, _, Asw_white_skin, _, _, Asw_ageAdult, Asw_ageChild, Asw_ageElder, Asw_child, Asw_wall), Character_list_dois),
    [Head | Tail] = Character_list_dois,
    write('Hmm... Fiquei em dúvida... Mas acho que é '), write(Head), nl, write(Tail).




