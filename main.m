
close all; clear; clc;

X = genTimeSeries('plot', 0);
% getUDMatrix('plot', 1, 'X', X);
[shuffled_X, ii] = shuffleData(X, 'plot', 1);
myX = myX(shuffled_X, ii, 'plot', 1);
matrix = getUDMatrix('plot',1, 'X', myX);

sorted_X = Enumeration('matrix', matrix, 'X', shuffled_X, 'plot', 1);
