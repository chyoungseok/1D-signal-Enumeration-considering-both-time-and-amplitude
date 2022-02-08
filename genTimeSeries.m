function [X, ii] = genTimeSeries(varargin)
    %% check varargin
    if sum(strcmp(varargin, 'plot'))
        plot_flag = varargin{circshift(strcmp(varargin, 'plot'), 1)};
    else 
        plot_flag = 0;
    end

    if sum(strcmp(varargin, 'rand_amp'))
        % amplitude를 1~5중 랜덤한 값으로 할지, 하나의 값으로 고정할 지 결정
        rand_amp_flag = varargin{circshift(strcmp(varargin, 'rand_amp'),1 )};
    else
        % default 값은 0
        rand_amp_flag = 0;
    end

    if sum(strcmp(varargin, 'shuffle'))
        shuffle_flag = varargin{circshift(strcmp(varargin, 'shuffle'),1 )};
    else
        shuffle_flag = 0;
    end

    %% generate temporal series
    template = zeros(1,50);
    X = {};
    pat_len = 4; % length of pattern where the values are 1

    iter = 0; % counting the iteration of while structure
    while 4+iter*pat_len < 50
        if rand_amp_flag == 1
            amp = randi(4); % 5 stage 중 하나를 랜덤으로 배정 (0 1 2 3 4)
        else
            amp = 1;
        end

        x = template;
        x(1+iter*pat_len:4+iter*pat_len) = amp;
        X{iter+1} = x;
    
        iter = iter + 1;
    end
    
    ii = 1 : iter;
    if shuffle_flag == 1
        [X, ii] = shuffleData(X);
    end
    
    %% visualization
    if plot_flag == 1 && shuffle_flag == 0
        figure;
        for i = 1 : iter
            subplot(subplot(iter/2, 2, i))
            if rem(i,2) == 1
                temp = X{(i+1)/2};
                plot(temp); hold on; ylim([-0.1 rand_amp_flag*5+1.1])
                title(['X', num2str((i+1)/2)], 'FontSize',20)
            else
                temp = X{i/2+6};
                plot(temp); hold on; ylim([-0.1 rand_amp_flag*5+1.1]) 
                title(['X', num2str(i/2+6)], 'FontSize',20)
            end
        end
        sgtitle('Generate Time Series', 'FontSize', 20)
    elseif plot_flag == 1 && shuffle_flag == 1
        figure;
        for n = 1 : iter
            subplot(2, iter/2, n);
            plot(X{n}); ylim([-0.1 rand_amp_flag*5+1.1]);
            title(['X', num2str(ii(n))], 'FontSize', 20);
        end
        sgtitle('Generate X with shuffled option', 'FontSize', 20)
    end
end


