%On prend les valeurs 
src_file = 'dat/1/a05100';

[c,A,b] = loadfile(src_file);
[m,n] = size(c);        % dimensions

[ c, A, b, Aeq, beq ] = convertProb(c,A,b);
lb = zeros(m*n,1);      % lower bound
ub = ones(m*n,1);       % upper bound
x0 = zeros(m*n,1);

fun = @(x) c'*x;

[~,fval] = patternsearch(fun,x0,A,b,Aeq,beq,lb,ub);



% x = ga(fitnessfcn,nvars)
% 
% fun = @(x) C1'*x;
% 
% x_pattern = patternsearch(fun,x,Ain1,b1,Aeq1,beq1,lb,ub);

