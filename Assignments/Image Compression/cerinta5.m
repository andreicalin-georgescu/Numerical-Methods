function cerinta5()
  A = double(imread("image2.gif"));
  [m, n] = size(A);
  miu = zeros(m,1);

%pentru subpunctul_1
  for i=1:m
   miu(i) = sum(A(i, 1:n))/n;
   A(i, 1:n) = A(i, 1:n) - miu(i);
  endfor
  
   Z = A'/sqrt(n - 1);
  
   [U S V] = svd(Z);
  subplot(2,2,1);     
  plot(diag(S));

%intervalul de vlaori pentru k 
dim = min(m,n);
k = [1:19 20:20:99 100:30:dim];

X = zeros(1,  length(k));
Y_2 = zeros(1,  length(k));
Y_3 = zeros(1,  length(k));
Y_4 = zeros(1,  length(k));

%pentru subpunctul_2
iterator = 1;
for j=1:length(k);
  numarator = 0;
  numitor = 0;
  for i=1:k(j)
    numarator = numarator + S(i,i);
  endfor
  
  for i=1:dim
    numitor = numitor + S(i,i);
  endfor 
  
  info = double(numarator/numitor);
  X(iterator) = k(j);
  Y_2(iterator) = info;
  iterator = iterator + 1;
endfor

%pentru subpunctul_3
iterator = 1;
for t=1:length(k)
  suma = 0;
  Ak = cerinta3("image2.gif", k(t));
  
  for i=1:m
    for j=1:n
      suma = suma + (A(i,j) - Ak(i,j))^2/(m*n);
    endfor
  endfor
  Y_3(iterator) = double(suma);
  iterator = iterator + 1;
endfor 

%pentru subpunctul_4
iterator = 1;
for t=1:length(k)
  compr = double(2*k(t)+1)/n;
  Y_4(iterator) = compr;
  iterator = iterator + 1;
endfor
%printarea graficelor
  subplot(2,2,2);
  plot(X,Y_2);
  
  subplot(2,2,3);
  plot(X,Y_3);
  
  subplot(2,2,4);
  plot(X,Y_4);
endfunction