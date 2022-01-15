% Facts - Suspects 
% Individuals present in the crime scene.

suspects([mustard, scarlet, peacock, plum, green, orchid]).

suspect(mustard).
suspect(green).
suspect(scarlet).
suspect(peacock).
suspect(orchid).
suspect(plum).

% Harmful weapon found in the mansion.
% Check every weapon for fingerprints, to narrow down the suspects lists.
weapon(knife).
weapon(gun).
weapon(poison).
weapon(glass).
weapon(statue).

% Places inside the mansion. To confirm the presence of suspects during the crime.
room(kitchen).
room(hall).
room(study).
room(clubhouse).
room(dining).
room(lounge).

% Information on suspects' blood group available at the moment.
blood_group(scarlet, o).
blood_group(green, o).
blood_group(peacock, b).
blood_group(mustard, b).

% Information on suspects' hair available at the moment.
hair(peacock, long).
hair(plum, short).

% Fingerprint information provided by the Forensics on the weapons collected in the Mansion.
finger_print(mustard, poison).
finger_print(mustard, gun).
finger_print(green, glass).
finger_print(scarlet, gun).

% Initial claim by the suspects to defend.
% Their presence in a different place in mansion (not the crime spot).
present_in(green, clubhouse).
present_in(scarlet, kitchen).
present_in(orchid, hall).
present_in(plum, dining).


% During second level of investigation.
% Each suspect, inorder to prove innocent, presented evidences.
% These are other inviduals(suspects), who could confirm the presence of suspect being interrogated.

was_with(green, [orchid, plum]).
was_with(plum, [green]).
was_with(mustard, [peacock]).
was_with(scarlet, [mustard]).
was_with(peacock, [mustard]).
was_with(orchid, [plum, green]).
was_with(plum, [green, orchid]).