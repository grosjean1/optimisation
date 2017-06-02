function [c,ceq] = nonlinearga(x)
m=5;
n=100;
Aeq=diag(ones(1,n));
size(x);
for i=2:m
    Aeq=[Aeq,diag(ones(1,n))];
end
size(Aeq);
beq=ones(n,1);
ceq=[];
c=[Aeq*x'-beq;-(Aeq*x'-beq)];

end
