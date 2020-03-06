function A_k = cerinta1 (image,k)
 
      A = imread(image);
      
      [U, S, V] = svd(A);
      
      [m, n] = size(A);

      
      Uk = U(1:m,1:k);
      Sk = S(1:k, 1:k);
      Vk = V'(1:k, 1:n);
      
      A_k = Uk * Sk * Vk;
 endfunction