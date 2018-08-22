% Dr. Paul T. Bauman
%
% Goal: Given a matrix A and column vector b, compute the solution to
%       Ax = b using Gauss elimination with partial pivoting
%
% Input: n x n matrix A
%        n x 1 vector b
%
% Output: n x 1 vector x
function x = Gauss_pivot(A, b)

% Get the size of our matrix
[m, n] = size(A);

% Check that dimensions are consistent
if( m~= n)
    error('Error: matrix dimensions do not match.')
end

% Allocated space for solution
x = zeros(n,1);

% Begin forward elimination loop
for i = 1:n-1
    
    
    % Partial pivoting strategy
    % The MATLAB max function will return both
    % the max value and the index of where that value is
    % We search in the current column, below the pivot row.
    [ max_value, index ] = max( abs( A( i:n, i ) ) );
    
    % Some shifting of the index to account for the fact
    % that we only searched part of the column which the max
    % function doesn't care about. It only cares about
    % the size of the vector you feed it.
    true_index = index + i - 1;
    
    % Now check whether or not the pivot value is the largest
    % in absolute value. If not, swap it with the row that is.
    % This could be cleaner and shorter, but this makes it pretty
    % explicit what we're doing.
    if true_index ~= i
       
        A_temp1 = A(i,:);
        A_temp2 = A(true_index,:);
        
        A(i,:) = A_temp2;
        A(true_index,:) = A_temp1;
        
        b_temp1 = b(i);
        b_temp2 = b(true_index);
        
        b(i) = b_temp2;
        b(true_index) = b_temp1;
        
    end
    
    % Now continue with elimination as before.
    for j = i+1:n
        
        factor = A(j,i) / A(i,i);
        
        % This will be zero anyway, so we set it instead
        % of wasting FLOPs on it.
        A(j,i) = 0;
        
        b(j) = b(j) - factor*b(i);
        
        for k = i+1:n
            
            A(j,k) = A(j,k) - factor*A(i,k);
            
        end
    end
end

% Backward substitution.
x(n) = b(n)/A(n,n);

for i = 1:n-1
    
    % Convenient variable for loop parameter.
    k = n-i;
    
    x(k) = b(k);
    
    for j = k+1:n
        
        x(k) = x(k) - A(k,j)*x(j);
    end
    
    x(k) = x(k)/A(k,k);
    
end
