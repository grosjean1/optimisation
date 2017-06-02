function [ C, A, b ] = loadfile(filename)
% Les dimensions du problème (de la matrice des contraintes) sont lues en
% premier. Le script lira autant de nombres que nécessaire pour remplir
% dans l'ordre les paramètres du problème.

file = fopen(filename,'r');

dim = fscanf(file, '%i', 2);

C = fscanf(file,' %f', [dim(2), dim(1)])'; % objective function
A = fscanf(file,' %f', [dim(2), dim(1)])'; % constraints matrix
b = fscanf(file,' %f', [1, dim(1)]);

fclose(file);
end