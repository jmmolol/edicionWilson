#X es la matriz con las muestras
#xl son las clases a la que pertenece cada muestra
#m es la cantidad de vecinos más cercanos de cada muestra que queremos obtener

#Esta función devuelve para los datos en horizontal de la matriz X, una matriz columna 
# con un vector conteniendo los índices m vecinos más cercanos de cada dato en orden
# de más a menos cerca.
function [V] = mnn (X,xl,m)
N=rows(X);
numbatches=ceil(N*N*4/1024^3)*4;
if (numbatches<1) numbatches=1; end
batchsize=ceil(N/numbatches);

if (m>=N) #Comprobamos si m es mayor que el máximo posible de vecinos
  k = N;
else
  k = m+1;
endif
for i=1:numbatches
  Xbatch=X((i-1)*batchsize+1:min(i*batchsize,N),:);
  % D is a distance matrix where training samples are by rows 
  % and test sample by columns
  D = L2dist(X,Xbatch);
  % Sorting descend per column from closest to farthest
  [D,idx] = sort(D,'ascend');
  if (i==1) V = idx(2:k,:);
else V = [V idx(2:k,:)];
  endif
endfor

endfunction
