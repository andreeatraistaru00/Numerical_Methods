function [sol] = rgbHistogram(path_to_image, count_bins)
   image = imread(path_to_image);

% pozitia de la care incep valorile nuantelor de culoare corespunzatoare culorii albastru
 
  a = 2 * count_bins;   

    for i = 0 : count_bins - 1
    x = i * 256 / count_bins;
    y = (i + 1) * 256 / count_bins;
    [sol(i + 1) aux] = size(image(image(:, :, 1) >= x & image(:, :, 1) < y));
    [sol(count_bins + i + 1) aux] = size(image(image(:, :, 2) >= x & image(:, :, 2) < y));
    [sol(a + i + 1) aux] = size(image(image(:, :, 3) >= x & image(:, :, 3) < y));
  
  endfor

end