function I_P = Input_Buffer(x)

    global FS;

    Number_Ports = 5;                   % Number of Ports
    Number_VC = 1;                      % Number of VC per each Port
    Number_Flits = sum(x);              % Number of Flits for All Buffers in NoC
    Flit_Size = FS ;                    % Size of Flit

    DFF_FIT = 0.5;             % Fit for each DFF

    I_P = Number_Ports * Number_VC * Number_Flits * Flit_Size * DFF_FIT;

end