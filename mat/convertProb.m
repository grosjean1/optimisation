function [ C, Ain, b, Aeq, beq ] = convertProb(C, A, b)
% dimensions du pb
[m,n] = size(C);

% vecteur de coûts
C = reshape(C,[m*n,1]);

% Ain contraintes d'inégalité
Ain = [];
for i=1:m
    u = zeros(1,m);
    Ai = [];
    for j=1:n
        u(i) = A(i,j);
        Ai = [Ai,u];
    end
    Ain = [Ain;Ai];
end

% Aeq contraintes d'égalité
u = ones(1,m);
Aeq = [];
for i=1:n
    Aeq = blkdiag(Aeq,u);
end

% beq vecteur d'égalité
beq = ones(n,1);