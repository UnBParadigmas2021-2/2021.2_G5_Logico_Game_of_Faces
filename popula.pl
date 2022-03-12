character/12.

popula:-
    csv_read_file('dataset.csv', Rows, [functor(character), arity(12), separator(0';)]),
    maplist(assert, Rows).
