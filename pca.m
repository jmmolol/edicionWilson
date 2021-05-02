#Dada una matriz de muestras X, devuelve la media de los datos y una mat.
# de proyección
function [Xm, W] = pca(X)
  #Usaré una implementación muy similar a la vista en teoría
  n = rows(X);
  Xm = sum(X)/n; #Sumamos los vectores columna y dividimos por nº muestras
  A = X - Xm; #La matriz A tiene los datos con la media restada
  #Ahora queremos calcular la matriz de covarianza
  covarianza = A'*A/n;  #Multiplicamos la matriz con la media restada por su transpuesta
  [V,lambda] = eig(covarianza); #V son vectores y lambda valores propios
  #La opción más sencilla para ordenar los eigenvalues según su valor
  # propio asociado es mantener un índice tras ordenar los eigenvalues
  [ordenado,indice] = sort(diag(lambda),"descend"); #Función propia de GNU Octave
  W = V(:, indice);
  if (nargout == 1) 
    #Si solo nos dan un output, concatenamos los resultados
    Xm = [Xm; W];
  endif
endfunction