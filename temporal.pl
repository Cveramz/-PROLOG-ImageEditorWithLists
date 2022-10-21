%LAB 2 PARADIGMAS DE PROGRAMACIÓN
%CARLOS VERA RAMÍREZ
%20.816.739-1
%Hecho en Prolog

%TDA IMAGE


%--------------- Clausulas ---------------

%Constructor de imagen

image(Width,Height,Data, [Width,Height,Data]).

%Constructor de pixbit

pixbit(X,Y,Bit,Depth, [X,Y,Bit,Depth]).

%Constructor de pixhex

pixhex(X,Y,Hex,Depth, [X,Y,Hex,Depth]).

%Constructor de pixrgb

pixrgb(X,Y,R,G,B,Depth, [X,Y,R,G,B,Depth]).

%Pertenencia de Bitbit
imageIsAreBitmap([]).
imageIsAreBitmap([Pixbit|Rest]) :- 
    pixbit-d(_,_, Bit, _, Pixbit),
    (Bit == 0; Bit == 1),
    imageIsAreBitmap(Rest).

%Pertenencia de pixrgb
imageIsArePixmap([]).
imageIsArePixmap([Pixrgb|Rest]) :- 
    pixrgb-d(_,_, R, G, B, _, Pixrgb),
    (R >= 0, R =< 255),
    (G >= 0, G =< 255),
    (B >= 0, B =< 255),
    imageIsArePixmap(Rest).

%Pertenencia de pixhex
imageIsArePixmap([]).
imageIsArePixmap([Pixhex|Rest]) :- 
    pixhex-d(_,_, Hex, _, Pixhex),
    (Hex >= 0, Hex =< 16777215),
    imageIsArePixmap(Rest).

%Verificar si image es comprimido.
%Cuando está comprimido, la cantidad de pixeles es menor a la multiplicación entre Width y Height.

imageIsCompressed(Image) :-
    image-d(Width, Height, Data, Image),
    length(Data, Length),
    Length < Width * Height.