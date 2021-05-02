#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: pca+knn-eva.m <trdata> <trlabels> <tedata> <telabels> <k>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
tedata=arg_list{3};
telabs=arg_list{4};
k=str2num(arg_list{5});

load(trdata);
load(trlabs);
load(tedata);
load(telabs);

[media,W] = pca(X); %Mi implementación de pca funciona con filas

X2 = X - media;
Y2 = Y - media;
X_proy = W(:,1:k)'*X2';
Y_proy = W(:,1:k)'*Y2';
err = knn(X_proy', xl, Y_proy', yl, 1);
printf("Tasa de error aplicando PCA con k=89: %d\n", err);
err = knn(X, xl, Y, yl, 1);
printf("Tasa de error sin aplicar PCA: %d\n", err);
