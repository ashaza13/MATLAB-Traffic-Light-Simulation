addpath(fullfile(matlabroot, 'toolbox', 'driving', 'drivingdemos'));
helperDrivingProjectSetup('TrafficLightNegotiation.zip', 'workDir', pwd);

hFigScenario = figure('Position', [1 1 800 600]);
plot(scenario, 'Parent', axes(hFigScenario));