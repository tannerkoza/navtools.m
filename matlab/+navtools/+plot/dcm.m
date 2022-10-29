function dcm(dcm)
% dcmPlot2  will plot the coordinate axis of a 3x3 FRAME rotation matrix
% For matlab 2016A x-axis: blue, y-axis: red, z-axis: yellow
% Author: Tanner Koza, Howard Chen
% Date: 3/20/16
% Update: 3/17/16
% Update: 09/28/22

% Plot Properties
myBlue = [65, 105, 225]./255;
myRed = [255, 69, 0]./255;
myOrange = [255, 191, 0]./255;

figure('Name','DCM Frame Rotation')

% Plot "From" Frame
fromX = plot3([0 1],[0 0],[0 0]);
hold on 
fromY = plot3([0 0],[0 1],[0 0]);
fromZ = plot3([0 0],[0 0],[0 1]);

fromX.LineWidth = 2;
fromX.Marker = '*';
fromX.MarkerIndices = 2;
fromX.Color = myBlue;
fromY.LineWidth = 2;
fromY.Marker = '*';
fromY.MarkerIndices = 2;
fromY.Color = myRed;
fromZ.LineWidth = 2;
fromZ.Marker = '*';
fromZ.MarkerIndices = 2;
fromZ.Color = myOrange;

% Plot "To" Frame
toX = plot3([0 dcm(1,1)],[0 dcm(1,2)],[0 dcm(1,3)]);
toY = plot3([0 dcm(2,1)],[0 dcm(2,2)],[0 dcm(2,3)]);
toZ = plot3([0 dcm(3,1)],[0 dcm(3,2)],[0 dcm(3,3)]);

toX.LineWidth = 2;
toX.LineStyle = '-.';
toX.Color = myBlue;
toY.LineWidth = 2;
toY.LineStyle = '-.';
toY.Color = myRed;
toZ.LineWidth = 2;
toZ.LineStyle = '-.';
toZ.Color = myOrange;

xlabel('"From" X-axis')
ylabel('"From" Y-axis')
zlabel('"From" Z-axis')
title('"From" to "To" Rotation')
axis([-1.1 1.1 -1.1 1.1 -1.1 1.1]);
