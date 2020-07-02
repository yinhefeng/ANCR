function [z,c] = ANCR(X, temp_X, y, param)
[d,n] = size(X);
tol = 1e-5;
maxIter = 5;
mu = param.mu;
z = zeros(n,1);
c = zeros(n,1);
delta = zeros(n,1);

XTy = X'*y;
iter = 0;

while iter<maxIter
    iter = iter + 1;
    
    zk = z;
    ck = c;
    
    % update c
    c = temp_X*(XTy+mu/2*z+delta/2);
    
    % update z
    z_temp = c-delta/mu;
    z = EProjSimplex_new(z_temp, 1);
    
    leq1 = z-c;
    leq2 = z-zk;
    leq3 = c-ck;
    stopC1 = max(norm(leq1),norm(leq2));
    stopC = max(stopC1,norm(leq3));
    %     disp(stopC)
    
    if stopC<tol || iter>=maxIter
        break;
    else
        delta = delta + mu*leq1;
    end
end