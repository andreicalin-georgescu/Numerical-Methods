function [Ak, S] = cerinta4(image, k)

  A = double(imread(image));
  [m, n] = size(A);
  miu = zeros(m,1);
  
  for i=1:m
    miu(i) = sum(A(i, 1:n))/n;
    A(i, 1:n) = A(i, 1:n) - miu(i);
  endfor
  
  Z = A*(A'/(n - 1));
  
  [V S] = eig(Z);
  
  W = V(1:m, 1:k);
  
  Y = W' * A;
  
  Ak = W * Y + miu;
  

endfunction