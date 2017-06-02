%% Script intlinprog

src_files = {'dat/1/a05100' 'dat/1/a05200' 'dat/1/a20200' 'dat/2/b05100' 'dat/2/b20200' 'dat/3/c05100' 'dat/3/c20400'};
n = length(src_files);  fval = zeros(n,0);  time = zeros(n,0);  i=1;

for file=src_files
    % Chargement d'une instance
    [c,a,b] = loadfile(char(file));
    [m,n] = size(c);        % dimensions
    
    [ c, a, b, aeq, beq ] = convertProb(c,a,b);
    lb = zeros(m*n,1);      % lower bound
    ub = ones(m*n,1);       % upper bound
    intcon = ones(m*n,1);   % toutes les variables sont entières

    % résolution
    tic;
    [ ~,fval(i)] = intlinprog(c, intcon, a, b, aeq, beq, lb, ub);
    time(i) = toc;
    i = i+1;
end