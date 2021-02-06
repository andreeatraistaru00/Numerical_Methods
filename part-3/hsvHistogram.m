
function [sol] = hsvHistogram(path_to_image, count_bins)
 image = imread(path_to_image); 
  
% posizita de la care incep valorile corespunatoare matricei V din reprezentarea HSV

  a = 2 * count_bins;

% extrag matricele de nuante pentru fiecare culoare din reprezentarea RGB

  [H S V] = hsv_transf(image(:, :, 1), image(:, :, 2), image(:, :, 3));
 
  for i = 0 : count_bins - 1
     x = double(i * 101) / count_bins;
     y = double((i + 1 ) * 101) / count_bins;
    [sol(i + 1) aux] = size(H(H >= x & H < y));
    [sol(count_bins + i + 1) aux] = size(S(S >= x & S < y));
    [sol(a + i + 1) aux] = size(V(V >= x & V < y));
    
  endfor
 
end