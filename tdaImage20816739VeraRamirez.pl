%LAB 2 PARADIGMAS DE PROGRAMACIÓN
%CARLOS VERA RAMÍREZ
%20.816.739-1
%Hecho en Prolog

%TDA IMAGE

:-module(tdaImage20816739VeraRamirez, [image/4, imageIsBitmap/1, imageIsPixmap/1,  imageIsHexmap/1, imageIsCompressed/1 , imageFlipH/2, imageFlipV/2, imageCrop/6, imageRGBToHex/2, imageToHistogram/2, imageRotate90/2]).


:-use_module(tdaPixbit20816739VeraRamirez).
:-use_module(tdaPixhex20816739VeraRamirez).
:-use_module(tdaPixrgb20816739VeraRamirez).


%--------------- Clausulas ---------------

%Constructor de imagen
%Meta Principal: image
%Meta secundaria: -
image(Width,Height,Data, [Width,Height,Data]).


%Pertenencia de Bitbit
%Meta Principal: imageIsBitmap
%Meta secundaria: isBitmap
imageIsBitmap(Image):-
    image(_,_,Data, Image),
    isBitmap(Data).


isBitmap([]).
isBitmap([Pixbit|Rest]) :- 
    pixbit(_,_, Bit, _, Pixbit),
    (Bit == 0; Bit == 1),
    isBitmap(Rest).

%Pertenencia de pixrgb
%Meta Principal: imageIsPixmap
%Meta secundaria: isPixmap
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
%Meta Principal: imageIsHexmap
%Meta secundaria: isHexmap
imageIsHexmap(Image):-
    image(_,_,Data, Image),
    isHexmap(Data).

isHexmap([]).
isHexmap([Pixhex|Rest]) :- 
    pixhex(_,_, Hex, _, Pixhex),
    %verificar si hex es un string
    string(Hex),
    isHexmap(Rest).

%Pertenencia de compresion
%Meta Principal: imageIsCompressed
%Meta secundaria: image
imageIsCompressed(Image) :-
    image(Width, Height, Data, Image),
    length(Data, Length),
    Length < Width * Height.


%Pertenencia de flipH
%Meta Principal: imageFlipH
%Meta secundaria: flipH, changeEjeX
imageFlipH(Image, FlippedImage) :- 
    image(Width, Height, Data, Image), 
    image(Width, Height, FlippedData, FlippedImage),
	%contador para ubicar el n-esimo pixel a buscar en una fila
    Waux is Width-1, 
	flipH(Width, 0, Waux, 0, Data, [], FlippedData).

flipH(_, _, _, _, Data, DataFinal, DataFinal):- length(Data,L1), length(DataFinal,L2) , L1==L2,!.
flipH(Width, CountHeigth, Waux, CountX, Data, DataFinal, FlippedData):-
    Waux==0, 
    PosicionPix is CountHeigth + Waux,
    nth0(PosicionPix,Data,Pixel),
    changeEjeX(Pixel,CountX,NewPixel),
    append(DataFinal,[NewPixel],NewDataFinal),
    NewCountHeigth is CountHeigth + Width,
    NewWaux is Width - 1,
    flipH(Width, NewCountHeigth, NewWaux, 0, Data, NewDataFinal, FlippedData),!.
flipH(Width, CountHeigth, Waux, CountX, Data, DataFinal, FlippedData):-
    PosicionPix is CountHeigth + Waux,
    nth0(PosicionPix,Data,Pixel),
    changeEjeX(Pixel,CountX,NewPixel),
    append(DataFinal,[NewPixel],NewDataFinal),
	NewWaux is Waux - 1,
    NewCountX is CountX + 1,
    flipH(Width, CountHeigth, NewWaux, NewCountX, Data, NewDataFinal, FlippedData),!.

changeEjeX([EjeY|[_|Ps]],CountX,[EjeY|[CountX|Ps]]).


%Pertenencia de flipV
%Meta Principal: imageFlipV
%Meta secundaria: flipV, changeEjeY
imageFlipV(Image, FlippedImage) :- 
    image(Width, Height, Data, Image), 
    image(Width, Height, FlippedData, FlippedImage),
    reverse(Data,NewData),
    Waux is Width-1, 
	flipV(Width, 0, Waux, 0, NewData, [], FlippedData).  

flipV(_, _, _, _, Data, DataFinal, DataFinal):- length(Data,L1), length(DataFinal,L2) , L1==L2,!.
flipV(Width, CountHeigth, Waux, CountY, Data, DataFinal, FlippedData):-
    Waux==0, 
    PosicionPix is CountHeigth + Waux,
    nth0(PosicionPix,Data,Pixel),
    changeEjeY(Pixel,CountY,NewPixel),
    append(DataFinal,[NewPixel],NewDataFinal),
    NewCountHeigth is CountHeigth + Width,
    NewWaux is Width - 1,
    NewCountY is CountY + 1,
    flipV(Width, NewCountHeigth, NewWaux, NewCountY, Data, NewDataFinal, FlippedData),!.
flipV(Width, CountHeigth, Waux, CountY, Data, DataFinal, FlippedData):-    
	PosicionPix is CountHeigth + Waux,
    nth0(PosicionPix,Data,Pixel),
    changeEjeY(Pixel,CountY,NewPixel),
    append(DataFinal,[NewPixel],NewDataFinal),
	NewWaux is Waux - 1,
    flipV(Width, CountHeigth, NewWaux, CountY, Data, NewDataFinal, FlippedData),!.

changeEjeY([_|Ps],CountY,[CountY|Ps]).


%Pertenencia de crop
%Meta Principal: imageCrop
%Meta secundaria: crop, cropPixels
imageCrop(Image, X1, Y1, X2, Y2, I2) :-
    image(_, _, Data, Image),
    image(Width, Height, CroppedData, I2),
    X1 >= 0,
    Y1 >= 0,
    X2 >= 0,
    Y2 >= 0,
    crop(X1, Y1, X2, Y2, Data, CroppedData, Width, Height).

crop(X1, Y1, X2, Y2, Data, CroppedData, Width, Height) :-
    X1 =< X2, Y1 =< Y2, 
    Width is X2 - X1 + 1, Height is Y2 - Y1 + 1, Waux is Width - 1,
    cropPixels(X1, Y1, X2, Y2, Width, 0, 0, Waux, Data, [], CroppedData),!;
    X2 =< X1, Y2 =< Y1, 
    Width is X1 - X2 + 1, Height is Y1 - Y2 + 1, Waux is Width - 1,
    cropPixels(X2, Y2, X1, Y1, Width, 0, 0, Waux, Data, [], CroppedData),!;
    X1 =< X2, Y2 =< Y1, 
    Width is X2 - X1 + 1, Height is Y1 - Y2 + 1, Waux is Width - 1,
    cropPixels(X1, Y2, X2, Y1, Width, 0, 0, Waux, Data, [], CroppedData),!;
    Width is X1 - X2 + 1, Height is Y2 - Y1 + 1, Waux is Width - 1,
    cropPixels(X2, Y1, X1, Y2, Width, 0, 0, Waux, Data, [], CroppedData),!.   

cropPixels(_, _, X, Y, _, CountX, CountY, _, [[Y|[X|RestoPix]]|_], FinalData, CroppedData) :-
    append(FinalData, [[CountY|[CountX|RestoPix]]], CroppedData),!.

cropPixels(X1, Y1, X2, Y2, Width, CountX, CountY, Waux, [[Y|[X|RestoPix]]|RestoData], FinalData, CroppedData) :-
	X >= X1, X =< X2, Y >= Y1, Y =< Y2,
    append(FinalData, [[CountY|[CountX|RestoPix]]], NewFinalData),
    Waux == 0,
    Waux2 is Width - 1,
    CountY2 is CountY + 1,
    cropPixels(X1, Y1, X2, Y2, Width, 0, CountY2, Waux2, RestoData, NewFinalData, CroppedData),!;
    X >= X1, X =< X2, Y >= Y1, Y =< Y2,
    append(FinalData, [[CountY|[CountX|RestoPix]]], NewFinalData),
    Waux2 is Waux - 1,
    CountX2 is CountX + 1,
    cropPixels(X1, Y1, X2, Y2, Width, CountX2, CountY, Waux2, RestoData, NewFinalData, CroppedData),!.
    
cropPixels(X1, Y1, X2, Y2, Width, CountX, CountY, Waux, [_|RestoData], FinalData, CroppedData) :-
    cropPixels(X1, Y1, X2, Y2, Width, CountX, CountY, Waux, RestoData, FinalData, CroppedData).
    
	
%Pertenencia de RGBtoHex
%Meta Principal: imageRGBToHex
%Meta secundaria: conversionImagen, conversionPixel, conversionColor
imageRGBToHex(I,I2):- 
    imageIsPixmap(I), 
    image(Width, Height, Data, I), 
    image(Width, Height, RGBToHexData, I2),
    append([], ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"], ConversionDigitos),
	conversionImagen(Data, [], ConversionDigitos, RGBToHexData).

conversionImagen([], NewData, _, NewData).
conversionImagen([RGBPixel|RestoData], NewData, ConversionDigitos, RGBToHexData):-
    conversionPixel(RGBPixel, ConversionDigitos, HexPixel),
    append(NewData, [HexPixel], NewData2),
    conversionImagen(RestoData, NewData2, ConversionDigitos, RGBToHexData),!.

conversionPixel([Y|[X|[R|[G|[B|D]]]]], ConversionDigitos, [Y|[X|[Hex|D]]]):-
    conversionColor(R, ConversionDigitos, RedHex),
    conversionColor(G, ConversionDigitos, GreenHex),
    conversionColor(B, ConversionDigitos, BlueHex),
    atomic_list_concat(["#", RedHex, GreenHex, BlueHex], "", ColorHex),
    string_concat(ColorHex, "", Hex).

conversionColor(ColorRGB, ConversionDigitos, ColorHex):-
    Div is ColorRGB // 16,
    Rem is ColorRGB mod 16,
    nth0(Div, ConversionDigitos, N1),
    nth0(Rem, ConversionDigitos, N2),
	atomic_list_concat([N1, N2], "", ColorHex).


%Pertenencia de histograma
%Meta Principal: imageToHistogram
%Meta secundaria: histogramaBitmap, histogramaPixmap, histogramaHexmap, buscarColorHistograma
imageToHistogram(Image, Histograma):-
    imageIsBitmap(Image),
    image(_, _, Data, Image), 
	histogramaBitmap(Data, [], Histograma),!;
    imageIsPixmap(Image),
    image(_, _, Data, Image), 
	histogramaPixmap(Data, [], Histograma),!;
    imageIsHexmap(Image),
    image(_, _, Data, Image), 
	histogramaHexmap(Data, [], Histograma),!.

histogramaBitmap([], Histograma, Histograma).
histogramaBitmap([Pixel|Resto], Histograma, FinalHistograma):-
    pixbit(_, _, Bit, _, Pixel),
    buscarColorHistograma(Bit, Histograma, Posicion, Count),
    Count2 is Count + 1,
    nth0(Posicion, Histograma, _, RestoHistograma),
    append(RestoHistograma, [[Bit, Count2]], NewHistograma),
    histogramaBitmap(Resto, NewHistograma, FinalHistograma),!;
    pixbit(_, _, Bit, _, Pixel),
    append(Histograma, [[Bit, 1]], NewHistograma),
    histogramaBitmap(Resto, NewHistograma, FinalHistograma),!.
    
histogramaPixmap([], Histograma, Histograma).
histogramaPixmap([Pixel|Resto], Histograma, FinalHistograma):-
    pixrgb(_, _, R, G, B, _, Pixel),
    buscarColorHistograma([R, G, B], Histograma, Posicion, Count),
    Count2 is Count + 1,
    nth0(Posicion, Histograma, _, RestoHistograma),
    append(RestoHistograma, [[[R, G, B], Count2]], NewHistograma),
    histogramaPixmap(Resto, NewHistograma, FinalHistograma),!;
    pixrgb(_, _, R, G, B, _, Pixel),
    append(Histograma, [[[R, G, B], 1]], NewHistograma),
    histogramaPixmap(Resto, NewHistograma, FinalHistograma),!.

histogramaHexmap([], Histograma, Histograma).
histogramaHexmap([Pixel|Resto], Histograma, FinalHistograma):-
    pixhex(_, _, Hex, _, Pixel),
    buscarColorHistograma(Hex, Histograma, Posicion, Count),
    Count2 is Count + 1,
    nth0(Posicion, Histograma, _, RestoHistograma),
    append(RestoHistograma, [[Hex, Count2]], NewHistograma),
    histogramaHexmap(Resto, NewHistograma, FinalHistograma),!;
    pixhex(_, _, Hex, _, Pixel),
    append(Histograma, [[Hex, 1]], NewHistograma),
    histogramaHexmap(Resto, NewHistograma, FinalHistograma),!.

buscarColorHistograma(Color, Histograma, Posicion, Count):-
    nth0(Posicion, Histograma, [Color,Count]).


%Pertenencia de rotate90
%Meta Principal: imageRotate90
%Meta secundaria: rotate90, changeEjesRotate
imageRotate90(Image, RotatedImage):-
    image(Width, Height, Data, Image),
    image(Width, Height, RotatedData, RotatedImage),
    CountRows is Height - 1,
    NVertice is CountRows * Width,
    rotate90(Width, Height, NVertice, CountRows, 0, 0, Data, [], RotatedData).

rotate90(_, _, _, _, _, _, Data, FinalData, FinalData):- length(Data,L1), length(FinalData,L2) , L1==L2,!.
rotate90(Width, Height, NVertice, CountRows, CountCol, CountAux, Data, FinalData, RotatedData):-
    CountRows == 0,
    nth0(NVertice,Data,Pixel), 
    changeEjesRotate(Pixel, CountAux, CountCol, NewPixel),
    append(FinalData,[NewPixel],NewDataFinal),
    CountCol2 is CountCol + 1,
    Haux is Height - 1,
    NVerticeAux is Haux * Width,
    NVertice2 is NVerticeAux + CountCol2,
    rotate90(Width, Height, NVertice2, Haux, CountCol2, 0, Data, NewDataFinal, RotatedData),!.
        
rotate90(Width, Height, NVertice, CountRows, CountCol, CountAux, Data, FinalData, RotatedData):-
    nth0(NVertice,Data,Pixel), 
    changeEjesRotate(Pixel, CountAux, CountCol, NewPixel),
    append(FinalData,[NewPixel],NewDataFinal),
    NVertice2 is NVertice - Width,
    CountRows2 is CountRows - 1,
    CountAux2 is CountAux + 1,
    rotate90(Width, Height, NVertice2, CountRows2, CountCol, CountAux2, Data, NewDataFinal, RotatedData),!.
    
changeEjesRotate([_|[_|RestoPixel]], NewX, NewY, [NewY|[NewX|RestoPixel]]).

%Pertenencia de imageChangePixel
%Meta Principal: imageChangePixel
%Meta secundaria: changePixel2
imageChangePixel(I, Pixel, RotatedImage):-
    image(Width, Height, Data, I),
    image(Width, Height, RotatedData, RotatedImage),
	changePixel2(Data, Pixel, [], RotatedData).

changePixel2([], _, FinalData, FinalData). 

changePixel2([[Y|[X|_]]|RestoPixeles], [Y|[X|RestoP2]], FinalData, RotatedData):- 
    append(FinalData, [[Y|[X|RestoP2]]], NewDataFinal),
    changePixel2(RestoPixeles, [Y|[X|RestoP2]], NewDataFinal, RotatedData),!.

changePixel2([PixelC|RestoPixeles], P2, FinalData, RotatedData):- 
    append(FinalData, [PixelC], NewDataFinal),
    changePixel2(RestoPixeles, P2, NewDataFinal, RotatedData),!.



%Modificador de invertir RGB
%Meta Principal: imageInvertColorRGB
%Meta secundaria: pixrgb
imageInvertColorRGB(Pixel,PixelModificado):- 
    pixrgb(Y,X,RED,GREEN,BLUE,Depth, Pixel),
 pixrgb(Y,X,REDinvertido,GREENinvertido,BLUEinvertido,Depth, PixelModificado),
 REDinvertido is abs(255-RED), 
 GREENinvertido is abs(255-GREEN), 
 BLUEinvertido is abs(255-BLUE),!.
