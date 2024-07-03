%AMPK activator and inhibitor

x = [0.000983328 0.00104456 0.00112157 0.00127811 0.001745 0.00251366];%AMPK levels by varying kphos_ampk_basal
x = [0.876742424 0.931337322 1 1.139572207 1.555854739 2.241197607];%AMPK CF

HIF1 = [0.00323489 0.00302683 0.00282837 0.00256618 0.00229489 0.00239978];%HIF-1  -0.7738
SIRT1_free = [0.476996 0.459003 0.441851 0.419183 0.395729 0.404797];%free SIRT1  --0.7738
NADratio =[0.0118136 0.0132493 0.0149084 0.0177349 0.0226236 0.0240724];% 0.9230


fontsize1 = 22; fontsize2 = 18;
figure()
 set(gca,'FontName','Times New Roman','FontSize',fontsize2);
 colororder({'[0.09412 0.4549 0.80392]','[0.55 0.27 0.07]'})
   yyaxis left
scatter(x,HIF1,100,'k','filled')
hold on;
line(x,HIF1, 'Color', [0.09412 0.4549 0.80392], 'LineWidth', 2, 'Linestyle', '--');
hold on;
% ylim([2e-3 2.8e-3]);
ylabel('free HIF-1 level','fontsize',fontsize1);% ylabel('pAMPK fold','fontsize',fontsize1);
 yyaxis right
scatter(x,SIRT1_free,100,'k','filled')
hold on;
line(x,SIRT1_free, 'Color', [0.55 0.27 0.07], 'LineWidth', 2, 'Linestyle', '--');
% ylim([0.36 0.45]);
hold off;
ylabel('free SIRT1 level','fontsize',fontsize1);% ylabel('pAMPK fold','fontsize',fontsize1);
 xlabel('pAMPK Change Fold','fontsize',fontsize1);% ylabel('pAMPK fold','fontsize',fontsize1);
 xlim([0.6 2.5]);   
box on;



figure()
set(gca,'FontName','Times New Roman','FontSize',fontsize2);
scatter(x,NADratio,100,'k','filled')
hold on;
line(x,NADratio, 'Color', [0.09412 0.4549 0.80392], 'LineWidth', 2, 'Linestyle', '--');
% ylim([0.36 0.45]);
hold off;
ylabel('NAD^{+}/NADH','fontsize',fontsize1,'Color', [0.09412 0.4549 0.80392]);% ylabel('pAMPK fold','fontsize',fontsize1);
 xlabel('pAMPK Change Fold','fontsize',fontsize1);% ylabel('pAMPK fold','fontsize',fontsize1);
%  xlim([0.6 2.5]);   
box on;

