% Georgescu, Andrei Calin, 314CA 

Tema 1 MN 

Tema de casa este alcatuita din 5 functii.

-Functia Iterative:

se foloseste o matrice de adiacenta pentru a salva legaturile reale intre noduri, in acelasi timp memorandu-se intr-un vector numarul de vecini ai fiecarui nod
initializam vectorul R cu valoarea indicata - 1/N;
se citesc valorile linie cu linie, iar pe baza lor se construieste matricea de adiacenta
matricea M se va construi pe baza matricii de adiacenta, avand grija la cazul cand un nod are legatura la el insusi
se calculeaza iterativ valoarea lui R, pana cand eroarea va fi mai mica decat epsilon dat, folosind formula indicata in enunt
se returneaza R

-Functia Algebraic:

se foloseste acelasi procedeu ca la Iterative, diferenta fiind ca formula de calcul cere aflarea unei inverse cu algoritmul Gram Schmidt.
Asadar se calculeaza inversa matrici (In - d*M) si se calculeaza R algebric, folosind formulele indicate in enunt.

-Functia Gram Schmidt:

este compusa din doua sectiuni, prima care descompune efectiv matricea data in QR si cea de-a doua care rezolva un sistem superior triunghiular.
Prima parte a functiei foloseste algoritmul de baza, modificat pentru a cere un numar mai mic de pasi.
Cea de-a doua parte este rezolvarea efectiva a sistemului R*A^(-1)=Q', din care se extrage matricea inversa B.

-Functia Apartenenta
calculeaza pe baza valorilor val1 si val2 numerele a si b, iar dupa foloseste definitia din enuntul problemei pentru a determina gradul de 
apartenenta a unei pagini web. Astfel, incadrarea valorii x in cele trei intervale a fost realizata cu ajutorul a trei instructiuni repetitive imbricate.

-Functia PageRank
inglobeaza toate celelalte functii si formateaza output-ul conform indicatiilor date. Ca si algoritm pentru sortare, s-a folosit algoritmul BubbleSort.