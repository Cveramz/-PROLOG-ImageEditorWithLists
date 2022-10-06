%LAB 2 PARADIGMAS DE PROGRAMACIÓN
%CARLOS VERA RAMÍREZ
%20.816.739-1
%Hecho en Prolog

%TDA IMAGE


%--------------- Clausulas ---------------

%Constructor de imagen

imagen-d(Width,Height,Data, [Width,Height,Data]).

%Constructor de pixbit

pixbit-d(X,Y,Bit,Depth, [X,Y,Bit,Depth]).

%Constructor de pixhex

pixhex-d(X,Y,Hex,Depth, [X,Y,Hex,Depth]).

%Constructor de pixrgb

pixrgb-d(X,Y,R,G,B,Depth, [X,Y,R,G,B,Depth]).