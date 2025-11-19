
function S_i = S_i_M2(x)        %clk

global N;
M = sqrt(N);
global m;

x = reshape(x,[5,N]);               % N node ra zire ham gharar dadam ke shode yek matris N*5
x = x';

input_buffer = x;

SO = StoD_DISTANCE;                 % sort all ports maximum distance from all destinations
MAX = max(max(SO));

ts = 1;
tr = 1;
tw = 1;
W = MAX/2 * ones(N,25);
Lb = (m-1)*(ts + tw);

P = P_jk_N;
S1 = zeros(N,5);

%%                               % Output Channel 0
for i=1:N                        % Node raw
S1(i,1) =P(i,1)*(ts+tr+Lb)^2;
end
S = S1;

%%                               % Output Channel k=1;
for PORTS=1:5
for i=1:N
    for j=1:5
        if SO(i,j)==PORTS                   % for all nodes with index 1
            if j==2
                GoalNode = i-M;         % next node
                NextNode_inputPort = 4;
            end
            if j==3
                GoalNode = i+1;         % next node
                NextNode_inputPort = 5;
            end
            if j==4
                GoalNode = i+M;         % next node
                NextNode_inputPort = 2;
            end
            if j==5
                GoalNode = i-1;         % next node
                NextNode_inputPort = 3;
            end
            
            for k=1:5
                FirstAnswer(1,k) = P(GoalNode,(NextNode_inputPort-1)*5 + k)*(ts+tw+tr + W(GoalNode,(NextNode_inputPort-1)*5 + k) ...
                        + S(GoalNode,k) - input_buffer(GoalNode,NextNode_inputPort)*(ts+tw))^2;
            end
            S(i,j) = sum(FirstAnswer) ;
        end
    end
end
end
S_i = S;
end

