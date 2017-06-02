#------------------------------------------
#
#
#
#------------------------------------------
# 
#------------------------------------------

param N, integer, > 0;			# nbr colonnes
param M, integer, > 0;			# nbr lignes

set I := 1..M;					# indices lignes
set J := 1..N;					# indices colonnes

#--- Paramètres
param c{i in I, j in J};	# Coefficients de la fonc. objectif 
param a{i in I, j in J};	# Coefficients de la matrice des contraintes 
param b{i in I};			# Second membre des contraintes

#--- Variables de decision
var x{i in I, j in J}, binary;

#--- Contraintes du probleme
s.t. constraint1 {i in I}: sum{j in J}a[i,j]*x[i,j] <= b[i];
s.t. constraint2 {j in J}: sum{i in I}x[i,j] == 1;

#--- Critere a optimiser 
minimize Objective: sum{i in I}sum{j in J}c[i,j]*x[i,j];


