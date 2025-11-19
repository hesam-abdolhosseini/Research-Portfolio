
function finalSD=Rs_d(x1,x2,x3,x4)            % calculate Rs_d for each source to each destination

global N;
M = sqrt(N);

W1 = zeros(M,M,25);
W2 = zeros(M,M,25);
W3 = zeros(M,M,25);

A = 0;                            % Flag
B = 0;                            % Flag
C = 0;                            % Flag
D = 0;
E = 0;
AA=0;
AA1 = 0;                            % Flag
AA2 = 0;                            % Flag
BB=0;
BB1 = 0;                            % Flag
BB2 = 0;

Dy = x3;                          % Destination Node (Di)
Dx = x4;                          % Destination Node (Dj)

Cy = x1;                          % Current Position i
Cx = x2;                          % Current Position j

%% for the first time (W 1-->j node Source)

if (Cx < Dx && A == 0)                         % mode 1 is OK
    W1(Cy,Cx,3) = 1;          % 1 --> 3
    Cx = Cx + 1;
    A=1;
end

if (Dx < Cx && A == 0)                         % mode 1 is OK
    W1(Cy,Cx,5) = 1;          % 1 --> 5
    Cx = Cx - 1;
    B=1;
end

if(Cx == Dx && A == 0 && B ==0)
    if Dy < Cy
        C = 1;
        W1(Cy,Cx,2) = 1;          % 1 --> 2
        Cy = Cy - 1;
    end

    if Cy < Dy
        D=1;
        W1(Cy,Cx,4) = 1;          % 1 --> 4
        Cy = Cy + 1;
    end

    if (Cy == Dy && A ==0 && B ==0 &&  C ==0 && D ==0 )
        E=1;
        W1(Cy,Cx,1) = 1;          % 1 --> 1
    end
end



%% Now ready for loop to Destination Node

if (Cx < Dx && A == 1)
    AA = 1;
    while Cx < Dx
        W2(Cy,Cx,23) = 1;   % 5 --> 3
        Cx = Cx + 1;
    end
end

if (Cx == Dx && A == 1)
    if Dy < Cy
        AA1=1;
        W2(Cy,Cx,22) = 1;   % 5 --> 2
        Cy = Cy - 1;
    end
    while Dy < Cy
        W2(Cy,Cx,17) = 1;   % 4 --> 2
        Cy = Cy - 1;
    end

    if Cy < Dy
        AA2=1;
        W2(Cy,Cx,24) = 1;   % 5 --> 4
        Cy = Cy + 1;
    end
    while Cy < Dy
        W2(Cy,Cx,9) = 1;   % 2 --> 4
        Cy = Cy + 1;
    end
end
%%
if (Dx < Cx && B == 1)
    BB = 1;
    while Dx < Cx
        W2(Cy,Cx,15) = 1;   % 3 --> 5
        Cx = Cx - 1;
    end
end
if (Cx == Dx &&  B==1)
    if Dy < Cy
        BB1=1;
        W2(Cy,Cx,12) = 1;   % 3 --> 2
        Cy = Cy - 1;
    end
    while Dy < Cy
        W2(Cy,Cx,17) = 1;   % 4 --> 2
        Cy = Cy - 1;
    end

    if Cy < Dy
        BB2=1;
        W2(Cy,Cx,14) = 1;   % 3 --> 4
        Cy = Cy + 1;
    end
    while Cy < Dy
        W2(Cy,Cx,9) = 1;   % 2 --> 4
        Cy = Cy + 1;
    end
end
%%
if (C == 1)
    while Dy < Cy
        W2(Cy,Cx,17) = 1;   % 4 --> 2
        Cy = Cy - 1;
    end
end
if (D == 1)
    while Cy < Dy
        W2(Cy,Cx,9) = 1;   % 2 --> 4
        Cy = Cy + 1;
    end
end

%% at the end (W j-->1 node Destination)

if ( A==1 && AA1==0 && AA2==0 && Cx==Dx)
    W3(Cy,Cx,21) = 1;   % 5 --> 1
end

if (B==1 && BB1==0 && BB2==0 && Cx==Dx )
    W3(Cy,Cx,11) = 1;   % 3 --> 1
end
%%
if (AA1==1 && B==0 && C==0 && E==0 && Cy==Dy)
    W3(Cy,Cx,16) = 1;   % 4 --> 1
end
if (BB1==1 && A==0 && C==0 && E==0 && Cy==Dy)
    W3(Cy,Cx,16) = 1;   % 4 --> 1
end
if (A==0 && B==0 && C==1 && Cy==Dy)
    W3(Cy,Cx,16) = 1;   % 4 --> 1
end
%%
if (AA2==1 && B==0 && C==0 && E==0 && Cy==Dy)
    W3(Cy,Cx,6) = 1;   % 2 --> 1
end
if (BB2==1 && A==0 && C==0 && E==0 && Cy==Dy)
    W3(Cy,Cx,6) = 1;   % 2 --> 1
end
if (A==0 && B==0 && D==1 && Cy==Dy)
    W3(Cy,Cx,6) = 1;   % 2 --> 1
end

wait = W1 + W2 + W3;
wait = reshape(wait,[N,25]);
xx=1;
b=zeros(N,25);
for i=1:M
    for j=1:M
        b(xx,:) = wait((i+M*j-M),:);
        xx=xx+1;
    end
end
finalSD = b;
end

