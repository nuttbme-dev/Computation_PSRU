%% MATLAB Fluid Mechanics Lab: Linear Regression Tutorial
clear; clc; close all;

%% =====================================================================
%% Step 1: Theoretical Laminar Flow (No Noise)
%% =====================================================================
% 1. Physical Parameters
mu = 0.001;        % Viscosity of fluid (Water at 20C, Pa*s)
L = 10;            % Physical length of pipe (meters)
P_charge = 500;    % System baseline charge pressure (Pascals)
D = 0.010;         % Pipe diameter (10mm converted to meters)

% 2. Independent Variable (Fluid Velocity vector)
v = linspace(0.1, 1.5, 40)'; 

% 3. Calculate Theoretical Slope (m) and Pressure Drop (y = mx + c)
% Using the Hagen-Poiseuille equation framework
m_theoretical = (32 * mu * L) / (D^2);
dP_theoretical = m_theoretical * v + P_charge;

% 4. Simple Visual Plot
figure('Name', 'Step 1: Clean Physics');
plot(v, dP_theoretical, 'b-', 'LineWidth', 2);
xlabel('Velocity (m/s)');
ylabel('Pressure Drop (Pa)');
title('Ideal Theoretical Pressure Drop (Perfect World)');
grid on;


%% =====================================================================
%% Step 2: Simulating High-Noise Lab Data (Extreme Variance)
%% =====================================================================
% 1. Inject heavy numerical noise (Increased multiplier to 120 for clear contrast)
heavy_noise = 120 * randn(size(v));

% 2. Add this extreme noise to our perfect theoretical line
dP_experimental_noisy = dP_theoretical + heavy_noise;

% 3. Plot the ideal line against the heavily scattered data
figure('Name', 'Step 2: Adding Sensor Noise');
plot(v, dP_theoretical, 'b-', 'LineWidth', 2.5); % The clean ideal line
hold on;
scatter(v, dP_experimental_noisy, 50, 'ro', 'filled'); % Messy data points

% Formatting
xlabel('Velocity, v (m/s)');
ylabel('Pressure Drop, \DeltaP (Pa)');
title('Ideal Physics Line vs. High-Noise Experimental Data');
legend('Perfect Theory (Clean)', 'Real-World Data (Heavy Noise)', 'Location', 'NorthWest');
grid on;


%% =====================================================================
%% Step 3: Finding the Best-Fit Line (Linear Regression & Prediction)
%% =====================================================================
% 1. Use polyfit to extract the slope (m) and intercept (c) from the NOISY data
% (Takes the x-vector, y-vector, and polynomial degree 1 for a straight line)
coefficients = polyfit(v, dP_experimental_noisy, 1);
m_regressed = coefficients(1);
c_regressed = coefficients(2);

% 2. Calculate Predicted values using the explicit linear equation: y = m*x + c
% This shows students the raw math behind engineering predictions
dP_predicted_equation = m_regressed * v + c_regressed; 

% 3. Plot the final comparison
figure('Name', 'Step 3: Linear Regression Curve Fit');
scatter(v, dP_experimental_noisy, 50, 'ro', 'filled'); % Raw lab points
hold on;
plot(v, dP_theoretical, 'b--', 'LineWidth', 2);         % True physical law
plot(v, dP_predicted_equation, 'k-', 'LineWidth', 2.5); % Calculated best fit line

% Formatting
xlabel('Velocity (m/s)');
ylabel('Pressure Drop (Pa)');
title('Calculated Linear Regression vs. Truth');
legend('Heavy Noise Data Points', 'True Theoretical Line', 'Predicted Line (y = mx + c)', 'Location', 'NorthWest');
grid on;

% 4. Print comparative equations and values directly to the command window
fprintf('\n=================== LAB STUDY REGRESSION RESULTS ===================\n');
fprintf('Theoretical Law Equation:   dP = %.2f * v + %.2f\n', m_theoretical, P_charge);
fprintf('PREDICTED Model Equation:   dP = %.2f * v + %.2f\n', m_regressed, c_regressed);
fprintf('--------------------------------------------------------------------\n');
fprintf('Theoretical Slope: %.2f  |  Predicted Slope: %.2f\n', m_theoretical, m_regressed);
fprintf('Target Intercept:  %.2f  |  Predicted Intercept: %.2f\n', P_charge, c_regressed);
fprintf('====================================================================\n');