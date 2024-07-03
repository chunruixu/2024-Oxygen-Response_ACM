main.m:  run it and you will get the simulation results of normoxic and hypoxic temporal plots

getParam.m and getMutantParam.m: load parameters for normal or specific situations (like hypoxia, AMPK activator)

Sim.m: get simulation results; input simulation time, parameters and initial values of variables; out time course simulated results

ODE_ROSAMPK.m: ordinary differential equations

PlotResult.m: plot results

findSquares.m: scale the experimental data to the simulated results, so that we can compare these together



%%%%%%%%%%%%%%%%Parameter Estimation%%%%%%%%%%%%%%%%%
RunParam.m: a main file for parameterization
getCost.m: compute cost
ParameterEstimationGA.m: use the genetic algorithm to get a new set of parameters