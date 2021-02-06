function [H S V] = hsv_transf(R, G, B)
  
  [linii coloane] = size(R);

% initializez cele 3 matrice


  H(1 : linii, 1 : coloane) = 0;
  S(1 : linii, 1 : coloane) = 0;
  V(1 : linii, 1 : coloane) = 0;

  r = double(R) / 255;
  g = double(G) / 255;
  b = double(B) / 255;

% determin matricea ce contine pe fiecare pozitie maximul dintre R(i), G(i) si B(i), dar si pe cea care contine minimul si calculez delta ca diferenta lor
 
  C_max = max(max(r, g), b);
  C_min = min(min(r, g), b);
  delta = C_max - C_min;

  H(C_max == r & delta != 0) = 60 * mod( ( g(C_max == r & delta != 0) - b(C_max == r & delta != 0) ) ./ delta(C_max == r & delta != 0), 6);
  H(C_max == g & delta != 0) = 60 * double( ( ( b(C_max == g & delta != 0) - r(C_max == g & delta != 0) ) ./ delta(C_max == g & delta != 0) ) + 2);
  H(C_max == b & delta != 0) = 60 * double( ( ( r(C_max == b & delta != 0) - g(C_max == b & delta != 0) ) ./ delta(C_max == b & delta != 0) ) + 4);
 
  H = double(100 * H) / 360; 
  S(delta != 0) = delta(delta != 0) ./ C_max(delta != 0);
  S *= 100;
  V = C_max * 100;

endfunction  