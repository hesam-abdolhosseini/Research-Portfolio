function S_A = SA

    Arbiter_4_1 = 7.4;                    % FIT of Each 20:1 Arbiter
    Number_Arbiter_4_1 = 10;               % Number of 20:1 Arbiter

    Arbiter_5_1 = 9.3;                      % FIT of Each 20:1 Arbiter
    Number_Arbiter_5_1 = 10;               % Number of 20:1 Arbiter

    Mux_4_1 = 4.8;
    Number_Mux_4_1 = 10;

    S_A = (Arbiter_4_1 * Number_Arbiter_4_1) + (Arbiter_5_1 * Number_Arbiter_5_1) + (Mux_4_1 * Number_Mux_4_1);

end