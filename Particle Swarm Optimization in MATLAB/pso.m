clc;
clear;
close all;

%% Problem Definition
CostFunction = @(x) f2(x);
nVar = 2;
VarSize = [1 nVar];
VarMin = -10;
VarMax = 10;

%% Parameters of PSO
MaxIt = 1000;
nPop = 50;

w = 1;
wdamp = .99;

c1 = 2;
c2 = 2;

%% Init
empty_particle.Position = [];
empty_particle.Velocity = [];
empty_particle.Cost = [];
empty_particle.Best.Position = [];
empty_particle.Best.Cost = [];

particle = repmat(empty_particle, nPop, 1);

GlobalBest.Cost = inf;

for i = 1:nPop
    particle(i).Position = unifrnd(VarMin, VarMax, VarSize);
    particle(i).Cost = CostFunction(particle(i).Position);
    particle(i).Velocity = zeros(VarSize);
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;
    
    if particle(i).Best.Cost < GlobalBest.Cost
        GlobalBest = particle(i).Best;
    end
end

BestCosts = zeros(MaxIt, 1);

%% Main loop
for it = 1:MaxIt
    for i = 1:nPop
        r1 = rand(VarSize);
        r2 = rand(VarSize);
        particle(i).Velocity = w * particle(i).Velocity + c1 * r1 .* (particle(i).Best.Position - particle(i).Position) + c2 * r2 .* (GlobalBest.Position - particle(i).Position);
        
        particle(i).Position = particle(i).Position + particle(i).Velocity; 
        
        particle(i).Cost = CostFunction(particle(i).Position);
        
        if particle(i).Cost < particle(i).Best.Cost
            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;
            
            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
            end
            
        end
    end
    
    %Store best cost value
    BestCosts(it) = GlobalBest.Cost;
    
    disp(['Iteration ' num2str(it) ' : Best Cost = ' num2str(BestCosts(it))]);
    
    %Damping
    w = w * wdamp;
end
%% Results
figure;
semilogy(BestCosts, 'LineWidth', 2);
xlabel('Iterations');
ylabel('BestCost');
title('convergence plot');
grid on;