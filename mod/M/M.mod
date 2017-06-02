#------------------------------------------
#
# 
#
#------------------------------------------
# 
#------------------------------------------


#--- Dimensions
param N, integer, > 0; 
param M, integer, > 0;


#--- Indices
set I := 1..M; # lignes
set J := 1..N; # colonnes


#--- Paramètres
param c{i in I, j in J};	# Coefficients de la fonc. objectif 
param a{i in I, j in J};	# Coefficients de la matrice des contraintes 
param b{i in I};			# Second membre des contraintes


#--- Variables de decision
var x{i in I,j in J}, binary; 


#--- Contraintes du probleme
s.t. capacity1{i in I, k in I}: (sum{j in {1..k-1}}a[i,j]*x[i,j]*x[i,k]) + (sum{j in {k+1..N}}a[i,j]*x[i,j]*x[i,k]) <= (b[i]-a[i,k])*x[i,k];
s.t. capacity2{ i in I, k in I }: (sum{j in J:j<>k}a[i,j]*x[i,j]) - (sum{j in J:j<>k}a[i,j]*x[i,j]*x[i,k]) <= b[i]-b[i]*x[i,k];
s.t. capacity3{j in J}: sum{i in I}x[i,j]=1;

#--- Critere a optimiser 
minimize Objective: sum{i in I}sum{j in J} c[i,j]*x[i,j];
 
