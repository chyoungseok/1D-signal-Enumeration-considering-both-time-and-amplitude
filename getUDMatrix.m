function matrix = getUDMatrix(varargin)
    if sum(strcmp(varargin, 'plot'))
        plot_flag = varargin{circshift(strcmp(varargin, 'plot'), 1)};
    end

    if sum(strcmp(varargin, 'X'))
        X = varargin{circshift(strcmp(varargin, 'X'), 1)}; % cell that includes time series data
    end

    matrix = [];
    
    for i = 1 : length(X)
        now_data = X{i};
        
        now_distance = [];
        for j = 1 : length(X)
            distance = sum(sqrt((now_data - X{j}).^2));
            now_distance = [now_distance, distance];
        end
        matrix = [matrix; now_distance];
    end
    
    if plot_flag == 1
        figure;
        imagesc(matrix); hold on; colorbar
    end
end