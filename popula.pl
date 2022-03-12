character/49.

popula:-
    csv_read_file('dataset.csv', Rows, [functor(character), arity(49)]),
    maplist(assert, Rows).
