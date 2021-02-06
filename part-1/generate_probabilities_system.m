function [A, b] = generate_probabilities_system(rows)
  B = zeros(rows);
  x = 1;
  for i=1:rows
    for j=1:i
      B(i,j) = x;
      x++;
    endfor  
   endfor
   b = zeros(x-1,1);
   A = zeros(x-1);
   b(x-rows:x-1) = 1; 
   
   for i=1:rows
    for j=1:i    
     if (i==j && i!=rows) 
        A(B(i,j),B(i+1,j:j+1)) = -1;
        A(B(i+1,j:j+1),B(i,j)) = -1;
    elseif (i==rows && j!=rows)
        A(B(i,j),B(i,j+1)) = -1;
        A(B(i,j+1),B(i,j)) = -1;
    elseif (j!=rows)
        A(B(i,j),B(i,j+1)) = -1;
        A(B(i,j),B(i+1,j:j+1)) = -1;
        A(B(i,j+1),B(i,j)) = -1;
        A(B(i+1,j:j+1),B(i,j)) = -1; 
      end
 % am construit diagonala principala
      if ((i==1 || i==rows) && (j==1 || j==rows))
        A(B(i,j),B(i,j)) = 4;
      elseif (j==1 || j==i || i==rows)
        A(B(i,j),B(i,j)) = 5;
      else
        A(B(i,j),B(i,j)) = 6;
        end
    endfor
  endfor

endfunction