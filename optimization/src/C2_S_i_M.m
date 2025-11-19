function C2 = C2_S_i_M(x)

    global N;

    CC2 = S_i_M2(x) ./ (S_i_M(x)).^2;
    CC2 = CC2 -1;

    for i=1:N
        for j=1:5
            if isnan(CC2(i,j))
                CC2(i,j)=0;
            end
        end
    end

    C2 = CC2;

end