function P = P_S_D

global N;

a = zeros (N);

for i=1:N
    a(:,:) = 1;
end

for i=1:N
    for j=1:N
        if i==j
        a(i,j) = 0;
        end
    end
end


P = 1/(N*(N-1)) * a;
end