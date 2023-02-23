mianbiwi('chotekhan', 'chotirani').
mianbiwi('barrekhan', 'barrirani').
mianbiwi('nadir', 'nahid').
mianbiwi('asad', 'sumra').
mianbiwi('salim', 'kausar').
mianbiwi('rizwan', 'sanam').

parent('chotekhan', 'kausar').
parent('chotekhan', 'nadir').
parent('chotekhan', 'asad').
parent('chotirani', 'kausar').
parent('chotirani', 'nadir').
parent('chotirani', 'asad').

parent('barrekhan', 'nahid').
parent('barrekhan', 'sumra').
parent('barrirani', 'nahid').
parent('barrirani', 'nahid').

parent('nadir', 'burhan').
parent('nadir', 'rashid').
parent('nadir', 'akram').

parent('nahid', 'burhan').
parent('nahid', 'rashid').
parent('nahid', 'akram').

parent('asad', 'salima').
parent('asad', 'sanam').
parent('sumra', 'salima').
parent('sumra', 'sanam').

parent('salim', 'rizwan').
parent('kausar', 'rizwan').

parent('rizwan', 'rabia').
parent('sanam', 'rabia').

gins('mard', 'chotekhan').
gins('mard', 'barrekhan').
gins('mard', 'salim').
gins('mard', 'nadir').
gins('mard', 'asad').
gins('mard', 'rizwan').
gins('mard', 'burhan').
gins('mard', 'rashid').
gins('mard', 'akram').

gins(aurat, 'chotirani').
gins(aurat, 'barrirani').
gins(aurat, 'kausar').
gins(aurat, 'nahid').
gins(aurat, 'sumra').
gins(aurat, 'salima').
gins(aurat, 'sanam').
gins(aurat, 'rabia').

baap(Variable1, Variable2):-
    parent(Variable1, Variable2),gins(mard, Variable1).

beti(V1, V2):-
    parent(V2, V1), gins(aurat, V1).

beta(V1, V2):-
    parent(V2, V1), gins(mard, V1).

dada(V1, V2):-
    parent(X, V2), gins(mard, X), gins(mard, V1),parent(V1, X).

nana(V1, V2):-
    parent(X, V2), gins(aurat, X), gins(mard, V1), parent(V1, X).

dadi(V1, V2):-
    parent(X, V2), gins(mard, X), gins(aurat, V1),parent(V1, X).

nani(V1, V2):-
    parent(X, V2), gins(aurat, X), gins(aurat, V1), parent(V1, X).

behn(V1, V2):-
    parent(X, V1),gins(mard, X), parent(X, V2), gins(aurat, V1), not(V1=V2).

bhai(V1, V2):-
    parent(X, V1), gins('mard', X), parent(X, V2), gins('mard', V2), not(V1=V2).

sala(V1, V2):-
    behn(X, V2), mianbiwi(V1, X).

bahu(V1, V2):-
    parent(V2, X), mianbiwi(X, V1).

pota(V1, V2):-
    dada(V2, V1); dadi(V2, V1), gins('mard', V1).

poti(V1, V2):-
    dada(V2, V1); dadi(V2, V1), gins('aurat', V1).

sussar(V1, V2):-
    mianbiwi(X, V2), parent(V1, X), gins('mard', V1).

chachataya(V1, V2):-
    parent(X, V2), gins('mard', X), bhai(X, V1), gins('mard', V1).

khala(V1, V2):-
    parent(X, V2), gins('aurat', X), behn(X, V1), gins('aurat', V1).

baapdada(X, Y):-
    parent(X, Y), gins('mard', X).
baapdada(X, Y):-
    parent(X, Z), baapdada(Z, Y), gins('mard', Z), gins('mard', X).










