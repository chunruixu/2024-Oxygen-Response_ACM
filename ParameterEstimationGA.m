function [Pbest, y0New, Sbest]=ParameterEstimationGA(y0,y0List, stdv_y, param0, settingList, iter1, PopS, timeBegin,TimeOfRun)    
%% [Pbest, ~]=ParameterEstimationGA(y0,param, settingList, 100, 10, 50,150)   
%  settingList = ["normoxia","hypoxia"];
 %paramList = [1:24]; which param is tuned; stdv: see 'randomPar'
 global AMPKtot NAtot

 
LB = 0.1.*param0;
UB = 10.*param0;


function cost = FUNGA(param)
    try
    [cost, costStorage] = getCost(y0, param, timeBegin, TimeOfRun, settingList);
    catch
        cost = inf;
    end
end

options = optimoptions('ga','ConstraintTolerance',1e-6,'PlotFcn', @gaplotbestf,'InitialPopulation', param0,'MaxGenerations',iter1,'PopulationSize', PopS);


[newparam, fval] = ga(@FUNGA,length(param0),[],[],[],[],LB,UB,[],options)

Pbest = newparam; 
Sbest = fval;
%generate a new y0
if stdv_y ~= 0
[y0New] = randomPar(y0,y0List,stdv_y);
else
    y0New = y0;
end


datetim=datetime('now');
DateString = datestr(datetim);
DateString(DateString==':')='.';
%
foldername = 'Param_Collection';
% foldername = 'Param_Collection1';
filename=[foldername,'/',DateString, ' ','std_',num2str(stdv_y),' Svalue_', num2str(round(Sbest,4)),'.mat'];
save(filename,'Pbest','Sbest', 'y0', 'settingList')
% 
% save()
end