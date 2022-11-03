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
