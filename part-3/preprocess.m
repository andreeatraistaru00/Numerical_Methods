function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  nume_dir_cats = strcat(path_to_dataset, "cats/");
  nume_dir_notcats = strcat(path_to_dataset, "not_cats/");
  
  fisiere_cats = dir(nume_dir_cats);
  [number_cats aux] = size(fisiere_cats);
  
  fisiere_notcats = dir(nume_dir_notcats);
  [number_notcats aux] = size(fisiere_notcats);
  
% nu iau in calcul primele 3 fisiere

  y_cats(1 : number_cats - 3) = 1;
  y_notcats(1 : number_notcats - 3) = -1;

% concatenez cei 2 vectori de mai sus
  
  y = [y_cats y_notcats]';
  
  if (strcmp(histogram, "RGB") == 1)

    for i = 3 : number_cats - 1
        
      nume_fisiere_cats = strcat(nume_dir_cats, fisiere_cats(i).name); 
      X_cats(i - 2, : ) = rgbHistogram(nume_fisiere_cats, count_bins);
    
    endfor
  
    for i = 3 : number_notcats - 1

      nume_fisiere_notcats = strcat(nume_dir_notcats, fisiere_notcats(i).name);
      X_notcats(i-2, :) = rgbHistogram(nume_fisiere_notcats, count_bins);

    endfor
  endif
  
  if (strcmp(histogram, "HSV") == 1)

% parcurg directorul cu fisiere cu pisici
  
    for i = 3 : number_cats - 1
    
      nume_fisiere_cats = strcat(nume_dir_cats, fisiere_cats(i).name); 
      X_cats(i - 2, : ) = hsvHistogram(nume_fisiere_cats, count_bins);
    
    endfor
  
    for i = 3 : number_notcats - 1 
      nume_fisiere_notcats = strcat(nume_dir_notcats, fisiere_notcats(i).name);
      X_notcats(i-2, :) = hsvHistogram(nume_fisiere_notcats, count_bins);
      
    endfor    
  endif
  
% concatenez cele 2 matrice obtinute 

  X = [X_cats' X_notcats']';
endfunction
