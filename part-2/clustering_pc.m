function [centroids] = clustering_pc(points, NC)
  X = points;
  K = NC;
  [Ndata, dims] = size(X);
  dist = zeros(1,K);
  means = zeros(K,dims);
  clust = zeros(Ndata / NC,dims);
  maxerr = 0 ;
  
% Initializare centroids

  for i = 1 : K
   p = 1;
    for j = i : K : Ndata
       clust(p, :) = X(j, :);
        p++;
    endfor
    if(p > 1)
      means(i, :) = mean(clust);
    endif
  endfor
  maxerr = 1;
  
while (maxerr != 0)
   
   class = zeros(K,dims);
   Nclass = zeros(K,1);
   
   for i = 1 : Ndata
      for j = 1 : K
        
         % Euclidean distance
         dist(j) = norm(X(i,:) - means(j,:));
        
      endfor
      index_min = find(~(dist-min(dist)));
      class(index_min,:) = class(index_min,:) + X(i,:);
      Nclass(index_min) = Nclass(index_min) + 1;
   endfor
   for i = 1 : K
     if(Nclass(i) != 0)
      class(i,:) = class(i,:) / Nclass(i);
     else 
        class(i,:) = means(i,:);
    endif
   endfor
   
   % Comparare rezultat cu iteratia anterioara
   cmp = 0;
   flag = 1;
   for i=1:K
      cmp = norm(class(i,:) - means(i,:));
     if (cmp > 0)
       maxerr = cmp;
       flag = 0;
       endif
   end
   if (flag == 1)
     maxerr = 0 ;
     endif
   % Centroid update
   means = class;
 
end
 centroids = means;
 
endfunction

