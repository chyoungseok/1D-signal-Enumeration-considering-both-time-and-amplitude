function myX = myX(X, ii, varargin)
    if sum(strcmp(varargin, 'plot'))
        plot_flag = varargin{circshift(strcmp(varargin, 'plot'), 1)};
    end

    for i = 1:length(X)
        now_X = X{i};
        now_t = 1:length(now_X);
        my_now_X = now_X .* now_t;
        X{i} = my_now_X;
    end
    myX = X;
    

    if plot_flag == 1
        figure
        for n = 1 : length(X)
            subplot(2, length(X)/2, n);
            plot(myX{n}); hold on;
            ylim([-0.1 50.1])
            title(['X', num2str(ii(n))], 'FontSize', 20)
        end
    end
end