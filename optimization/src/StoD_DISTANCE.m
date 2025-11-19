
function DIST = StoD_DISTANCE

global N;
M = sqrt(N);

node = 1;
W = zeros(N,5);
for i=1:M
    for j=1:M
        zz=1;
        for k=1:M
            for l=1:M

                W1 = zeros(N,5);
                Dy = k;                          % Destination Node (Di)
                Dx = l;                          % Destination Node (Dj)

                Cy = i;                          % Current Position i
                Cx = j;                          % Current Position j

                DISX = 0;                         % Current Node DISTANCE from Destination
                DISY = 0;
                %%
                if (Dx > Cx && Dy == Cy)            % node source va destination dar yek SATR bashand
                    while Dx > Cx
                        DISX = DISX + 1;
                        Cx = Cx + 1;
                    end
                    % output port is 3
                    W(node,3)=DISX;
                end

                if  (Dx < Cx && Dy == Cy)
                    while Dx < Cx
                        DISX = DISX + 1;
                        Cx = Cx - 1;
                    end
                    % output port is 5
                    W(node,5)=DISX;
                end
                %%
                if (Dx == Cx && Cy > Dy)               % node source va destination dar yek SOTOON bashand
                    while Cy > Dy
                        DISY = DISY + 1;
                        Cy = Cy - 1;
                    end
                    % output port is 2
                    W(node,2)=DISY;
                end

                if (Dx == Cx && Cy < Dy)
                    while Cy < Dy
                        DISY = DISY + 1;
                        Cy = Cy + 1;
                    end
                    % output port is 4
                    W(node,4)=DISY;
                end
                %%
                if (Dx == Cx && Dy == Cy)               % node source va destination barabar bashand
                    % output port is 1
                    W(node,1)=0;
                end
                %%
                if (Cx < Dx && Dy ~= Cy)               % node source va destination dar yek SATR va SOTOON NAbashand
                    while Cx < Dx
                        DISX = DISX + 1;
                        Cx = Cx + 1;
                    end
                    while Dy < Cy
                        DISY = DISY + 1;
                        Cy = Cy - 1;
                    end
                    while Cy < Dy
                        DISY = DISY + 1;
                        Cy = Cy + 1;
                    end
                    W(node,3)=DISX + DISY;
                    % output port is 3
                end

                if (Dx < Cx && Dy ~= Cy)
                    while Dx < Cx
                        DISX = DISX + 1;
                        Cx = Cx - 1;
                    end
                    while Cy > Dy
                        DISY = DISY + 1;
                        Cy = Cy - 1;
                    end
                    while Cy < Dy
                        DISY = DISY + 1;
                        Cy = Cy + 1;
                    end
                    W(node,5)=DISX + DISY;
                    % output port is 5
                end
                iter(zz,:)=W(node,:);
                zz=zz+1;
            end
        end
        WW(node,:) = max(iter);
        node = node +1;
    end
end
DIST = WW;
end
