function [c,ceq] = mycon(x)
c=[];
%ceq=zeros(1,length(x));
for i=1:length(x)
    ceq(i)=(x(i)-1)*x(i); % Compute nonlinear equalities at x.
end

