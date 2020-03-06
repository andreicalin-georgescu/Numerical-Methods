%Georgescu, Andrei Calin, 314CA

function R = Iterative(nume, d, eps)
    % Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    output_precision(6);
    fid = fopen(nume, 'rt');
    N = fscanf(fid, "%d", 1);
    M=zeros(N);
    R=zeros(N,1);
    vecini=zeros(N,1);
    
   for i=1:N
      R(i) = 1/N;
    endfor

    for i = 1:N
      nod = fscanf(fid, "%d",1);
      L = fscanf(fid, "%d", 1);
      
 %cream o matrice de adiacenta in care salvam legaturile dintre noduri
 
      for j=1:L
          link = fscanf(fid, "%d", 1);
          
          A(nod,link) = 1;
          if(nod == link)
            A(nod,link) = 0;
            L--;
          endif
     endfor
 %salvam numarul de vecini reali pe care ii are fiecare nod
     vecini(nod) = L;
   endfor
  
    for i = 1:N
      for j = 1:N
        if(A(j,i) == 1)
          M(i,j) = 1/vecini(j);
        endif
      endfor    
    endfor
   
    v=zeros(N,1);
    while(norm(R - v) >= eps)
      v=R;
      R = d*M*v + (1 - d)/N * ones(N,1); 
    endwhile
    fclose(fid);
endfunction