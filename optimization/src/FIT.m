
function F_I_T = FIT(x)

    RC_ = RC;
    VA_ = 0;
    SA_ = 0;
    XB_ = XB;
    IB_ = Input_Buffer(x);
    
    F_I_T = RC_ + VA_ + SA_ + XB_ + IB_ ;

end