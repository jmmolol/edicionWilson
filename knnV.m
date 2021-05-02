
#Vi es un vector columna con los m vecinos más cercanos del dato
#ind son los datos que aún se mantienen
#xl son las clases de cada dato
#k son los k vecinos más cercanos a aplicar

#Esta función devuelve la clase a la que creemos que pertenece la 
# muestra a la que pertenece el vector de NN Vi
function clase = knnV (Vi,ind,xl,k)
  nclases = size(unique(xl))(1,1); #nº de clases únicas en xl
  aux = zeros(nclases,1); #Aux es un vector vertical con todos los elementos a 0 de tamaño nclases
  for i=1:k
    j=1;
    do
      dato = Vi(j,1); #Obtenemos el índice del i vecino más cercano
      #dato
      if(ismember(dato,ind)) 
        clasedato = xl(dato,1)+1; #Obtenemos la clase de ese dato
        aux(clasedato,1) = aux(clasedato,1) + 1; #Sumamos 1 al contador de clase más cercana
      endif
      j+=1;
    until(ismember(dato,ind) || j > 100)
  endfor
  #Comprobar el más grande y devolver
  [contador,clase] = max(aux); #Devuelve la clase en la que se clasifica en c y en contador el nº de NN de esa clase
  clase -= 1;
  endfunction