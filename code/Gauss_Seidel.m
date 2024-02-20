function [X] = Gauss_Seidel(A,B)
%Funkcja służy do blokowego wyznaczania rozwiązania układu  AX=B
%Do wyznaczania mniejszych rozwiązań układów pxp, funckja korzysta
%z innej funkcji GEPP do wyznaczania kolejnych przybliżeń podwektorów

it = 0;
[n, ~] = size(A);
p = n/3;
X_old = zeros(n,1);
X_new = repmat(10^5, n, 1);
A1 = A(1:p, 1:p);
X_old_old = X_old;



while norm(X_old_old - X_new) >= 10^-10
    B1 = B(1:p) - A(1:p,p+1:2*p)*X_old(p+1:2*p) - A(1:p,2*p+1:3*p)*X_old(2*p+1:3*p);
    X_new(1:p) = GEPP(A1, B1);
    B2 = A(p+1:2*p, 1:p)*X_new(1:p) + A(p+1:2*p, 2*p+1:3*p)*X_old(2*p+1:3*p) - B(p+1:2*p);
    X_new(p+1:2*p) = GEPP(A1, B2);
    B3 = B(2*p+1:3*p) - A(2*p+1:3*p,1:p)*X_new(1:p) - A(2*p+1:3*p, p+1:2*p)*X_new(p+1:2*p);
    X_new(2*p+1:3*p) = GEPP(A1, B3);
    X_old_old = X_old;
    X_old = X_new;
    it = it+1;
    if it > 300
        break
    end 
    
end

X = X_new;


end