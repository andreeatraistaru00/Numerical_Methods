function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
 
  [dims aux] = size(w);

% initializez variabilele ce imi vor oferi numarul de identificari corecte
  corect_cats = 0;
  corect_notcats = 0;
  
% construiesc numele celor 2 directoare

  nume_dir_cats = strcat(path_to_testset, "cats/");
  nume_dir_notcats = strcat(path_to_testset, "not_cats/");

  fisiere_cats = dir(nume_dir_cats);
  fisiere_notcats = dir(nume_dir_notcats);

  [number_cats aux] = size(fisiere_cats);
  [number_notcats aux] = size(fisiere_notcats);

  if (strcmp(histogram, "RGB") == 1)
  
  	for i = 3 : number_cats - 1
   		nume_fisiere_cats = strcat(nume_dir_cats, fisiere_cats(i).name);
   		x = rgbHistogram(nume_fisiere_cats, count_bins);
   		x = [x 1];

% conditia pentru a contine pisici
  
    		if (w' * x' >= 0)
      			corect_cats++;
    		endif
  	endfor


  	for i = 3 : number_notcats - 1

    		nume_fisiere_notcats = strcat(nume_dir_notcats, fisiere_notcats(i).name);
    		x = rgbHistogram(nume_fisiere_notcats, count_bins);
    		x = [x 1];

% conditia pentru a nu contine pisici

    		if (w' * x' < 0)
   		   corect_notcats++;
    		endif
  	endfor
   endif

   if (strcmp(histogram, "HSV") == 1)
  
  	for i = 3 : number_cats - 1
   		nume_fisiere_cats = strcat(nume_dir_cats, fisiere_cats(i).name);
   		x = hsvHistogram(nume_fisiere_cats, count_bins);
   		x = [x 1];
  
    		if (w' * x' >= 0)
      			corect_cats++;
    		endif
  	endfor

  	for i = 3 : number_notcats - 1
    		nume_fisiere_notcats = strcat(nume_dir_notcats, fisiere_notcats(i).name);
    		x = hsvHistogram(nume_fisiere_notcats, count_bins);
    		x = [x 1];

    		if (w' * x' < 0)
   		   corect_notcats++;
    		endif
  	endfor
   endif
  
  percentage = ((corect_cats + corect_notcats) / (number_cats + number_notcats - 6) );
  
endfunction