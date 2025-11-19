
function Pi = P_jk_N
global N;

lan = Landa_ij_N;
lam = Landa_J;
lam2 = [lam lam lam lam lam];
Pii = lan ./ lam2;
for i=1:N
    for j=1:25
        if isnan(Pii(i,j))
            Pii(i,j)=0;
        end
    end
Pi = Pii;
end