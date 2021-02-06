function [cost] = compute_cost_pc(points, centroids)

  X = points;
  [Ndata, dims] = size(X);
  [K dims] = size(centroids);
  dist = zeros(1,K);
  sum = 0; 
   for i = 1 : Ndata
     dist = zeros(1, K);
      for j = 1 : K
         dist(j) = norm(X(i,:) - centroids(j, :));
        end
 % suma distantelor minime
      sum = sum + min(dist);
   end

 cost = sum;
endfunction

