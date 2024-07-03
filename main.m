clear all %clear temporary variables
close all ;%close all open figures
global Atot NAtot AMPKtot 
%set global variables for [ATP+ADP], [NAD+NADH+NAM+SIRT1:NAM], and [AMPK+pAMPK]
Atot = 30;
NAtot = 2*2;
AMPKtot = 0.1;
%load initial values for each variable and load parameters
load('Param_Collection/01-Jul-2024 21.29.04 std_0 Svalue_509.1516.mat')
param = Pbest; 
load('y0-509.mat')
y0 = ans;

%% sim at different stages

TimeOfRun_norm = 24;%time of simulation of normoxia
TimeOfRun_hyp = 72;%time of simulation of hypoxia/hyperoxia/highpAMPK
y0_1 = y0; %the initial condition of normal situation
[tout1, yout1] = Sim(TimeOfRun_norm,param, y0_1); %simulation of normal situation
y0_2 = yout1(end,:); %the initial condition of hypoxic situation or others
%% switch different settings - hypoxia or hyperoxia
mutant = 'hypoxia1';%'HighpAMPK1';
% mutant = 'hyperoxia1';%
% mutant = 'HighpAMPK1';
[param] = getMutantParam(param,mutant);
[tout2, yout2] = Sim(TimeOfRun_hyp,param, y0_2);
 yout = [yout1(1:(end-1),:); yout2];
 tout = [tout1(1:(end-1)); tout2+TimeOfRun_norm];

if strcmp(mutant,'hypoxia1')
 PlotResult2(tout, yout, 0, TimeOfRun_norm+TimeOfRun_hyp, mutant, TimeOfRun_norm, TimeOfRun_norm+50)%timecourese %lvl, lvltime1, lvltime2  'hypoxia1'
end

if strcmp(mutant,'hyperoxia1')
 PlotResult3(tout, yout, 0, TimeOfRun_norm+TimeOfRun_hyp, mutant, TimeOfRun_norm, TimeOfRun_norm+50)%timecourese %lvl, lvltime1, lvltime2  'hypoxia1'
end

