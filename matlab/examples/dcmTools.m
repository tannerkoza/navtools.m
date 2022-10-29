%% genDCM Test
clear
clc
close all

angles = [-120 45 120];
dcm = navtools.genDCM(angles,'zyx','degs');
navtools.plot.dcm(dcm)
rpy = navtools.dcm2Euler(dcm);

