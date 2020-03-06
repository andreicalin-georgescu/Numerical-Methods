function B = GramSchmidt(A)
  len = length(A);
  I  = eye(len);
  Q = zeros(len);
  R = zeros(len);
  
  %algoritm Gram Schmidt pentru ortogonalizare
  
  for j=1:len
    x=A(:,j);
    for i=1:j-1
       R(i,j) = Q(:,i)'*x;
       x = x - R(i,j)*Q(:,i);
    endfor
   R(j,j) = norm(x);
   Q(:,j) = x/R(j,j);
  endfor
 
    
    B=zeros(size(A));
    n = len;
 
   for i = n:-1:1
     for j = 1:n
       %suma elementelor de sub linia i de pe col j din inversa*elementele 
       %de dupa coloana j de pe linia i din R
       sum = R(i,i:n)*B(i:n,j);
       B(i,j)= (Q'(i,j) - sum)/R(i,i);
     endfor
   endfor

endfunction

