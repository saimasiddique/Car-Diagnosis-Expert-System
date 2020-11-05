start:-
     write('This program diagnoses why a car won''t start.'),nl,
   write('Answer all questions with Y for yes or N for no.'),nl,
defect(Defect),

write('The car may have '),
write(Defect),
nl,
write('Need further diagnosis '),
undo.

/*Defects that should be tested*/
defect(drained_battery) :- battery, !.
defect(wrong_gear) :- gear, !.
defect(starting_system) :- starter, !.
defect(ignition_system) :-ignition_coil , !.
defect(fuel_problem) :- fuel, !.
defect(spark_plug) :- plug, !.
defect(discolor):-color,!.
defect(unknown). /* no diagnosis*/

/*defects Identification Rules*/

battery :-
verify(slow_starting),
verify(dim_light),
verify(bad_smell),
verify(old_battery),
    nl,
   write('Your attempts to start the car have run down the battery.'),nl,
   write('Recharging or jump-starting will be necessary.'),nl.



gear :-
verify(shaking_sensation),
verify(not_responding),
verify(bad_smell),
verify(dim_light),
 nl,
   write('Check that the gearshift is set to Park or Neutral.'),nl,
   write('Try jiggling the gearshift lever.'),nl.


starter :-
verify(sounds_off),
verify(light_on),
verify(smoke),
verify(oil_soaked),
nl,
   write('Check for a defective battery, voltage'),nl,
   write('regulator, or alternator; if any of these is'),nl,
   write('the problem, charging the battery or jump-'),nl,
   write('starting may get the car going temporarily.'),nl,
   write('Or the starter itself may be defective.'),nl.


ignition_coil :-
verify(fails_to_start),
verify(key_unturn),
verify(dim-light),
verify(no_noise),
     nl,
   write('Check the spark plugs, cables, distributor,'),nl,
   write('coil, and other parts of the ignition system.'),nl,
   write('If any of these are visibly defective or long'),nl,
   write('overdue for replacement, replace them; if this'),nl,
   write('does not solve the problem, consult a mechanic.'),nl.

fuel :-
verify(noisy),
verify(starting_difficulty),
verify(low_gas_mileage),
verify(sputtering_engine),
      nl,
   write('Check whether there is fuel in the tank.'),nl,
   write('If so, check for a clogged fuel line or filter'),nl,
   write('or a defective fuel pump.'),nl.

plug :-
verify(slow_accelaration),
verify(starting_difficulty),
verify(poor_fuel),
verify(misfire_engine),
      nl,
   write('Check the spark plugs, cables, distributor,'),nl,
   write('remove the valve cover ,clean it and install it again'),nl,
   write('Reinstall the valve cover gasket over the engine'),nl,
   write('install the new spark plug seals'),nl,
   write('does not solve the problem, consult a mechanic.'),nl.




color :-
verify(fade),
verify(scratch),
verify(discoloration),
     nl,
   write('Clean the car'),nl,
   write('Tape surfaces'),nl,
   write('Color the car as you like'),nl.



/* how to ask questions */
ask(Question) :-
write('Does the car have following symptom:'),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).

:- dynamic yes/1,no/1.
/*How to verify something */
verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.




















