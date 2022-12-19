%DOCUMENTO DE PRUEBAS

:-use_module(tdaImage20816739VeraRamirez).

/*
CONSTRUCTOR DE IMAGEN
EJEMPLO 1:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I).
EJEMPLO 2:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I). 
EJEMPLO 3:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), image( 2, 2, [PA, PB], I).

VERIFICADOR DE BITMAP
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
EJEMPLO 2:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 2, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
EJEMPLO 3:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 2, 20, PB), pixbit( 1, 0, 999, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).


VERIFICADOR DE RGB (PIXMAP)
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
EJEMPLO 2:
pixhex(0,0,"#FF0000",0,PA), pixhex(0,1,"#00FF00",0,PB), pixhex(1,0,"#0000FF",0,PC), pixhex(1,1,"#FFFFFF",0,PD), image(2,2,[PA,PB,PC,PD],I), imageIsPixmap(I).
EJEMPLO 3:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I), imageIsPixmap( I ).


VERIFICADOR DE HEXMAP
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
EJEMPLO 2:
pixhex(0,0,"#FF0000",0,PA), pixhex(0,1,"#00FF00",0,PB), pixhex(1,0,"#0000FF",0,PC), pixhex(1,1,"#FFFFFF",0,PD), image(2,2,[PA,PB,PC,PD],I), imageIsHexmap(I).
EJEMPLO 3:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I), imageIsHexmap( I ).


VERIFICADOR DE COMPRESSED
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsCompressed( I ).
EJEMPLO 2:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), image( 2, 2, [PA, PB, PC], I), imageIsCompressed( I ).
EJEMPLO 3:
pixhex(0,0,"#FF0000",1,PA), pixhex(0,1,"#00FF00",2,PB), pixhex(1,0,"#0000FF",3,PC), pixhex(1,1,"#FFFFFF",4,PD), image(2,2,[PA,PB,PC,PD],I), imageIsCompressed(I).


FLIP HORIZONTAL
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I , I2 ).
EJEMPLO 2:
pixbit( 0, 0, 0, 10, PA), pixbit( 0, 1, 0, 20, PB), image(1,2,[PA,PB],I), imageFlipH(I,I2).
EJEMPLO 3:
pixbit( 0, 0,0, 2, PA), pixbit( 0, 1, 0, 88, PB), pixbit( 1, 0, 1, 3, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH( I , I2 ).


FLIP VERTICAL
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I , I2 ).
EJEMPLO 2:
pixbit( 0, 0, 0, 10, PA), pixbit( 0, 1, 0, 20, PB), image(1,2,[PA,PB],I), imageFlipV(I,I2).
EJEMPLO 3:
pixbit( 0, 0,0, 2, PA), pixbit( 0, 1, 0, 88, PB), pixbit( 1, 0, 1, 3, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV( I , I2 ).


IMAGE CROP
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop( I , 0, 0, 1, 1, I2 ).
EJEMPLO 2:
pixbit( 0, 0, 0, 10, PA), pixbit( 0, 1, 0, 20, PB), image(1,2,[PA,PB],I), imageCrop(I,0,0,1,1,I2).
EJEMPLO 3:
pixbit( 0, 0,0, 2, PA), pixbit( 0, 1, 0, 88, PB), pixbit( 1, 0, 1, 3, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop( I , 0, 0, 1, 1, I2 ).


IMAGE RGB TO HEX
EJEMPLO 1:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRGBToHex( I1, I2).
EJEMPLO 2:
pixrgb( 0, 0, 48, 20, 255, 10, PA), pixrgb( 0, 1, 150, 22, 154, 20, PB), pixrgb( 1, 0, 17, 170,17, 30, PC), pixrgb( 1, 1, 96, 140, 244, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageCrop(I,0,1,0,1,I2),imageRGBToHex(I2, I3), imageIsHexmap(I3).
EJEMPLO 3:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2,[ P1, P2, P3, P4], I1), imageRotate90(I1,I2), imageRGBToHex( I2, I3).


HISTOGRAMA
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToHistogram( I, Histograma).
EJEMPLO 2:
pixhex(0,0,"#FF0000",1,PA), pixhex(0,1,"#00FF00",2,PB), pixhex(1,0,"#0000FF",3,PC), pixhex(1,1,"#FFFFFF",4,PD), image(2,2,[PA,PB,PC,PD],I), imageToHistogram( I, Histograma).
EJEMPLO 3:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image(2,2,[P1,P2,P3,P4],I), imageToHistogram( I, Histograma).


ROTATE90:
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2).
EJEMPLO 2:
pixhex( 0, 0, "#0A0A0A", 10, PA), pixhex( 0, 1, "#141414", 20, PB), pixhex( 1, 0, "#1E1E1E", 30, PC), pixhex( 1, 1, "#282828", 40, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90( I, I2).
EJEMPLO 3:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90(I, I2), imageRotate90(I2, I3), imageRotate90(I3, I4), imageRotate90(I4, I5).
EJEMPLO 4:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 1, 10, PB), pixbit( 1, 0, 1, 10, PC), pixbit( 1, 1, 1, 10, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90(I, I2).

IMAGECHANGEPIXEL:
EJEMPLO 1:  
pixhex( 0, 0, "FF0058", 10, PA), pixhex( 0, 1, "470850", 20, PB), pixhex( 1, 0, "FFFFFF", 30, PC), pixhex( 1, 1, "444444", 4, PD), image( 2, 2, [PA, PB, PC, PD], I),pixhex( 1, 1, "FAFAFA", 32, MOD),imageChangePixel(I,MOD,I2).
EJEMPLO 2:
pixhex( 0, 0, "FF0058", 10, PA), pixhex( 0, 1, "55555", 20, PB), pixhex( 1, 0, "787878", 30, PC), pixhex( 1, 1, "AAAAAA", 4, PD), image( 2, 2, [PA, PB, PC, PD], I),pixhex( 1, 1, "BFBFBF", 32, MOD),imageChangePixel(I,MOD,I2).
EJEMPLO 3:
pixhex( 0, 0, "CDCDCD", 10, PA), pixhex( 0, 1, "ABCDEF", 20, PB), pixhex( 1, 0, "FEDCBA", 30, PC), pixhex( 1, 1, "888888", 4, PD), image( 2, 2, [PA, PB, PC, PD], I),pixhex( 1, 1, "BBBBBB", 32, MOD),imageChangePixel(I,MOD,I2).

INVERTCOLORRGB:
EJEMPLO 1:
pixbit( 0, 0, 1, 17, PA),imageInvertColorRGB(PA,PIXNUEVO).
EJEMPLO 2:
pixrgb( 0, 0, 0,255,125, 17, PA),imageInvertColorRGB(PA,PIXNUEVO).
EJEMPLO 3:
pixrgb( 0, 0, 255,0,135, 17, PA),imageInvertColorRGB(PA,PIXNUEVO).
EJEMPLO 4:
pixhex( 0, 0, "CDCDCD", 10, PA),imageInvertColorRGB(PA,PIXNUEVO).
*/