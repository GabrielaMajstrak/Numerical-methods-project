function [BM] = createblockmatrix(p, key)
%ta funkcja tworzy macierz o strukturze podanej w poleceniu 
BM = ones(3 * p);  
C = createMatrix(p, key);
BM(1:p, 1:p) = C;
BM(2*p+1:3*p, 2*p+1:3*p) = C;
BM(p+1:2*p, p+1:2*p) = -C;
for i = 1:3 % w dwóch pętlach zapełniamy kolejne bloki
    for j = 1:3
        if BM((i-1)*p+1:i*p, (j-1)*p+1:j*p) == 1
            A = createMatrix(p, key);
            BM((i-1)*p+1:i*p, (j-1)*p+1:j*p) = A;
            BM((j-1)*p+1:j*p, (i-1)*p+1:i*p) = A';
        end
    end
end
end


