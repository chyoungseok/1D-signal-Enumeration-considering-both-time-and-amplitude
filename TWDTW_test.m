% TWDTW TEST
clear; close all; clc;

[X, ii] = genTimeSeries('plot', 1, 'shuffle', 1, 'rand_amp', 1);
myX = myX(X, 'plot', 1, 'ii', ii);

cost = [];
for i = 1 : 12
    temp_cost = [];
    for j = 1 : 12
        temp_cost = [temp_cost, TWDTW(X{i}, X{j}, myX{i}, myX{j})];
    end
    cost = [cost; temp_cost];
end

sum_cost = sum(cost);
[~, max_idx] = max(sum_cost);
init_cost = cost(max_idx,:);
% [sorted_cost, sort_idx] = sort(cost);

% figure;
% for n = 1 : 12
%     subplot(2, 6, n);
%     plot(X{sort_idx(n)}); ylim([-0.1 1.1]);
% end