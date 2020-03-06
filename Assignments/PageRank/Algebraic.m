% Georgescu, Andrei Calin, 314CA

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
      
 
      for j=1:L
          link = fscanf(fid, "%d", 1);
          
          A(nod,link) = 1;
          if(nod == link)
            A(nod,link) = 0;
            L--;
          endif
     endfor
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
%se apeleaza functia GramSchmidt care afla inversa unei matrici folosind factorizarea
%QR
    B = GramSchmidt(eye(N) - d*M);
    R = B * ((1-d) / N * ones(N,1));
   
    
endfunction
