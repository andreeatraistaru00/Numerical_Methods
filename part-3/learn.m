function [w] = learn(X, y)
  [linii coloane] = size(X);
  
% construiesc matricea X tilda 

  X(1 : linii, coloane + 1) = 1;

% amplific in membrul stang al ecuatiei matriceale X * w = y cu X'

  y = X' * y;
  X = X' * X;
  
% extrag transpusa lui Q din descompunerea X=Q*R prin metoda Householder 

 [Q R] = Householder(X);
 
% dupa descompunere ecuatia matriceala va deveni Q * R * w = X' * y. Inmultesc ecuatia in partea stanga cu Q', care e inversa lui Q, deoarece Q e matrice ortogonala

 y = Q' * y;

% rezolv sistemul superior triunghiulat R * w = y

 w = SST(R, y);
 
endfunction

