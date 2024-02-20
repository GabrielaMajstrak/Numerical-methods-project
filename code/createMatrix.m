function [A] = createMatrix(p, key)
% Ta funkcja tworzy macierz pxp, wartość key pozwala wybrać rodzaj macierzy

if strcmp(key, 'random')
    A = rand(p);
elseif strcmp(key, 'magic')
    A = magic(p);
elseif strcmp(key, 'other')
    v = 1:1000;
    randomIndices = randperm(numel(v), p^2);
    selectedValues = v(randomIndices);
    A = reshape(selectedValues, p, p);
elseif strcmp(key, 'custom')
    prompt = 'Podaj wartości macierzy, oddzielone przecinkami: ';
    userValues = input(prompt, 's');
    valuesArray = str2num(userValues);
    if numel(valuesArray) == p^2
        A = reshape(valuesArray, p, p);
    else
        error('Nieprawidłowa liczba wartości. Wprowadź dokładnie %d wartości.', p^2);
    end
else
    error('Nieznany klucz. Dostępne klucze to: ''random'', ''magic'', ''other'', ''custom''.');
end

end
