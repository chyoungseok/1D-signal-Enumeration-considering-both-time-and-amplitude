function X = genTimeSeries(varargin)
    %% check varargin
    if sum(strcmp(varargin, 'plot'))
        plot_flag = varargin{circshift(strcmp(varargin, 'plot'), 1)};
    end
    %% generate temporal series
    template = zeros(1,50);
    X = {};
    pat_len = 4; % length of pattern where the values are 1
    
    iter = 0; % counting the iteration of while structure
    while 4+iter*pat_len < 50
        x = template;
        x(1+iter*pat_len:4+iter*pat_len) = 1;
        X{iter+1} = x;
    
        iter = iter + 1;
    end
    
    %% visualization
    if plot_flag == 1
        for i = 1 : iter
            subplot(subplot(iter/2, 2, i))
            if rem(i,2) == 1
                temp = X{(i+1)/2};
                plot(temp); hold on; ylim([-0.1 1.1])
                title(['X', num2str((i+1)/2)], 'FontSize',20)
            else
                temp = X{i/2+6};
                plot(temp); hold on; ylim([-0.1 1.1]) 
                title(['X', num2str(i/2+6)], 'FontSize',20)
            end
        end
    end
end


