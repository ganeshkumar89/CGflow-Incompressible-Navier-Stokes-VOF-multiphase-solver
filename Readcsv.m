% Read the density field CSV file - Octave compatible version
clear
clc
filename = 'density_field_50000.csv';

% Use csvread instead of readtable (Octave compatible)
% Skip the header row (assuming one header row)
data = csvread(filename, 1, 0);

% Extract x, y, and density values
% Assuming columns are ordered as X, Y, Value
x = data(:, 1);
y = data(:, 2);
density = data(:, 3);

% Find unique x and y values to create a grid
x_unique = unique(x);
y_unique = unique(y);
nx = length(x_unique);
ny = length(y_unique);

% Create a grid for the density values
density_grid = reshape(density, ny, nx);

% Create a surface plot
figure('Position', [100, 100, 800, 600]);
surf(x_unique, y_unique, density_grid);
shading interp; % Use interpolated shading for smoother appearance
colormap(jet); % Use jet colormap
colorbar; % Add a colorbar to show density scale

% Add labels and title
xlabel('X');
ylabel('Y');
zlabel('Density');
title('Density Field at Timestep 1000');

% Adjust the view angle
view(0, 90); % Top-down view

% Set axis limits to match domain
xlim([min(x_unique), max(x_unique)]);
ylim([min(y_unique), max(y_unique)]);

% Apply additional formatting
set(gca, 'FontSize', 12);
grid on;

% Save the figure as an image file (compatible with Octave)
output_filename = 'vof_field_01000.png';
print(output_filename, '-dpng', '-r300');  % 300 dpi resolution
fprintf('Figure saved as %s\n', output_filename);
