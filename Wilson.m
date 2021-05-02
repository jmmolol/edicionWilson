#X es la matriz que contiene las muestras
#xl es un vector columna con las etiquetas de clase de cada muestra
#k es el número de vecinos más cercanos a aplicar

#Esta función implementa el algoritmo de Wilson de forma muy similar a la vista
# en las transparencias de teoría en PER
function [ind] = Wilson (X,xl,k)
ind = [1:rows(X)]; #Vector horizontal de índices
N = rows(X); #nº de datos
V = mnn(X,xl,100); #Fue recomendado por el boletín usar aprox 100 vecinos más cercanos
error = true;
while (error)
  error = false;
  for i=1:N
    if(ismember(i,ind))
      c = knnV(V(:,i),ind,xl,k);
      if(c != xl(i,1))
        ind = setdiff(ind,i);
        error = true;
      endif
    endif
  endfor
endwhile
endfunction
