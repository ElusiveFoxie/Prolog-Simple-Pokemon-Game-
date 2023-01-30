- dynamic my_pos1,object2,party1,my_party1.

guide - 
	nl,
	write('Commands that you can use'),nl,
	write('start(starter).		--available Starter_pokemons charmander, squirtle, bulbasaur'),nl,
	write('where.			--type to get info about where you are'),nl,
	write('N,S,E,W			--go to direction'),nl,
	write('look.			--look around for pokemons'),nl,
	write('catch(pokemon).		--catch pokemon from town'),nl,
	write('party			--look your party'),nl.

town(pallet_town, 'Pallet Town').
town(viridian_city, 'Viridian City').
town(victory_road, 'Victory Road').
town(viridian_forest, 'Viridian Forest').
town(pewter_city, 'Pewter City').
town(mt_moon, 'Mt Moon').
town(cerulean_city, 'Cerulean City').
town(bill_house, 'Bill House').
town(rock_tunnel, 'Rock Tunnel').
town(lavender_town, 'Lavender Town').
town(saffron_city, 'Saffron City').
town(celadon_city, 'Celadon City').
town(vermillion_city, 'Vermillion City').
town(fuschia_city, 'Fuschia City').
town(seafoam_islands, 'Seafoam Islands').
town(cinnabar_island, 'Cinnabar Island').


path(pallet_town,viridian_city,n).

path(viridian_city,pallet_town,s).
path(viridian_city,victory_road,w).
path(viridian_city,viridian_forest,n).

path(victory_road,viridian_city,e).

path(viridian_forest,viridian_city,s).
path(viridian_forest,pewter_city,n).

path(pewter_city,viridian_forest,s).
path(pewter_city,mt_moon,e).

path(mt_moon,pewter_city,w).
path(mt_moon,cerulean_city,e).

path(cerulean_city,bill_house,n).
path(cerulean_city,rock_tunnel,e).
path(cerulean_city,saffron_city,s).

path(bill_house,cerulean_city,s).

path(rock_tunnel,cerulean_city,w).
path(rock_tunnel,lavender_town,s).

path(saffron_city,cerulean_city_city,n).
path(saffron_city,vermillion_city,s).
path(saffron_city,celadon_city,e).
path(saffron_city,lavender_town,w).

path(celadon_city,saffron_city,w).
path(celadon_city,fuschia_city,e).

path(lavender_town,rock_tunnel,n).
path(lavender_town,saffron_city,e).
path(lavender_town,fuschia_city,s).

path(vermillion_city,saffron_city,n).
path(vermillion_city,lavender_town,e).

path(fuschia_city,celadon_city,e).
path(fuschia_city,lavender_town,w).
path(fuschia_city,seafoam_islands,s).

path(seafoam_islands,fuschia_city,w).
path(seafoam_islands,cinnabar_island,e).

path(cinnabar_island,pallet_town,n).
path(cinnabar_island,seafoam_islands,e).



pokemon(charmander,'Charmander').
pokemon(squirtle,'Squirtle').
pokemon(bulbasaur,'Bulbasaur').
pokemon(pikachu,'Pikachu').
pokemon(eevee,'Eevee').
pokemon(lapras,'Lapras').
pokemon(articuno,'Articuno').
pokemon(ghastly,'Ghastly').
pokemon(abra,'Abra').
pokemon(snorlax,'Snorlax').

my_party([]).


go(X) - my_pos(Z), path(Z,Y,X), retractall(my_pos(Z)), assert(my_pos(Y)).
n - go(n).
s - go(s).
e - go(e).
w - go(w).
up - go(up).
down - go(down).

% The rules how you can travel
start(Starter) - write('Type help_me to get information about avaible commands.'),nl,nl,
	%write('Hello my name is proffesor Oak, and what is your name '),nl,
	%read(Name),write('Right so your name is '),write(Name),nl,
	%write('This is my grandson. He has been your rival since you both were babies. Erm, what was his name now  '),
	%read(Rivalname),write('That is right! I rememer now ! His name is '),write(Rivalname),nl,
	%write('Your very own POKEMON legend is about to unfold!'),nl,
	write('A world of dreams and advantures with POKEMON awaits! Lets go!'),nl,
	write('GOTTA CATCHEM ALL!'),nl,
	write('Do not forget to catch a starter pokemon before leaving Pallet Town !'),nl,
	retractall(my_pos(_)),
	retractall(objects(_)),
	assert(my_pos(pallet_town)),
	assert(object(viridian_forest,pikachu)),
	assert(object(bill_house,eevee)),
	assert(object(saffron_city,lapras)),
	assert(object(seafoam_islands,articuno)),
	assert(object(lavender_town,ghastly)),
	assert(object(fuschia_city,snorlax)),
	assert(object(cerulean_city,abra)),
	assert(party(Starter)),
	add(Starter).

add(X) - my_party(Pokemons),
	append([X], Pokemons, NewPokemons),
	retractall(my_party(_)),
	assert(my_party(NewPokemons)).


remove(X) - my_party(Pokemons),
	delete(Pokemons, X, NewPokemons),
	retractall(my_party(_)),
	assert(my_party(NewPokemons)).

printItems([Head  Tail]) - write(Head), nl, printItems(Tail).

where - write('I am in '), my_pos(Pos), town(Pos,Fpos), write(Fpos),nl,
	write('I can go ')
	,path(Pos,Towns,Direction),town(Towns,Froom),write(Froom),write(' in direction '), write(Direction),nl,fail.

look - my_pos(Pos), object(Pos,Pokemon), pokemon(Pokemon,Pokemonname),
	write('In this town, there is this pokemon to catch '),write(Pokemonname),nl,fail.

catch(Pokemon) - my_pos(Pos), retract(object(Pos,Pokemon)), pokemon(Pokemon,Pokemonname), assert(party(Pokemon)),
	write('You just caught '), write(Pokemonname), add(Pokemon).

release(Pokemon) - write('Pokemon '),write(Pokemon), write(' released ('), remove(Pokemon).

party - write('Your Pokemons '),nl,my_party(X),printItems(X).

are_you_winning_son - party(pikachu),party(abra),
write('Congratulations, YOU CAUGHT THEM ALL !').

are_you_winning_son - write('There are still pokemons you can catch !').







