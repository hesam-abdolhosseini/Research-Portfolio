
function Last = L(x)

global N;
M = sqrt(N);

LSD = Ls_d(x);                      % 9x9
PSD = P_S_D;                        % 9x9
Last = zeros(N^2,1);

nodesource = 1;
conter = 1;
for i=1:M
    for j=1:M
        ZZ=1;
        for k=1:M
            for l=1:M
                L = PSD(nodesource,ZZ) * LSD(nodesource,ZZ);
                ZZ = ZZ+1;
                Last(conter,1) = L;
                conter = conter +1;
            end
        end
        nodesource = nodesource + 1;
    end
end
Last = sum(Last) ;
end
