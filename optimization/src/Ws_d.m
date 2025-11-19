
function wait = Ws_d(x)               % calculate W_ij_N for each source to each destination

global N;
M = sqrt(N);



W_ij = W_ij_N(x);               % Nx25

nodesource = 1;
nodeM=1;
for i=1:M
    for j=1:M
        Destination=1;
        for k=1:M
            for l=1:M
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

                W1 = zeros(M,M,25);
                W2 = zeros(M,M,25);
                W3 = zeros(M,M,25);

                Dy = k;                          % Destination Node (Di)
                Dx = l;                          % Destination Node (Dj)

                Cy = i;                          % Current Position i
                Cx = j;                          % Current Position j

                %% for the first time (W 1-->j node Source)

                if (Cx < Dx && A == 0)
                    W1(Cy,Cx,3) = W_ij(nodesource,3);          % 1 --> 3
                    Cx = Cx + 1;
                    A=1;
                    nodeM = nodeM +1;
                end

                if (Dx < Cx && A == 0)                         % mode 1 is OK
                    W1(Cy,Cx,5) = W_ij(nodesource,5);          % 1 --> 5
                    Cx = Cx - 1;
                    B=1;
                    nodeM = nodeM -1;
                end

                if(Cx == Dx && A == 0 && B ==0)
                    if Dy < Cy
                        C = 1;
                        W1(Cy,Cx,2) = W_ij(nodesource,2);      % 1 --> 2
                        Cy = Cy - 1;
                        nodeM = nodeM - M;
                    end
                    if Cy < Dy
                        D=1;
                        W1(Cy,Cx,4) = W_ij(nodesource,4);      % 1 --> 4
                        Cy = Cy + 1;
                        nodeM = nodeM + M;
                    end
                    if (Cy == Dy && A ==0 && B ==0 &&  C ==0 && D ==0)
                        E=1;
                        W1(Cy,Cx,1) = W_ij(nodesource,1);      % 1 --> 1
                    end
                end

                %% Now ready for loop to Destination Node

                if (Cx < Dx && A == 1 && nodeM < 10)
                    AA = 1;
                    while Cx < Dx
                        W2(Cy,Cx,23) = W_ij(nodeM,23);   % 5 --> 3
                        Cx = Cx + 1;
                        nodeM = nodeM +1;
                    end
                end

                if (Cx == Dx && AA == 1 && nodeM < 10)
                    if Dy < Cy
                        AA1=1;
                        W2(Cy,Cx,22) = W_ij(nodeM,22);   % 5 --> 2
                        Cy = Cy - 1;
                        nodeM = nodeM - M;
                    end
                    while Dy < Cy
                        W2(Cy,Cx,17) = W_ij(nodeM,17);   % 4 --> 2
                        Cy = Cy - 1;
                        nodeM = nodeM - M;
                    end

                    if (Cy < Dy && nodeM < 10)
                        AA2=1;
                        W2(Cy,Cx,24) = W_ij(nodeM,24);   % 5 --> 4
                        Cy = Cy + 1;
                        nodeM = nodeM + M;
                    end
                    while (Cy < Dy && nodeM < 10)
                        W2(Cy,Cx,9) = W_ij(nodeM,9);   % 2 --> 4
                        Cy = Cy + 1;
                        nodeM = nodeM + M;
                    end
                end
%%
                if (Dx < Cx && B == 1 && nodeM < 10)
                    BB = 1;
                    while Dx < Cx
                        W2(Cy,Cx,15) = W_ij(nodeM,15);   % 3 --> 5
                        Cx = Cx - 1;
                        nodeM = nodeM - 1;
                    end
                end

                if (Cx == Dx && BB == 1 && nodeM < 10)
                    if Dy < Cy
                        BB1=1;
                        W2(Cy,Cx,12) = W_ij(nodeM,12);   % 3 --> 2
                        Cy = Cy - 1;
                        nodeM = nodeM - M;
                    end
                    while Dy < Cy
                        W2(Cy,Cx,17) = W_ij(nodeM,17);   % 4 --> 2
                        Cy = Cy - 1;
                        nodeM = nodeM - M;
                    end
                    if Cy < Dy
                        BB2 = 1;
                        W2(Cy,Cx,14) = W_ij(nodeM,14);   % 3 --> 4
                        Cy = Cy + 1;
                        nodeM = nodeM +M;
                    end
                    while Cy < Dy
                        W2(Cy,Cx,9) = W_ij(nodeM,9);   % 2 --> 4
                        Cy = Cy + 1;
                        nodeM = nodeM +M;
                    end
                end
%%
                if (C == 1 && nodeM < 10)
                    while Dy < Cy
                        W2(Cy,Cx,17) = W_ij(nodeM,17);   % 4 --> 2
                        Cy = Cy - 1;
                        nodeM = nodeM - M;
                    end
                end
                if (D == 1 && nodeM < 10)
                    while Cy < Dy
                        W2(Cy,Cx,9) = W_ij(nodeM,9);   % 2 --> 4
                        Cy = Cy + 1;
                        nodeM = nodeM + M;
                    end
                end

                %% at the end (W j-->1 node Destination)

                if ( A==1 && AA1==0 && AA2==0 && Cx==Dx)
                    W3(Cy,Cx,21) = W_ij(Destination,21);   % 5 --> 1
                end
                if (B==1 && BB1==0 && BB2==0 && Cx==Dx)
                    W3(Cy,Cx,11) = W_ij(Destination,11);   % 3 --> 1
                end
                %%
                if (AA1==1 && B==0 && C==0 && E==0 && Cy==Dy)
                    W3(Cy,Cx,16) = W_ij(Destination,16);   % 4 --> 1
                end
                if (BB1==1 && A==0 && C==0 && E==0 && Cy==Dy)
                    W3(Cy,Cx,16) = W_ij(Destination,16);   % 4 --> 1
                end
                if (A==0 && B==0 && C==1 && Cy==Dy)
                    W3(Cy,Cx,16) = W_ij(Destination,16);   % 4 --> 1
                end
                %%
                if (AA2==1 && B==0 && C==0 && E==0 && Cy==Dy)
                    W3(Cy,Cx,6) = W_ij(Destination,6);   % 2 --> 1
                end
                if (BB2==1 && A==0 && C==0 && E==0 && Cy==Dy)
                    W3(Cy,Cx,6) = W_ij(Destination,6);   % 2 --> 1
                end
                if (A==0 && B==0 && D==1 && Cy==Dy)
                    W3(Cy,Cx,6) = W_ij(Destination,6);   % 2 --> 1
                end

                W = W1 + W2 + W3;
                W = sum(W,3);           % 3D to 2D
                W = sum(W(:));
                wait(nodesource,Destination) = W;
                Destination=Destination+1;
            end
        end
        nodesource = nodesource + 1;
        nodeM = nodeM + 1;
    end
end
wait;
end

