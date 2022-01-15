:- include('facts.pl').

present_in(X, kitchen):- finger_print(X, glass).

present_in(X, clubhouse):- present_in(X, kitchen).

present_in(X, study):- present_in(X, hall).

present_in(X, dining):-
			present_in(X, lounge),
			present_in(X, clubhouse).

present_in(X, dining):-
			not(present_in(X, kitchen)).

hair(X, long):- blood_group(X,o).

hair(X, bald):-
			\+ blood_group(X,o),
			finger_print(X, poison),
			finger_print(X, gun).

blood_group(X, a):-
			not(hair(X, long)),
			present_in(X, study),
			present_in(X, hall).

finger_print(scarlet, glass):-
			finger_print(green, glass).

-finger_print(X, poison):-
			not(present_in(X, kitchen)),
			not(present_in(X,study)).


finger_print(X, knife):-
			finger_print(X, gun),
			present_in(X,clubhouse).

finger_print(X, statue):-
			\+ present_in(X, study),
			\+ present_in(X, hall),
			\+ present_in(X,kitchen).



% Match the crime scene evidences against the suspects.
% The murderer should have visited clubhouse(the murder spot).
% The murderer's fingerprint should match with that of the knife(the murder weapon).
% We speculate the hair strand found on the victim's body should match the murderer.

convict_by_evidence(X):-
			write('\n\n \t\t HUNTING THE KILLER - FROM EVIDENCES'),
			suspects(Z), nl,
			write('\n\n The initial suspects present in the crime scene are :  '),write(Z),nl,
			write('\n\n The murder culprit should be : '),
			hair(X, long),
			finger_print(X, knife), present_in(X, clubhouse).

% Further investigation

% A brief of every suspect is recorded to the system and evaluate for consistency.

% Mustard - As it was freezing cold and the room heater in clubhouse was not working I was feeling sick and stayed in hall. But Green and Scarlet were talking with Black(the victim). Peacock gave me soup.
% Green - Scarlet and myself were watching NFL with Black. I had to tsep out to take imp call, later I went directly to dining and joined Plum, Orchid.
% scarlet - I dint like the game, Arizona was losing. I went to meet mustard in Hall.
% peacock - I was cooking in kitchen. I left the turkey in oven and offered soup to Mustard in Hall.
% Orchid - I was discussing with Plum and Green about christmas in dining.
% Plum - I had headache. I was just resting at dining with Green and Orchid.


% Cross-check the testimony of each suspect and check if they are consistent.
% If suspect1 claims to be in different location with suspect2.
% Check if testimony of suspect2 has the presence of suspect1 mentioned.

consistency_check(X):-
			was_with(X, As),
			was_with(Y, Bs),
			member(Y, As),
			member(X, Bs).


% Check each suspect if their testimony is consistent.
% If yes, consider them as innocents. Remove them from suspects list.

remove_innocents(X) :-

		  findall(Z, consistency_check(Z), List), nl,
		  write('\n\n During investigation,\n \n The suspect\'s testimony were tested for consistency.\n\n'),
		  write('And concluded the innocents are : '),
		  sort(List, X3), write(X3),
		  suspects(List2), nl,
		  remove_list(X3, List2, X2), nl,
		  write('\n\n The murderer should be :  '),
		  write(X2), nl,nl,write('\n').



% To remove the given element(X) from the list.
% Return updated list, with X being removed.
del(Y, [Y], []).
del(X, [X|LIST1], LIST1).
del(X, [Y|LIST], [Y|LIST1]):-del(X,LIST,LIST1).


% To remove a list of elements(list1) from another list (list2)
% Return updated list (list3).

remove_list([H|T], List2, List3) :-
       del(H, List2, TempList),
       remove_list(T, TempList, List3).

remove_list([], List, List).



convict_by_testimony:-
		write('\n\n \t\t HUNTING THE KILLER - FROM FURTHER INVESTIGATION'),
		suspects(X), nl,
		write('\n\n The initial suspects present in the crime scene are :  '),write(X),
		remove_innocents(X).


% Queries
% IDENTIFYING CONVICT
% convict_by_evidence(X).
% convict_by_testimony.
%
% INFERENCES
% hair(mustard, X).
% hair(green, X).
% blood_group(orchid, X).
