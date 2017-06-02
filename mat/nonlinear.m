function [c,ceq] = nonlinear(x)

ceq=diag(x)*x-x;
c=[];
% ceq=[];
% %ceq=zeros(1,length(x));
% for i=1:1:length(x)
%     ceq=[ceq;(x(i)-1)*x(i)]; % Compute nonlinear equalities at x.
% end
end
