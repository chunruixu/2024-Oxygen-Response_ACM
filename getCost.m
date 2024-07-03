% function cost = getCost(yout, tout, timeBegin, timeEnd, setting)
function [COST costStorage] = getCost(y0, param, timeBegin, timeEnd, settingList)
% function cost = getCost(y0, param, timeBegin, timeEnd, settingList)
% at normal condition - first step - ensure the system is relatively reasonable 
%O2 1-10%
 global Atot NAtot
param0 = param;
sim = length(settingList);%number of conditions considered
costStorage = zeros(sim,1);
for i=1:sim%%parfor
    setting = settingList(i);
    if strcmp(setting,'normoxia')  
        [tout, yout] = Sim(timeEnd,param0, y0);
        [AverageO2, ~, ~] = getAverage(yout(:, 1), tout, timeBegin, timeEnd);
        cost1 = (max(abs(AverageO2 - 7.75) - 7.25, 0))^2;
        [AverageNADRatio, ~, ~] = getAverage(yout(:,12)./yout(:,13), tout,timeBegin, timeEnd);
        [AverageSumNAD, ~, ~] = getAverage(yout(:,12)+yout(:,13), tout,timeBegin, timeEnd);
        cost3 = (min((AverageSumNAD/NAtot - 0.2), 0))^2;
        Atotyout = zeros(length(tout), 1) + Atot;
        ATP = Atotyout - yout(:,6);
        [AverageATPRatio, ~, ~] = getAverage(ATP./yout(:,6), tout,timeBegin, timeEnd);
         cost4 = (max(abs(AverageATPRatio - 10.5) - 9.5, 0))^2;
        [AverageHIF1a_AC, ~, ~] = getAverage(yout(:,8), tout,timeBegin, timeEnd);
        cost = (cost1/100 + cost2 + cost4+cost3)*10;  %normal 
    elseif strcmp(setting,'hypoxia1')
        [tout, yout] = Sim(timeEnd,param0, y0);
         y0 = yout(end,:);%run normal sim and get the y0 at steady-state
         [param] = getMutantParam(param0,'hypoxia1');
         [tout2, yout2] = Sim(timeEnd,param, y0);
        O2level1 = getAverage(yout(:,1), tout,timeBegin, tout(end));
        O2level2 = getAverage(yout2(:,1),tout2,0,tout2(end));
     cost7 = (max((abs((O2level2/O2level1)-0.075)-0.025),0))^2;%O2 decrease to 1/20~1/10; 1%~2%
     
     pAMPKsim = yout2(:,2); 
%         pAMPKfold = pAMPKsim(end)/pAMPKsim(1);
        pAMPKfold = pAMPKsim./pAMPKsim(1);%0905 - ref66
cost8 = (min((pAMPKfold(end)-2),0))^2;%more than 2fold %0428 
dppAMPK = [0 1; 2 1.5; 4 2;0 1; 2 1.5; 4 2; 12 3]; %REF66 -tuned by ref68%0428弱化最后一个点
        cost9 = findSquares2(tout2,pAMPKfold,dppAMPK);
%         cost13 = 300*findSquares(tout,pAMPKfold,dppAMPK);
   dpNAD = [0 1; 8 0.8; 16 0.5];%R106REF34  
  NAD =  yout2(:,12);
  cost10 = findSquares(tout2,NAD,dpNAD);
      
%HIF%    HIF1a = yout2(:,1)+yout2(:,2)
    HIF1a_AC = yout2(:,8);
% HIF1a_tot = yout2(:,7)+ yout2(:,8)+ yout2(:,9);
    dpHIF1a_AC = [0	 0.06; 4  1.85; 8  2.3];% 16  0.5];%ref108: 綜合幾個fig
    cost11 = findSquares(tout2,HIF1a_AC,dpHIF1a_AC);
% cost11 = findSquares(tout2,HIF1a_AC,dpHIF1a3);
    SIRT1 = yout2(:,14); %%%%%%%%%%%%%%%%加SIRT:NAM
      dpSIRT1 = [0 0.520; 2 0.754; 4 1.254; 8 0.932];
      cost12 = findSquares(tout2,SIRT1,dpSIRT1);   
%0615
 cost = (10*cost7 +10*cost8+2000*cost9 + cost10+  5*cost11+ 4*cost12)/2 ;%9:pAMPK; 11:HIF;12:SIRT

    end
    costStorage(i) = cost;
end
COST = sum(costStorage);
% cost = cost1 + cost2*1000 + cost4*1000;
% cost = cost4;

