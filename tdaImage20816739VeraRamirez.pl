%LAB 2 PARADIGMAS DE PROGRAMACIÓN
%CARLOS VERA RAMÍREZ
%20.816.739-1
%Hecho en Prolog

%TDA IMAGE

:-module(tdaImage20816739VeraRamirez, [image/4, imageIsBitmap/1, imageIsPixmap/1,  imageIsHexmap/1, imageIsCompressed/1 , imageFlipH/2, imageFlipV/2, crop/6]).


:-use_module(tdaPixbit20816739VeraRamirez).
:-use_module(tdaPixhex20816739VeraRamirez).
:-use_module(tdaPixrgb20816739VeraRamirez).


%--------------- Clausulas ---------------

%Constructor de imagen

image(Width,Height,Data, [Width,Height,Data]).


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
    flipH(Height, 0, Data, FlippedData).

%flipH(Height, Counter, Data, FlippedData)
%debemos invertir la lista de pixeles, no se deben modificar la informacion de cada pixel

flipH(Height, Counter, Data, FlippedData) :-
    Counter < Height,
    nth0(Counter, Data, Row),
    reverse(Row, FlippedRow),
    nth0(Counter, FlippedData, FlippedRow),
    Counter1 is Counter + 1,
    flipH(Height, Counter1, Data, FlippedData).

flipH(Height, Counter, _, _) :-
    Counter >= Height.

%Crear funcion que permita invertir una imagen verticalmente
%para invertir una imagen verticalmente, primero debe ser invertida horizontalmente y luego ser invertida.

imageFlipV(Image, FlippedImage) :-
    imageFlipH(Image, FlippedImageH),
    imageFlipH(FlippedImageH, FlippedImage).

%crear una funcion que permita recortar una imagen, para ello debemos ir verificando que los pixeles esten dentro de los limites de la imagen

imageCrop(Image, X1, Y1, X2, Y2, I2) :-
    image(Width, Height, Data, Image),
    image(Width, Height, CroppedData, I2),
    crop(X1, Y1, X2, Y2, Data, CroppedData).




%crop(X1, Y1, X2, Y2, Data, CroppedData)
%verificar que los pixeles esten dentro de los limites de la imagen

crop(X1, Y1, X2, Y2, Data, CroppedData) :-
    X1 >= 0,
    Y1 >= 0,
    X2 >= 0,
    Y2 >= 0,
    X1 =< X2,
    Y1 =< Y2,
    crop2(X1, Y1, X2, Y2, Data, CroppedData).

crop2(X1, Y1, X2, Y2, Data, CroppedData) :-
    X1 =< X2,
    Y1 =< Y2,
    nth0(Y1, Data, Row),
    nth0(X1, Row, Pixel),
    nth0(Y1, CroppedData, CroppedRow),
    nth0(X1, CroppedRow, Pixel),
    X1_1 is X1 + 1,
    crop2(X1_1, Y1, X2, Y2, Data, CroppedData).

crop2(X1, Y1, X2, Y2, Data, CroppedData) :-
    X1 > X2,
    Y1 =< Y2,
    Y1_1 is Y1 + 1,
    crop2(0, Y1_1, X2, Y2, Data, CroppedData).

crop2(_, Y1, _, Y2, _, _) :-
    Y1 > Y2.

