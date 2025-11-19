clc;
clear;
close all;

%% Problem Definition

global N;
N = 16;                         % Number of Cores 

global m;
m = 4;                         % Packet Size

global MU_J;
MU_J = 0.1;                    % Average Service Rate of OC

global u;
u = m;                         % buffer_size upper bound in flits

global FS;
FS = 128;                           % Size of Flit

global C2_A;
C2_A = 1; 

CostFunction= @(x) MOP2(x);         % Cost Functuon
nVar = N * 5;                       % number of decision variables
VarSize = [1 nVar];                 % Chromosomes Shape

nObj = numel(CostFunction(randsample(nVar,nVar)));      % Number of Objective Functions

%% NSGA-II Parameters

MaxIt = 1000;                        % maximum number of iterations
nPop = 30;                          % Population size

pc = 0.8;                           % crossover percentage
nc = 2*round(pc*nPop/2);            % number of offsprings

pm = 0.3;                           % mutation percentage
nm = round(pm*nPop);                % number of mutants

mu=0.3;         % Mutation Rate

%% Initialization

empty_individual.position = [];
empty_individual.cost = [];
empty_individual.Rank=[];
empty_individual.DominationSet=[];
empty_individual.DominatedCount=[];
empty_individual.CrowdingDistance=[];

pop = repmat(empty_individual,nPop,1);

for i=1:nPop
    % Initialing the positions
    pop(i).position = randi([0 u],VarSize);     % buffer_size in flits

    % Evaluation
    pop(i).cost = CostFunction(pop(i).position);
end

% Non-Dominated Sorting
[pop F]=NonDominatedSorting(pop);

% Calculate Crowding Distance
pop=CalcCrowdingDistance(pop,F);

% Sort Population
[pop F]=SortPopulation(pop);

%% Main Loop

for it=1:MaxIt

    % corssover
    popc = repmat(empty_individual,nc/2,2);

    for k=1:nc/2
        %select first parent
        i1 = randi([1 nPop]);
        P1 = pop(i1);

        %select second parent
        i2 = randi([1 nPop]);
        P2 = pop(i2);

        % Apply crossover
        % popc(k,1) -----> first child from kth crossover
        % popc(k,2) -----> second child from kth crossover
        [popc(k,1).position, popc(k,2).position] = Crossover(P1.position,P2.position);
        
         % Evaluation
         popc(k,1).cost = CostFunction(popc(k,1).position);      
         popc(k,2).cost = CostFunction(popc(k,2).position);      
    end    
    popc = popc(:);
    
    % Mutation
    popm = repmat(empty_individual,nm,1);
    for k=1:nm

        %select parent
        i = randi([1 nPop]);
        p = pop(i);

        % Apply Mutation
        popm(k).position = Mutate(p.position,mu);

        % Evaluate Mutant
        popm(k).cost = CostFunction (popm(k).position);
    end

    % Merge All Populatin
    pop = [pop
           popc
           popm];

        % Non-Dominated Sorting
    [pop F]=NonDominatedSorting(pop);
    
    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);
    
    % Sort Population
    [pop F]=SortPopulation(pop);

    % Truncation
    pop = pop(1:nPop);

    % Non-Dominated Sorting
    [pop F]=NonDominatedSorting(pop);
    
    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);
    
    % Sort Population
    [pop F]=SortPopulation(pop);

    % Store F1
    F1=pop(F{1});
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);

    % Plot F1 Costs
    figure(1);
    PlotCosts(F1);

end

%% Rwsults
