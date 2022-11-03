%LAB 2 PARADIGMAS DE PROGRAMACIÓN
%CARLOS VERA RAMÍREZ
%20.816.739-1
%Hecho en Prolog

%TDA IMAGE

:-include(TDA_Pixbit_20816739_VeraRamirez).

%--------------- Clausulas ---------------

%Constructor de imagen

imagen(Width,Height,Data, [Width,Height,Data]).


%Pertenencia de Bitbit

imageIsBitmap(Image):-
    image(_,_,Data, Image),
    isBitmap(Data).


isBitmap([]).
isBitmap([Pixbit|Rest]) :- 
    pixbit(_,_, Bit, _, Pixbit),
    (Bit == 0; Bit == 1),
    isBitmap(Rest).

%Pertenencia de pixrgb

imageIsPixmap(Image):-
    image(_,_,Data, Image),
    isPixmap(Data).

isPixmap([]).
isPixmap([Pixrgb|Rest]) :- 
    pixrgb(_,_, R, G, B, _, Pixrgb),
    (R >= 0, R =< 255),
    (G >= 0, G =< 255),
    (B >= 0, B =< 255),
    isPixmap(Rest).

%Pertenencia de pixhex

imageIsHexmap(Image):-
    image(_,_,Data, Image),
    isHexmap(Data).

isHexmap([]).
isHexmap([Pixhex|Rest]) :- 
    pixhex(_,_, Hex, _, Pixhex),
    %verificar si hex es un string
    string(Hex),
    isHexmap(Rest).

%Verificar si image es comprimido.
%Cuando está comprimido, la cantidad de pixeles es menor a la multiplicación entre Width y Height.

imageIsCompressed(Image) :-
    image(Width, Height, Data, Image),
    length(Data, Length),
    Length < Width * Height.



%Crear funcion que permita invertir una imagen horizontalmente

imageFlipH(Image, FlippedImage) :-
    image(Width, Height, Data, Image),
    image(Width, Height, FlippedData, FlippedImage),
    flipH(Height, Data, FlippedData).

%debemos invertir la imagen por filas, por lo que debemos invertir cada fila de la imagen
