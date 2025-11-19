function Z = MOP2(x)

    Z1 = L(x);
    Z2 = FIT(x);

    Z = [Z1 Z2]';