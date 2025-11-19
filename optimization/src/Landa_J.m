
function J=Landa_J  %Average Packet Rate (packets per cycle)

    global N;

    Landa_ij = Landa_ij_N;      % Node coordinate

    for i=1:N
    
        J1 = Landa_ij(i,1) + Landa_ij(i,6) + Landa_ij(i,11) + Landa_ij(i,16) + Landa_ij(i,21);
        J2 = Landa_ij(i,2) + Landa_ij(i,7) + Landa_ij(i,12) + Landa_ij(i,17) + Landa_ij(i,22);
        J3 = Landa_ij(i,3) + Landa_ij(i,8) + Landa_ij(i,13) + Landa_ij(i,18) + Landa_ij(i,23);
        J4 = Landa_ij(i,4) + Landa_ij(i,9) + Landa_ij(i,14) + Landa_ij(i,19) + Landa_ij(i,24);
        J5 = Landa_ij(i,5) + Landa_ij(i,10)+ Landa_ij(i,15) + Landa_ij(i,20) + Landa_ij(i,25);
        
        J(i,:) = [J1,J2,J3,J4,J5];        % J(N) = [Landa1_N, Landa2_N,Landa3_N,Landa4_N,Landa5_N]
    end
    J;
end

