function [values, colind, rowptr] = matrix_to_csr(A)
  n = length(A);
  nz = 0;
  p = 1;
  rowptr = zeros(1, n + 1);
  for i = 1 : n
    ok = 1;
    for j = 1 : n
      if (A(i, j) != 0) 
      nz++;
      if (ok == 1)
      rowptr(p) = nz;
      ok = 0;
      p++; 
     endif
    endif
   endfor
 endfor
  rowptr(n + 1) = nz + 1;
  p = 1;
  values = zeros(1, nz);
  colind = zeros(1, nz);
  for i = 1 : n
    for j = 1 : n
      if (A(i, j) != 0) 
        values(p) = A(i, j);
        colind(p) = j;
        p++;
      endif
    endfor
  endfor

endfunction