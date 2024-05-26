father("андрей_иванов", "сергей_ивановф").
mother("екатерина_иванова", "сергей_иванов").
brother("илья_иванов", "сергей_иванов").
brother("николай_иванов", "сергей_иванов").
father("пётр_иванов", "андрей_иванов").
mother("елизавета_иванова", "андрей_иванов").
sister("татьяна_морозова", "андрей_иванов").
father("леонид_смирнов", "екатерина_иванова").
mother("кристина_смирнова", "екатерина_иванова").
father("владимир_иванов", "пётр_иванов").
mother("валентина_иванова", "пётр_иванов").
father("алексей_сидоров", "кристина_смирнова").
mother("дарья_сидорова", "кристина_смирнова").
father("валерий_мохов", "валентина_иванова").
mother("светлана_мохова", "валентина_иванова").
father("павел_сидоров", "алексей_сидоров").
mother("софья_сидорова", "алексей_сидоров").
father("максим_сидоров", "павел_сидоров").
mother("ксения_сидорова", "павел_сидоров").
father("игорь_грачёв", "ксения_сидорова").
mother("маргарита_грачёва", "ксения_сидорова").
father("василий_грачёв", "игорь_грачёв").
mother("александра_грачёва", "игорь_грачёв").
father("роман_соловьёв", "александра_грачёва").
mother("мария_соловьёва", "александра_грачёва").
father("владислав_герасимов", "михаил_герасимов").
mother("наталья_герасимова", "михаил_герасимов").
sister("марина_кузнецова", "михаил_герасимов").

/* rules */
is_brother(B, X) :- brother(B, X); brother(B, Y), (is_brother(Y, X); is_sister(Y, X)).
is_sister(S, X) :- sister(S, X); sister(S, Y), (is_brother(Y, X); is_sister(Y, X)).
is_sibling(S, X) :- is_brother(S, X); is_brother(X, S); is_sister(S, X); is_sister(X, S).
is_father(F, C) :- father(F, C); (father(F, X), is_sibling(X, C)).
is_mother(F, C) :- mother(F, C); (mother(F, X), is_sibling(X, C)).
is_parent(P, C) :- is_father(P, C); is_mother(P, C).
is_child(C, P) :- is_parent(P, C).
is_grandfather(F, C) :- is_father(F, X), is_parent(X, C).
is_grandmother(M, C) :- is_mother(M, X), is_parent(X, C).
is_uncle(U, C) :- is_brother(U, X), is_parent(X, C).
is_aunt(A, C) :- is_sister(A, X), is_parent(X, C).
is_spouse(S, X) :- is_parent(S, Y), is_parent(X, Y).
is_close_family(F, X) :- is_parent(F, X); is_child(F, X); is_sibling(F, X).
is_ancestor(A, X) :- is_parent(A, X); (is_parent(A, Y), is_ancestor(Y, X)).
is_descendant(D, X) :- is_child(D, X); (is_child(D, Y), is_descendant(Y, X)).
is_relative(R, X) :- is_ancestor(R, X); is_descendant(R, X).
