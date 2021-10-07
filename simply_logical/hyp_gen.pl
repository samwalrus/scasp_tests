modeb(penguin).
modeb(bird).
modeb(has_feathers).
modeb(has_beak).

%%%mayb include the numbering of vars in this generation.
%%% Insure vars form dag of unification.
hypothesis_body([X]):-modeb(X).
hypothesis_body([not(X)]):-modeb(X).
hypothesis_body([X|Xs]):- maplist(dif(X),Xs),modeb(X), hypothesis_body(Xs). %mayb retract and replace this clause with specialisations.

thing(not(X),Y,not(Term)):- Term =..[X,Y].
thing(X,Y,Term):- atom(X),Term =..[X,Y].

hypothesis_body_vars(X,Terms):-
    length(X,Len),
    length(Yvars,Len),
    maplist(thing,X,Yvars,Terms).

%?- hypothesis_body(X),hypothesis_body_vars(X,Terms).