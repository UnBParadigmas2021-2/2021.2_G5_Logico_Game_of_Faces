:- style_check(-singleton).
:- dynamic is_Male/0.
:- dynamic is_bastard/0.
:- dynamic has_black_hair/0.
:- dynamic has_child/0.
:- dynamic information/2.
:- dynamic character/49.

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
	is_Male.


% TODO: Se o cabelo já é preto, por exemplo, não vai perguntar se é ruivo, e já adicionar o information das outras cores como FALSE
% Obs.: pras perguntas que (se é um não é outro (ex.: cor do cabelo)), tem um compare específico pra cada (ex.: compare_black_hair),
% pq aí asserta os outros como FALSE ja

is_Male :-
	write('O seu personagem é Homem? (s/n).'),
	read(AnswerMale),
	compare_Male(AnswerMale, Asw_gender, Not_match),
	asserta(information(gender, Asw_gender)),
	findall(X, character(X, Not_match, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
	remove_non_match_characters(Character_list),
	check_empty_characters,
	is_bastard.

is_bastard :-
	write('O seu personagem é bastardo? (s/n).'),
	read(AnswerBastard),
	compare_boolean(AnswerBastard, Asw_bastard, Not_match),
	asserta(information(bastard, Asw_bastard)),
	information(gender, Asw_gender),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Not_match, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
	remove_non_match_characters(Character_list),
	check_empty_characters,
	has_black_hair.

has_black_hair :-
	write('O seu personagem tem cabelo preto? (s/n).'),
	read(AnswerHair),
	compare_boolean(AnswerHair, Asw_black_hair, Not_match),
	asserta(information(blackHair, Asw_black_hair)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list),
	findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Not_match, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _), Character_list_two),
	remove_non_match_characters(Character_list_two),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	has_child.

has_child :-
	write('O seu personagem tem filhos(as)? (s/n).'),
	read(AnswerChild),
	compare_boolean(AnswerChild, Asw_child, Not_match),
  asserta(information(child, Asw_child)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, _), Character_list),
  findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Not_match, _), Character_list_two),
	remove_non_match_characters(Character_list_two),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
  been_to_theWall.

been_to_theWall :-
  write('O seu personagem já esteve na Muralha? (s/n).'),
	read(AnswerWall),
	compare_boolean(AnswerWall, Asw_wall, Not_match),
  asserta(information(wall, Asw_wall)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall), Character_list),
  findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Not_match), Character_list_two),
	remove_non_match_characters(Character_list_two),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
  is_dead.

is_dead :-
  write('O seu personagem está morto? (s/n).'),
	read(AnswerDead),
	compare_boolean(AnswerDead, Asw_dead, Not_match),
  asserta(information(dead, Asw_dead)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall), Character_list),
  findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Not_match, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
  is_adult.

is_adult :-
	write('O seu personagem é adulto? (s/n).'),
	read(AnswerAdult),
	compare_boolean(AnswerAdult, Asw_age_adult, Not_match),
  asserta(information(ageAdult, Asw_age_adult)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
  findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
  findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, Not_match, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
  checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	live_in_north.

live_in_north :-
	write('O seu personagem mora no Norte? (s/n).'),
	read(AnswerNorth),
	compare_boolean(AnswerNorth, Asw_north, Not_match),
	asserta(information(north, Asw_north)),
	information(gender, Asw_gender),
	information(bastard, Asw_bastard),
  information(blackHair, Asw_black_hair),
  information(child, Asw_child),
	information(wall, Asw_wall),
	information(dead, Asw_dead),
	information(ageAdult, Asw_age_adult),
	findall(X, character(X, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list),
	findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Not_match, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, _, _, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	old_gods_of_the_forest.

old_gods_of_the_forest :-
	write('O seu personagem venera os Deuses Antigos da Floresta? (s/n).'),
	read(AnswerOldGodsForest),
	compare_boolean(AnswerOldGodsForest, Asw_old_gods_forest, Not_match),
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
	findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Not_match, _, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	faith_of_the_sevens.

faith_of_the_sevens :-
	write('O seu personagem venera a Fé dos Setes? (s/n).'),
	read(AnswerFaithOfSevens),
	compare_boolean(AnswerFaithOfSevens, Asw_faith_of_sevens, Not_match),
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
	findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Not_match, _, _, _, _, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	drowned_god.

drowned_god :-
	write('O seu personagem venera o Deus Afogado? (s/n).'),
	read(AnswerDrownedGod),
	compare_boolean(AnswerDrownedGod, Asw_drowned_god, Not_match),
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
	findall(Z, character(Z, Asw_gender, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Not_match, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	stark_house.

stark_house :-
	write('O seu personagem é fiel a Casa Stark? (s/n).'),
	read(AnswerStarkHouse),
	compare_boolean(AnswerStarkHouse, Asw_stark_house, Not_match),
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
	findall(Z, character(Z, Asw_gender, Not_match, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	lannister_house.

lannister_house :-
	write('O seu personagem é fiel a Casa Lannister? (s/n).'),
	read(AnswerLannisterHouse),
	compare_boolean(AnswerLannisterHouse, Asw_lannister_house, Not_match),
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
	findall(Z, character(Z, Asw_gender, Asw_stark_house, _, Not_match, _, _, _, _, _, _, _, _, _, _, _, _, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	brotherhood_without_flags.

brotherhood_without_flags :-
	write('O seu personagem é fiel a Irmandade sem bandeiras? (s/n).'),
	read(AnswerBrotherhood),
	compare_boolean(AnswerBrotherhood, Asw_brotherhood, Not_match),
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
	findall(Z, character(Z, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, Not_match, _, _, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	free_people.

free_people :-
	write('O seu personagem é fiel ao Povo Livre? (s/n).'),
	read(AnswerFreePeople),
	compare_boolean(AnswerFreePeople, Asw_freePeople, Not_match),
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
	findall(Z, character(Z, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, Asw_brotherhood, _, Not_match, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, _, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	remove_non_match_characters(Character_list_two),
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	check_empty_characters,
	has_white_skin.


has_white_skin :-
  write('O seu personagem tem pele branca? (s/n).'),
	read(AnswerSkin),
	compare_boolean(AnswerSkin,'s', Asw_white_skin, Not_match),
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
	findall(Z, character(Z, Asw_gender, Asw_stark_house, _, Asw_lannister_house, _, _, _, _, _, _, _, _, _, _, _, Asw_brotherhood, _, Asw_freePeople, Asw_north, _, _, _, _, _, _, _, Asw_bastard, Asw_black_hair, _, _, _, _, Asw_dead, _, Asw_old_gods_forest, Asw_faith_of_sevens, _, _, _, Asw_drowned_god, Asw_white_skin, _, _, Asw_age_adult, _, _, Asw_child, Asw_wall), Character_list_two),
	[Head | Tail] = Character_list_two,
	checks_if_has_only_one_element_and_returns_it(Character_list, Head),
	print_character(Head);
	write('Uhm... Fiquei em dúvida... Mas acho que é '), write(Head), nl.

