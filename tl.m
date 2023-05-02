addpath(genpath(fullfile(matlabroot,'toolbox','driving')));

scenario = drivingScenario;
roadCenters = [0 0; 50 0; 100 0];
roadWidth = 3;
road(scenario, roadCenters, 'Lanes', lanespec(1));

lightPos = [50 0 0];
lightColor = [1 0 0; 0 1 0]; % Red and green lights
lightTiming = [5 2]; % Red for 5 seconds, green for 2 seconds
trafficLight(scenario, lightPos, 'Color', lightColor, 'Timing', lightTiming);

car = vehicle(scenario, 'ClassID', 1);
pos = [0 0 0];
vel = 10;
path(car, pos, 'Smoothness', 0);
velocity(car, vel);

driver = drivingPolicy(car, 'SpeedControl', true, 'MinimumDistance', 2);
driver.Behavior = 'stopAtRedLight';
driver.StopLine = [50 1.5 0];
driver.TargetSpeed = 10;

tspan = 0:0.1:20;
sim(scenario, tspan);

