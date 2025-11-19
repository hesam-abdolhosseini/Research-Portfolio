function y = Mutate (x,mu)

    global u;
    nVar=numel(x);
    
    nmu=ceil(mu*nVar);
    
    j=randsample(nVar,nmu);
    
    y=x;
    y(j)= randi([0 u]);

end