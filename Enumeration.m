function sorted_X = Enumeration(varargin)
    if sum(strcmp(varargin, 'matrix'))
        matrix = varargin{circshift(strcmp(varargin, 'matrix'), 1)}; % cell that includes time series data
    end

    if sum(strcmp(varargin, 'X'))
        X = varargin{circshift(strcmp(varargin, 'X'), 1)}; % cell that includes time series data
    end

    if sum(strcmp(varargin, 'plot'))
        plot_flag = varargin{circshift(strcmp(varargin, 'plot'), 1)};
    end

    matrix_sum =  sum(matrix)';
    
    [sorted, sort_idx] = sort(matrix_sum);      
    sorted_X = X(sort_idx);

    if plot_flag == 1
        for n = 1 : length(sorted_X)
            subplot(2, length(X)/2, n)
            plot(sorted_X{n}); ylim([-0.1, 1.1])
            title(['X', num2str(n)], 'FontSize', 20)
        end
    end
end