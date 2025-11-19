function R_C = RC

    N_P = 5;                                % Number of Port in Each Router

    % FC = 6-bit comparator;                % Fundamental Component

    Number_of_FC = N_P * 2;                 % Number of Fundamental Component
    
    FIT_of_FC = 11.7;                       % FIT of Each FC

    R_C = FIT_of_FC * Number_of_FC;

end