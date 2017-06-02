%PATTERNSEARCH et GA
%On prend les valeurs 
src_file = '../dat/1/a05100';
[C,A,b] = loadfile(src_file);

[m,n] = size(A);
X0=zeros(m*n,1);%X0 de la taille de A mais en vecteur colonne
Cnew=[C(1,:)];
for i=2:m
    Cnew=[Cnew,C(i,:)]; %on transforme C en vecteur ligne
end
fun = @(x) f(X0,Cnew);

%matrice des contraintes
B=zeros(m,2*n);
for i=1:m
    B(i,1+(i-1)*n:i*n)=A(i,:);
end

Aeq=diag(ones(1,n));
for i=2:m
    Aeq=[Aeq,diag(ones(1,n))];
end

beq=ones(n,1);
lb = zeros(m*n,1);
ub = ones(m*n,1);
X0=zeros(m*n,1);
mycon=@nonlinear;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PATTERNSEARCH
%option=psoptimset('TolCon',1e-6);
%option = psoptimset('TolMesh',0.02,'ScaleMesh','off');
x = patternsearch(fun,X0,B,b,Aeq,beq,lb,ub,mycon);
 SolPatternSearch=zeros(m,n);
 SolPatternSearch(1,:)=x(1:n)';
 for j=2:m
     SolPatternSearch(j,:)=x(n*(j-1)+1:n*j);
 end
 SolPatternSearch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%GA
IntCon=[1:m*n];
x2 = ga(fun,500,B,b,[],[],lb,ub,@nonlinearga,IntCon);
 SolGa=zeros(m,n);
 SolGa(1,:)=x2(1:n)';
 for j=2:m
     SolGa(j,:)=x2(n*(j-1)+1:n*j);
 end
 SolGa