function [shuffled_data, ii] = shuffleData(X)
    n = numel(X);
    ii = randperm(n);
    shuffled_data = X(ii);

%     if plot_flag == 1
%         figure
%         for n = 1 : length(X)
%             subplot(2, length(X)/2, n);
%             plot(shuffled_data{n}); hold on;
%             ylim([-0.1 1.1])
%             title(['X', num2str(ii(n))], 'FontSize', 20)
%         end
%         sgtitle('Shuffle the time series', 'FontSize', 20)
%     end
end