
function L = Ls_d(x)

global N;
global m;

M = sqrt(N);

ts = 1;
tr = 1;
tw = 1;
tinj = 1;
tej = 1;
Lb = (m-1)*(ts + tw);               % Latency of body flits
Wsd = Ws_d(x);                      % 9x9
lsd = zeros(N);

nodesource = 1;
for i=1:M
    for j=1:M
        ZZ = 1; 
        for k=1:M
            for l=1:M
                Distance = abs(j-l) + abs(i-k) + 1;           % Tedade node-haye S ta D
                lsd(nodesource,ZZ) = tinj + Distance*(ts+tr) + (Distance -1)*tw + tej + Wsd(nodesource,ZZ) + Lb;
                ZZ = ZZ+1;
            end
        end
        nodesource = nodesource +1;
    end
end
L = lsd;
end
