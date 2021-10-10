% Your program goes here
% s(CASP) Programming
:- use_module(library(scasp)).

% Your program goes here

%%%need to add 
%%% + for input vars
%%% - for output vars
%%% # for constant

modeb(penguin/1).
modeb(bird/1).
modeb(has_feathers/1).
modeb(has_beak/1).
modeb(has_car/2).

test_status(X,pass) :- format("Pass or fail ~w ?\n",[X]), read(yes),!.
test_status(X,fail) :- format("Pass or fail ~w ?\n",[X]), read(no).

%%%mayb include the numbering of vars in this generation.
%%% Insure vars form dag of unification.
hypothesis_body([X/Arity]):-modeb(X/Arity).
hypothesis_body([not(X/Arity)]):-modeb(X/Arity).
hypothesis_body([X/Arity|Xs]):- maplist(dif(X/Arity),Xs),modeb(X/Arity), hypothesis_body(Xs). %mayb retract and replace this clause with specialisations.
%%%hypothesis_body([X/Arity|Xs]):- modeb(X/Arity),not member(X/Arity,Xs),hypothesis_body(Xs). %mayb retract and replace this clause with specialisations.

%%% Gen a hyp
%%% Add another clause?


%%% spec a hyp
%%% unify or constrain vars.



thing(not(X/Arity),_,not(Term)):- length(List,Arity), append([X],List,Total),Term =..Total.
thing(X/Arity,_,Term):- atom(X),length(List,Arity), append([X],List,Total),Term =..Total.

hypothesis_body_vars(X,Terms):-
    length(X,Len),
    length(Yvars,Len),
    maplist(thing,X,Yvars,Terms).

%?- hypothesis_body(X),hypothesis_body_vars(X,Terms).


/** <examples> Your example queries go here, e.g.
?- ? p(X).
*/
