function output = TWDTW(x, y, myx, myy)
    % TWDTW: Temporal Weighted DTW
    
    % Distance matrix
    N = length(x);
    M = length(y);
    dist_mat = zeros(N,M);
    for i = 1 : N
        for j = 1 : M
            dist_mat(i,j) = abs(x(i)-y(j)) + abs(i-j); 
        end
    end

    % Initialize the cost matrix
    cost_mat = zeros(N+1, M+1);
    cost_mat(1,:) = 0;
    cost_mat(:,1) = 0;
    cost_mat(1,1) = abs(sum(myx)-sum(myy));
    
    % Fill the cost matrix while keeping traceback information
    traceback_mat = zeros(N,M);
    for i = 1 : N
        for j = 1 : M
            penalty = [
                cost_mat(i,j),
                cost_mat(i,j+1),
                cost_mat(i+1, j)];
            [~, i_penalty] = max(penalty);
            cost_mat(i+1, j+1) = dist_mat(i,j) + penalty(i_penalty);
            traceback_mat(i,j) = i_penalty;
        end
    end

    % Traceback from bottom rigth
%     i = N-1;
%     j = M-1;
%     path = [i, j];
%     while i>0 || j>0
%         tb_type = traceback_mat(i,j);
%         if tb_type == 0
%             % Match
%             i = i-1;
%             j = j-1;
%         elseif tb_type == 1
%             % Insertion
%             i = i-1;
%         elseif tb_type == 2
%             % Deletion
%             j = j-1;
%         end
%         path = [path; [i, j]];
%     end

    % Strip infinity edges from cost_mat before returning
    cost_mat = cost_mat(2:end, 2:end);
    output = cost_mat(N,M);
end