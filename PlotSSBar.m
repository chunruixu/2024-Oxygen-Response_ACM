% function [] = PlotSteadyState(yout1, yout2)
close all

% %normal ss
% Nss = yout1(end,:);
% %mutant ss
% Hss = yout2(end,:);
fontsize1 = 22; fontsize2 = 18;
load('NormalSS_509.mat');
% load('HypoSS_1_509.mat');
% HypoSS1 =HypoSS./NormalSS;
load('HypoSS_5_509.mat');
HypoSS5 =HypoSS./NormalSS;
load('HypoSS_10_509.mat');
HypoSS10 =HypoSS./NormalSS;
load('HypoSS_20_509.mat');
HypoSS20 =HypoSS./NormalSS;
load('HypoSS_50_509.mat');
HypoSS50 =HypoSS./NormalSS;
load('HyperSS_120_509.mat');
HyperSS120 =HyperSS./NormalSS;
load('HyperSS_150_509.mat');
HyperSS150 =HyperSS./NormalSS;
% load('HyperSS_180_509.mat');
% HyperSS180 =HyperSS./NormalSS;
load('HyperSS_200_509.mat');
HyperSS200 =HyperSS./NormalSS;
load('HyperSS_300_509.mat');
HyperSS300 =HyperSS./NormalSS;

% HypoData = [HypoSS50; HypoSS20; HypoSS10; HypoSS5];%; HypoSS1];
HypoData = [HypoSS20; HypoSS10; HypoSS5];%; HypoSS1];
HypopAMPKData = HypoData(:,2)';
HypoSIRT1Data = HypoData(:,14)';
HypoHIF1Data = HypoData(:,10)';
HypoNADRatioData = HypoData(:,12)./HypoData(:,13);  HypoNADRatioData=HypoNADRatioData';
HypoARatioData = HypoData(:,6)./(30-HypoData(:,6));  HypoARatioData=HypoARatioData';

HyperData = [HyperSS120; HyperSS150; HyperSS200;HyperSS300];
% HyperData = [HyperSS200; HyperSS150; HyperSS120];
HyperpAMPKData = HyperData(:,2)';
HyperSIRT1Data = HyperData(:,14)';
HyperHIF1Data = HyperData(:,10)';
HyperNADRatioData = HyperData(:,12)./HyperData(:,13);  HyperNADRatioData=HyperNADRatioData';
HyperARatioData = HyperData(:,6)./(30-HyperData(:,6));  HyperARatioData=HyperARatioData';

% [n m] = size(HypoData);

NormalData = zeros(1,4) + 1; NormalData = NormalData';

Y2 = [HypopAMPKData;HypoSIRT1Data;HypoHIF1Data;HypoNADRatioData];%;HypoARatioData];

Y1 =  [HyperpAMPKData;HyperSIRT1Data;HyperHIF1Data;HyperNADRatioData];
% Y = [Y1 NormalData Y2];
 Y = [NormalData Y2];
%   Y = [NormalData Y1];
% fold = 1, 0.5, 0.2, 0.1,0.05
figure()

% Y = [1 1 1 1 1; 0.777777778	0.9921875	0.833333333	1.4	0.666319082; 1.555555556	1.041666667	2	0.67	1.849843587;...
%     2.444444444	1.380208333	9.166666667	0.48	3.524504692;3.055555556	3.307291667	50	0.42	4.972888425]';
%柱状数据normalized; fold = 1, 1.5, 0.5, 0.2, 0.1

X=1:4;
h=bar(X,Y,1);%宽度1
% set(gca,'XTickLabel',{'pAMPK','free SIRT1', 'HIF1','NAD^{+}/NADH','AMP/ATP'},'FontSize',14,'FontName','Times New Roman');
 set(gca,'XTickLabel',{'pAMPK','free SIRT1', 'HIF1','$\frac{\mathrm{NAD}^{+}}{\mathrm{NADH}}$'},'TickLabelInterpreter','latex','FontSize',14,'FontName','Times New Roman');

 % set(h(1),'FaceColor',[1 1 1])
% set(h(2),'FaceColor',[0.75,0.75,0.75])
% set(h(3),'FaceColor',[0.5,0.5,0.5])
% set(h(4),'FaceColor',[0.25 0.25 0.25])
% set(h(5),'FaceColor',[0 0 0])

% set(h(1),'FaceColor',[0.5451 0.27059 0.07451])
% set(h(2),'FaceColor',[0.80392,0.52157,0.24706])
% set(h(3),'FaceColor',[0.82353 0.70588 0.549])
% set(h(4),'FaceColor',[1 1 1])
% set(h(5),'FaceColor',[0.52941,0.80784,0.98])
% set(h(6),'FaceColor',[0.38824,0.72,0.8])
% set(h(7),'FaceColor',[0.09412 0.4549 0.80392])
% set(h(8),'FaceColor',[0.06 0.3 0.5])

%%%%%%%%%%%%%%%YELLOW -
% set(h(1),'FaceColor',[1 1 1])
% set(h(2),'FaceColor',[0.82353 0.70588 0.549])
% set(h(3),'FaceColor',[0.80392,0.52157,0.24706])
% set(h(4),'FaceColor',[0.6451 0.37059 0.07451])
% set(h(5),'FaceColor',[0.5451 0.27059 0.07451])

set(h(1),'FaceColor',[1 1 1])
% set(h(2),'FaceColor',[0.52941,0.80784,0.98])
set(h(2),'FaceColor',[0.38824,0.72,0.8])
set(h(3),'FaceColor',[0.09412 0.4549 0.80392])
set(h(4),'FaceColor',[0.06 0.3 0.5])
% set(h(5),'FaceColor',[0 0 0])
% ylim([0,2]);
ylabel('Change Fold','FontSize',16);
% legend({'k_{input,O_{2}} fold = 1','k_{input,O_{2}} fold = 0.5','k_{input,O_{2}} fold = 0.2','k_{input,O_{2}} fold = 0.1','k_{input,O_{2}} fold = 0.05'},'FontSize',fontsize1)
% legend({'normal','38% decreased O_2','16% decreased O_2','11% decreased O_2','8% decreased O_2'},'FontSize',16,'Location','BestOutside')
legend({'','','','',''},'FontSize',16,'Location','BestOutside','box','off')

% legend({'fold = 2','fold = 1.5','fold = 1.2','fold = 1','fold = 0.5','fold = 0.2','fold = 0.1','fold = 0.05'},'FontSize',16,'Location','BestOutside')