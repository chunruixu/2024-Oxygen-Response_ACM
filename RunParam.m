clear
%multiple rounds of parameter search
max_run_time = 5*3600; %set the maximum time (s)
%input an intial set of parameters

load('Param_Collection/01-Jul-2024 21.29.04 std_0 Svalue_509.1516.mat')


param0 = Pbest;
load('y0-509.mat')
y0 = ans;

y0List = [1:14]; %
%determine conditions you want to consider in parameter estimation
settingList = ["normoxia","hypoxia1"];

timeBegin = 700; timeEnd = 1000;%to check normal condition
[cost, costStorage] = getCost(y0, param0, timeBegin, timeEnd, settingList);%compute the cost for the initial parameters



for i=1:5
    tic %record time
%genetic algorithm
    [Pbest, y0New, Sbest]=ParameterEstimationGA(y0, y0List, 0, param0, settingList, 100, 50, timeBegin,timeEnd) ;%maxG, pSize
    %keep y0New as the new intial values for the next round of
    %parameterizatioin if the cost is less/equal to a threshold
    if Sbest<=cost%*1.05 
        y0 = y0New; param0 = Pbest; cost = Sbest;
    end
    toc%check time
    if toc > max_run_time 
        error("Time Out !!!"); 
    end 
    
end
