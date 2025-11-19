function W= W_ij_N(x)

    global N
    global C2_A;                 

    mu_j = mu_j_N;                   % Nx5

    ro_j = ro_j_n;                   % Nx5

    C2_S_N = C2_S_i_M(x);            % Nx5

    Landa_ij = Landa_ij_N;           % Nx25

    LandaJ = Landa_J;                % Nx5

    for i=1:N

    W_1_1(i) = ro_j(i,1) * (C2_A + C2_S_N(i,1)) / 2*(mu_j(i,1) - Landa_ij(i,1));   % W 1-->1 Node N
    W_1_2(i) = ro_j(i,2) * (C2_A + C2_S_N(i,2)) / 2*(mu_j(i,2) - Landa_ij(i,2));   % W 1-->2 Node N
    W_1_3(i) = ro_j(i,3) * (C2_A + C2_S_N(i,3)) / 2*(mu_j(i,3) - Landa_ij(i,3));   % W 1-->3 Node N
    W_1_4(i) = ro_j(i,4) * (C2_A + C2_S_N(i,4)) / 2*(mu_j(i,4) - Landa_ij(i,4));   % W 1-->4 Node N
    W_1_5(i) = ro_j(i,5) * (C2_A + C2_S_N(i,5)) / 2*(mu_j(i,5) - Landa_ij(i,5));   % W 1-->5 Node N
    W_1 = [W_1_1(i),W_1_2(i),W_1_3(i),W_1_4(i),W_1_5(i)];                          % :)

    W_2_1(i) = LandaJ(i,1) * (C2_A + C2_S_N(i,1)) / 2*(mu_j(i,1) - Landa_ij(i,1))^2; % W 2-->1 Node N
    W_2_2(i) = LandaJ(i,2) * (C2_A + C2_S_N(i,2)) / 2*(mu_j(i,2) - Landa_ij(i,2))^2; % W 2-->2 Node N
    W_2_3(i) = LandaJ(i,3) * (C2_A + C2_S_N(i,3)) / 2*(mu_j(i,3) - Landa_ij(i,3))^2; % W 2-->3 Node N
    W_2_4(i) = LandaJ(i,4) * (C2_A + C2_S_N(i,4)) / 2*(mu_j(i,4) - Landa_ij(i,4))^2; % W 2-->4 Node N
    W_2_5(i) = LandaJ(i,5) * (C2_A + C2_S_N(i,5)) / 2*(mu_j(i,5) - Landa_ij(i,5))^2; % W 2-->5 Node N
    W_2 = [W_2_1(i),W_2_2(i),W_2_3(i),W_2_4(i),W_2_5(i)];                          % :)

    W_3_1(i) = LandaJ(i,1) * (C2_A + C2_S_N(i,1)) / 2*(mu_j(i,1) - (Landa_ij(i,1) + Landa_ij(i,6)))^2;
    W_3_2(i) = LandaJ(i,2) * (C2_A + C2_S_N(i,2)) / 2*(mu_j(i,2) - (Landa_ij(i,2) + Landa_ij(i,7)))^2;
    W_3_3(i) = LandaJ(i,3) * (C2_A + C2_S_N(i,3)) / 2*(mu_j(i,3) - (Landa_ij(i,3) + Landa_ij(i,8)))^2;
    W_3_4(i) = LandaJ(i,4) * (C2_A + C2_S_N(i,4)) / 2*(mu_j(i,4) - (Landa_ij(i,4) + Landa_ij(i,9)))^2;
    W_3_5(i) = LandaJ(i,5) * (C2_A + C2_S_N(i,5)) / 2*(mu_j(i,5) - (Landa_ij(i,5) + Landa_ij(i,10)))^2;
    W_3 = [W_3_1(i),W_3_2(i),W_3_3(i),W_3_4(i),W_3_5(i)];                          % :)

    W_4_1(i) = LandaJ(i,1) * (C2_A + C2_S_N(i,1)) / 2*(mu_j(i,1) - (Landa_ij(i,1) + Landa_ij(i,6) + Landa_ij(i,11)))^2;
    W_4_2(i) = LandaJ(i,2) * (C2_A + C2_S_N(i,2)) / 2*(mu_j(i,2) - (Landa_ij(i,2) + Landa_ij(i,7) + Landa_ij(i,12)))^2;
    W_4_3(i) = LandaJ(i,3) * (C2_A + C2_S_N(i,3)) / 2*(mu_j(i,3) - (Landa_ij(i,3) + Landa_ij(i,8) + Landa_ij(i,13)))^2;
    W_4_4(i) = LandaJ(i,4) * (C2_A + C2_S_N(i,4)) / 2*(mu_j(i,4) - (Landa_ij(i,4) + Landa_ij(i,9) + Landa_ij(i,14)))^2;
    W_4_5(i) = LandaJ(i,5) * (C2_A + C2_S_N(i,5)) / 2*(mu_j(i,5) - (Landa_ij(i,5) + Landa_ij(i,10) + Landa_ij(i,15)))^2;
    W_4 = [W_4_1(i),W_4_2(i),W_4_3(i),W_4_4(i),W_4_5(i)];                          % :)

    W_5_1(i) = LandaJ(i,1) * (C2_A + C2_S_N(i,1)) / 2*(mu_j(i,1) - (Landa_ij(i,1) + Landa_ij(i,6) + Landa_ij(i,11) + Landa_ij(i,16)))^2;
    W_5_2(i) = LandaJ(i,2) * (C2_A + C2_S_N(i,2)) / 2*(mu_j(i,2) - (Landa_ij(i,2) + Landa_ij(i,7) + Landa_ij(i,12) + Landa_ij(i,17)))^2;
    W_5_3(i) = LandaJ(i,3) * (C2_A + C2_S_N(i,3)) / 2*(mu_j(i,3) - (Landa_ij(i,3) + Landa_ij(i,8) + Landa_ij(i,13) + Landa_ij(i,18)))^2;
    W_5_4(i) = LandaJ(i,4) * (C2_A + C2_S_N(i,4)) / 2*(mu_j(i,4) - (Landa_ij(i,4) + Landa_ij(i,9) + Landa_ij(i,14) + Landa_ij(i,19)))^2;
    W_5_5(i) = LandaJ(i,5) * (C2_A + C2_S_N(i,5)) / 2*(mu_j(i,5) - (Landa_ij(i,5) + Landa_ij(i,10)+ Landa_ij(i,15) + Landa_ij(i,20)))^2;
    W_5 = [W_5_1(i),W_5_2(i),W_5_3(i),W_5_4(i),W_5_5(i)];

    W(i,:) = [W_1  W_2  W_3  W_4  W_5];

    end

    W;

end
