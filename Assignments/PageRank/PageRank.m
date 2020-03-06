% Georgescu, Andrei Calin, 314CA

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
  fid_in = fopen(nume,'rt');
  %N = fscanf(fid_in, "%d", 1);
  N = str2num(fgetl(fid_in));
  for i=1:N
      fgetl(fid_in);
  endfor
  
  val1 = str2num(fgetl(fid_in));
  val2 = str2num(fgetl(fid_in));
  
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  
  nume_out = [nume ".out"];
  fid_out = fopen(nume_out, "wt");
  fprintf(fid_out, "%d\n", N);
  for i=1:N
      fprintf(fid_out, "%0.6f\n", R1(i));
  endfor
  fprintf(fid_out, "\n");
  
  %printarea vectorului R2 si memorarea nodurilor
  index = zeros(1,N);
  for i=1:N
      fprintf(fid_out, "%0.6f\n", R2(i));
      index(i) = i;
  endfor
 
 %bubblesort pentru ordonarea descrescatoara a vectorului, cu pastrarea nodurilor
  terminat = 0;
  while terminat == 0
    terminat = 1;
    for i=1:N-1
      if(R2(i) < R2(i+1))
        aux = R2(i+1);
        R2(i+1) = R2(i);
        R2(i) = aux;
        aux = index(i+1);
        index(i+1) = index(i);
        index(i) = aux;
        terminat = 0;
      endif
    endfor
  endwhile
  %salvam valoarea vectorului ordonat in PR1
  PR1 = R2;
  fprintf(fid_out, "\n");
   
 %formatam outputul
  for i=1:N
      y = Apartenenta(PR1(i), val1, val2);
      fprintf(fid_out, "%d %d %0.6f\n",i,index(i),y);
  endfor
  
  
  fclose(fid_out);
  fclose(fid_in);
  
 endfunction