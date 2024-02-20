%skrypt testujący
A = createblockmatrix(3, 'random');
B = rand(9,1);
Gauss_Seidel(A,B)
linsolve(A,B)
%metoda bardzo słabo radzi z blokami generowanymi losowo, musielibyśmy mieć
%duże szczęście przy losowaniu macierzy co wyjaśnie później

%-------------------------------------------------------------------------
A = createblockmatrix(7, 'random');
B = rand(21,1);
Gauss_Seidel(A,B)
linsolve(A,B)
%podobnie będzie z macierzą magiczną

%-------------------------------------------------------------------------

%MACIERZ SILNIE DIAGNONALNIE DOMINUJĄCA
%A = createblockmatrix(2, 'custom')
%Podaj wartości macierzy, oddzielone przecinkami: 40,2,-1,30
%Podaj wartości macierzy, oddzielone przecinkami: 9,8,-5,6
%Podaj wartości macierzy, oddzielone przecinkami: 3,2,1,4
%Podaj wartości macierzy, oddzielone przecinkami: -7,5,2,6

A = createblockmatrix(2, 'custom');
B = rand(6,1);

disp('metoda Gaussa-Seidela:')
tic;
X_GS =Gauss_Seidel(A,B);
time_Gauss_Seidel = toc;
disp(X_GS)

disp('funkcja wbudowana:')

tic;
X_LS =linsolve(A,B);
time_linsolve = toc;
disp(X_LS)

fprintf('\nPorównanie czasów wykonania:\n');
fprintf('Metoda Gaussa-Seidela: %.6f sekund\n', time_Gauss_Seidel);
fprintf('Funkcja wbudowana: %.6f sekund\n', time_linsolve);

error_absolute = norm(X_GS - X_LS);
error_relative = norm(X_GS - X_LS) / norm(X_LS);

fprintf('\nPorównanie rozwiązań:\n');
fprintf('Błąd bezwzględny: %.6e\n', error_absolute);
fprintf('Błąd względny: %.6e\n', error_relative);

%-------------------------------------------------------------------------


%silniej dominująca
%A = createblockmatrix(2, 'custom')
%Podaj wartości macierzy, oddzielone przecinkami: 200,2,-1,100
%Podaj wartości macierzy, oddzielone przecinkami: 9,8,-5,6
%Podaj wartości macierzy, oddzielone przecinkami: 3,2,1,4
%Podaj wartości macierzy, oddzielone przecinkami: -7,5,2,6

A = createblockmatrix(2, 'custom');

disp('metoda Gaussa-Seidela:')
tic;
X_GS = Gauss_Seidel(A,B);
time_Gauss_Seidel = toc;
disp(X_GS)

disp('funkcja wbudowana:')

tic;
X_LS = linsolve(A,B);
time_linsolve = toc;
disp(X_LS)

fprintf('\nPorównanie czasów wykonania:\n');
fprintf('Metoda Gaussa-Seidela: %.6f sekund\n', time_Gauss_Seidel);
fprintf('Funkcja wbudowana: %.6f sekund\n', time_linsolve);

error_absolute = norm(X_GS - X_LS);
error_relative = norm(X_GS - X_LS) / norm(X_LS);

fprintf('\nPorównanie rozwiązań:\n');
fprintf('Błąd bezwzględny: %.6e\n', error_absolute);
fprintf('Błąd względny: %.6e\n', error_relative);

%im silniejsza diagonalna dominacja tym metoda szybsza

%--------------------------------------------------------------------------

%A = createblockmatrix(2, 'custom')
%Podaj wartości macierzy, oddzielone przecinkami: 2000,2,-1,1000
%Podaj wartości macierzy, oddzielone przecinkami: 0,1,1,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,1,1,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,1,1,0
%metoda sprawdza się również dobrze gdy tylko Macierze na przekątnej
%macierzy blokowej są diagonalnie dominujące a pozostałe nie, jednak cała
%macierz A pozostaje digonalnie dominująca

A = createblockmatrix(2, 'custom');
disp('metoda Gaussa-Seidela:')
tic;
X_GS =Gauss_Seidel(A,B);
time_Gauss_Seidel = toc;
disp(X_GS);

disp('funkcja wbudowana:')

tic;
X_LS = linsolve(A,B);
time_linsolve = toc;
disp(X_LS);

fprintf('\nPorównanie czasów wykonania:\n');
fprintf('Metoda Gaussa-Seidela: %.6f sekund\n', time_Gauss_Seidel);
fprintf('Funkcja wbudowana: %.6f sekund\n', time_linsolve);

error_absolute = norm(X_GS - X_LS);
error_relative = norm(X_GS - X_LS) / norm(X_LS);

fprintf('\nPorównanie rozwiązań:\n');
fprintf('Błąd bezwzględny: %.6e\n', error_absolute);
fprintf('Błąd względny: %.6e\n', error_relative);

%-------------------------------------------------------------------------

%A = createblockmatrix(2, 'custom')
%Podaj wartości macierzy, oddzielone przecinkami: 200,2,-1,100
%Podaj wartości macierzy, oddzielone przecinkami: 0,1000,1000,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,1000,1000,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,1000,1000,0
%bloki na przekątnej dominujące, pozstałe nie i cała macierz również nie,
%metoda się rozbiega

A = createblockmatrix(2, 'custom');
disp('metoda Gaussa-Seidela:')
tic;
Gauss_Seidel(A,B)
time_Gauss_Seidel = toc;

disp('funkcja wbudowana:')

tic;
linsolve(A,B)
time_linsolve = toc;

fprintf('\nPorównanie czasów wykonania:\n');
fprintf('Metoda Gaussa-Seidela: %.6f sekund\n', time_Gauss_Seidel);
fprintf('Funkcja wbudowana: %.6f sekund\n', time_linsolve); 


%-------------------------------------------------------------------------

%co ciekawe nie musi być spełniony warunek silnej diagonalnej dominancji
%aby metoda była zbieżna, wystarczy ze wszytskie bloki poza blokiem A11 są
%macierzami zerowymi
% A = createblockmatrix(3, 'custom')
%Podaj wartości macierzy, oddzielone przecinkami: 1,2,3,2,-1,4,3,4,5
%Podaj wartości macierzy, oddzielone przecinkami: 0,0,0,0,0,0,0,0,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,0,0,0,0,0,0,0,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,0,0,0,0,0,0,0,0 

A = createblockmatrix(3, 'custom');
B = rand(9,1);
disp('metoda Gaussa-Seidela:')
tic;
X_GS = Gauss_Seidel(A,B);
time_Gauss_Seidel = toc;
disp(X_GS);
disp('funkcja wbudowana:')

tic;
X_LS = linsolve(A,B);
time_linsolve = toc;
disp(X_LS);


fprintf('\nPorównanie czasów wykonania:\n');
fprintf('Metoda Gaussa-Seidela: %.6f sekund\n', time_Gauss_Seidel);
fprintf('Funkcja wbudowana: %.6f sekund\n', time_linsolve); 

error_absolute = norm(X_GS - X_LS);
error_relative = norm(X_GS - X_LS) / norm(X_LS);

fprintf('\nPorównanie rozwiązań:\n');
fprintf('Błąd bezwzględny: %.6e\n', error_absolute);
fprintf('Błąd względny: %.6e\n', error_relative);








% wektor wyrazów wolnych : X= [1,2,3,1,0,-1,0,2,-3], działa GEPP, linsolve
% i Gauss_Seidel dają takie same wyniki 
% czyli wniose taki, że metoda będzie działa kiedy poza macierzami na
% diagonali będą macierze zerowe
%A = createblockmatrix(5, 'custom')
%Podaj wartości macierzy, oddzielone przecinkami: 1,2,3,4,5,2,3,-1,10,9,6,7,8,9,10,-3,2,-8,5,6,11,1,5,-4,2
%Podaj wartości macierzy, oddzielone przecinkami: 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
%Podaj wartości macierzy, oddzielone przecinkami: 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
%B = [3;4;22;1;22;-5;-7;9;10;-1;6;7;-9;41;2] też działa dla każdej funkcji.