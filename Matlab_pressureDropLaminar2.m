%% MATLAB Regression Analysis: Laminar Pipe Flow with Charge Pressure
clear; clc; close all;

fprintf('===============================================================\n');
fprintf('    FLUID MECHANICS LINEAR REGRESSION ANALYSIS INTERPRETATION   \n');
fprintf('===============================================================\n\n');

%% 1. Define Constant Parameters
mu = 0.001;        % Dynamic viscosity of fluid (Water at 20C, Pa*s)
L = 10;            % Physical length of pipe (meters)
P_charge = 500;    % System baseline charge pressure (Pascals)

%% 2. Establish Independent Variables & Varied Channels
% Vector of fluid velocities (Ensuring Laminar regime Re < 2300)
v = linspace(0.1, 1.5, 40)'; 

% Three discrete pipe diameters to compare (meters)
D_vectors = [0.010, 0.012, 0.015]; 
labels = {'Pipe 1 (D = 10mm)', 'Pipe 2 (D = 12mm)', 'Pipe 3 (D = 15mm)'};
colors = {'#E53E3E', '#38A169', '#3182CE'}; % Premium Red, Green, Blue hex colors
markers = {'o', 's', '^'};

%% 3. Execute Loop for Data Generation, Regression, and Visualization
figure('Name', 'Fluid Regression Study', 'Position', [100, 100, 850, 550]);
hold on;
grid on; 

% Array to store plot handles for the legend
plot_handles = [];

for i = 1:length(D_vectors)
    D = D_vectors(i);
    
    % Theoretical slope derivation (Hagen-Poiseuille equation)
    m_theoretical = (32 * mu * L) / (D^2);
    
    % Generate dynamic pressure drops + constant baseline charge pressure
    dP_raw = m_theoretical * v + P_charge;
    
    % Inject subtle numerical noise to simulate experimental testing
    rng(42 + i); % Offset seed per pipe so noise patterns vary slightly
    noise = 15 * randn(size(v));
    dP_experimental = dP_raw + noise;
    
    % Perform Linear Regression (First-order polynomial: y = m*x + c)
    reg_coefficients = polyfit(v, dP_experimental, 1);
    m_regressed = reg_coefficients(1);
    c_regressed = reg_coefficients(2);
    
    % Evaluate Regressed Curve
    dP_fitted = polyval(reg_coefficients, v); 
    
    % Convert Hex strings to standard RGB vectors to avoid scatter property errors
    current_color = sscanf(colors{i}(2:end), '%2x', 3)' / 255;
    
    % 1. Plot the "experimental" noisy data points using the RGB vector
    scatter(v, dP_experimental, 40, markers{i}, 'filled', ...
            'MarkerFaceColor', current_color, ...
            'MarkerEdgeColor', current_color, ...
            'MarkerFaceAlpha', 0.5, 'HandleVisibility', 'off');
    
    % 2. Plot the solid regression line and save the handle for the legend
    h = plot(v, dP_fitted, 'Color', current_color, 'LineWidth', 2, ...
             'DisplayName', sprintf('%s (m = %.1f, c = %.1f)', labels{i}, m_regressed, c_regressed));
    plot_handles = [plot_handles, h];
end   

%% 4. Post-Plot Formatting
xlabel('Fluid Velocity, v (m/s)', 'FontSize', 11, 'FontWeight', 'bold');
ylabel('Total Pressure Drop, \DeltaP (Pa)', 'FontSize', 11, 'FontWeight', 'bold');
title('Linear Regression of Laminar Pipe Flow with Baseline Charge Pressure', 'FontSize', 12, 'FontWeight', 'bold');
legend(plot_handles, 'Location', 'NorthEast', 'FontSize', 10);
hold off;j  