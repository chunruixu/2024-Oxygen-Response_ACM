
function [tout, yout] = Sim(TimeOfRun,param, y0) %input simulation time, parameters and y0
%initial condition
if isempty(y0)
    y0 = [2  1  0.5  0.5  3  1500  2  1  1  1  2  1500 0.5  1];
%initial conditions for O2 pAMPK ROS SCAV deltaH AMP HIF1a_free HIF1a_AC HIF1a_OH HIF1 NAM NAD NADH SIRT1 
end

if isempty(param)
    [param] = getParam(1);
end

tspan = [0 TimeOfRun];
tstart = tspan(1);
tfinal = tspan(2);

[tout, yout] = ode15s(@(t,y) ODE_ROSAMPK(t,y,param), [tstart tfinal], y0);
