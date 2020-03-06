% Georgescu, Andrei Calin, 314CA

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  
  %valorile pentru a si b au fost calculate folosind limite laterale
  a= 1/(val2 - val1);
  b= -val1/( val2 - val1);
  
  if(0 <= x && x < val1)
    y = 0;
  else if(val1 <= x && x < val2)
        y = a*x + b;
       else if(val2 <= x && x <= 1)
            y = 1;
          endif
       endif
  endif
 endfunction