function [X] = GEPP(A, b)
%ta funkcja wyznacza rozwiązanie układu Ax = b metodą
%eliminacji gaussa z częściowym wyborem elementu głównego
[n, ~] = size(A);
NewA = horzcat(A, b);

for j=1:n
    maxValue = abs(A(j, j));
    maxIndex = j;
    for i=j:n
        if abs(A(i,j)) > maxValue
            maxValue = abs(A(i, j));
            maxIndex = i;

        end  
    end
    if maxIndex ~= j
        tmprow = NewA(j, :);
        NewA(j, :) = NewA(maxIndex, :);
        NewA(maxIndex, :) = tmprow;
    end    
    for i=j+1:n
        a = NewA(i, j)/NewA(j,j);
        NewA(i, :) = NewA(i, :) - a*NewA(j, :);

    end    

end

X = zeros(n,1);
X(n,1) = NewA(n, n+1)/NewA(n,n);

for i=n-1:-1:1
    X(i,1) = (NewA(i, n+1) - NewA(i, 1:n)*X)/NewA(i,i);

end    





end