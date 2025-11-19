
function Q = Landa_ij_N  %Average Packet Rate (packets per cycle)

global N;
M = sqrt(N);

P = P_S_D;                  % NxN
LS = Landa_S;               % Nx1
counter = 1;
nodesource = 1;
for i=1:M                   % SOURCE
    for j=1:M
        Destination=1;
        for k=1:M           % Destination
            for l=1:M
                QQ1 = LS(nodesource,1) .* P(nodesource,Destination);       % Landa_S x Ps-->d
                QQ2 = Rs_d(i,j,k,l);
                QQ(:,:,counter) = QQ1 .* QQ2;
                Destination=Destination+1;
                counter = counter + 1;
            end
        end
        nodesource = nodesource +1;
    end
end
Q =sum(QQ,3);
end