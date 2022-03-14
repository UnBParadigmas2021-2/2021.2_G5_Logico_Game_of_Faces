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
	nl, write('Bem-vindo ao Game of faces'), nl,  write('Pense em algum personagem de Game of Thrones e tentarei advinhar'), nl,nl,
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
	has_black_hair.

has_black_hair :-
	write('O seu personagem tem cabelo preto? (s/n).'),
	read(AnswerHair),
	compare_black_hair(AnswerHair,'s', Asw_black_hair),
	asserta(information(blackHair, Asw_black_hair)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	has_child.

has_child :-
	write('O seu personagem tem filhos(as)? (s/n).'),
	read(AnswerChild),
	compare_boolean(AnswerChild,'s', Asw_child),
  asserta(information(child, Asw_child)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, _), Character_list),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
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
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall), Character_list),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
  is_dead.

is_dead :-
  write('O seu personagem está morto? (s/n).'),
	read(AnswerDead),
	compare_boolean(AnswerDead,'s', Asw_dead),
  asserta(information(dead, Asw_dead)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall), Character_list),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
  is_adult.

is_adult :-
	write('O seu personagem é adulto? (s/n).'),
	read(AnswerAdult),
	compare_age_adult(AnswerAdult,'s', Asw_age_adult),
  asserta(information(ageAdult, Asw_age_adult)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	live_in_north.

live_in_north :-
	write('O seu personagem mora no Norte? (s/n).'),
	read(AnswerNorth),
	compare_boolean(AnswerNorth, 's', Asw_north),
	asserta(information(north, Asw_north)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	old_gods_of_the_forest.

old_gods_of_the_forest :-
	write('O seu personagem venera os Deuses Antigos da Floresta? (s/n).'),
	read(AnswerOldGodsForest),
	compare_boolean(AnswerOldGodsForest, 's', Asw_old_gods_forest),
	asserta(information(oldGodsForest, Asw_old_gods_forest)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, _, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	faith_of_the_sevens.

faith_of_the_sevens :-
	write('O seu personagem venera a Fé dos Setes? (s/n).'),
	read(AnswerFaithOfSevens),
	compare_boolean(AnswerFaithOfSevens, 's', Asw_faith_of_sevens),
	asserta(information(faithOfSevens, Asw_faith_of_sevens)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	information(oldGodsForest, Asw_old_gods_forest),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	drowned_god.

drowned_god :-
	write('O seu personagem venera o Deus Afogado? (s/n).'),
	read(AnswerDrownedGod),
	compare_boolean(AnswerDrownedGod, 's', Asw_drowned_god),
	asserta(information(drownedGod, Asw_drowned_god)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	information(oldGodsForest, Asw_old_gods_forest),
	information(faithOfSevens, Asw_faith_of_sevens),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	stark_house.

stark_house :-
	write('O seu personagem é fiel a Casa Stark? (s/n).'),
	read(AnswerStarkHouse),
	compare_boolean(AnswerStarkHouse, 's', Asw_stark_house),
	asserta(information(starkHouse, Asw_stark_house)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	information(oldGodsForest, Asw_old_gods_forest),
	information(faithOfSevens, Asw_faith_of_sevens),
	information(drownedGod, Asw_drowned_god),
	findall(X, character(X, Asw_gender, Asw_stark_house, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	lannister_house.

lannister_house :-
	write('O seu personagem é fiel a Casa Lannister? (s/n).'),
	read(AnswerLannisterHouse),
	compare_boolean(AnswerLannisterHouse, 's', Asw_lannister_house),
	asserta(information(lannisterHouse, Asw_lannister_house)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	information(oldGodsForest, Asw_old_gods_forest),
	information(faithOfSevens, Asw_faith_of_sevens),
	information(drownedGod, Asw_drowned_god),
	information(starkHouse, Asw_stark_house),
	findall(X, character(X, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	brotherhood_without_flags.

brotherhood_without_flags :-
	write('O seu personagem é fiel a Irmandade sem bandeiras? (s/n).'),
	read(AnswerBrotherhood),
	compare_boolean(AnswerBrotherhood, 's', Asw_brotherhood),
	asserta(information(brotherhood, Asw_brotherhood)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	information(oldGodsForest, Asw_old_gods_forest),
	information(faithOfSevens, Asw_faith_of_sevens),
	information(drownedGod, Asw_drowned_god),
	information(starkHouse, Asw_stark_house),
	information(lannisterHouse, Asw_lannister_house),
	findall(X, character(X, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, Asw_brotherhood, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	free_people.

free_people :-
	write('O seu personagem é fiel ao Povo Livre? (s/n).'),
	read(AnswerFreePeople),
	compare_boolean(AnswerFreePeople, 's', Asw_freePeople),
	asserta(information(freePeople, Asw_freePeople)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	information(oldGodsForest, Asw_old_gods_forest),
	information(faithOfSevens, Asw_faith_of_sevens),
	information(drownedGod, Asw_drowned_god),
	information(starkHouse, Asw_stark_house),
	information(lannisterHouse, Asw_lannister_house),
	information(brotherhood, Asw_brotherhood),
	findall(X, character(X, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, Asw_brotherhood, _, Asw_freePeople, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	has_white_skin.


has_white_skin :-
  write('O seu personagem tem pele branca? (s/n).'),
	read(AnswerSkin),
	compare_boolean(AnswerSkin,'s', Asw_white_skin),
	asserta(information(whiteSkin, Asw_white_skin)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
  information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	information(north, Asw_north),
	information(oldGodsForest, Asw_old_gods_forest),
	information(faithOfSevens, Asw_faith_of_sevens),
	information(drownedGod, Asw_drowned_god),
	information(starkHouse, Asw_stark_house),
	information(lannisterHouse, Asw_lannister_house),
	information(brotherhood, Asw_brotherhood),
	findall(X, character(X, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, Asw_brotherhood, _, Asw_freePeople, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, Asw_white_skin, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	findall(Z, character(Z, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, Asw_brotherhood, _, Asw_freePeople, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, Asw_white_skin, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	[Head | Tail] = Character_list_two,
	write('Uhm... Fiquei em dúvida... Mas acho que é '), write(Head), nl, write(Tail).

