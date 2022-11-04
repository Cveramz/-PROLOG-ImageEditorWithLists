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


VERIFICADOR DE RGB
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
EJEMPLO 2:
pixhex(0,0,"#FF0000",PA), pixhex(0,1,"#00FF00",PB), pixhex(1,0,"#0000FF",PC), pixhex(1,1,"#FFFFFF",PD), image(2,2,[PA,PB,PC,PD],I), imageIsPixmap(I).
EJEMPLO 3:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I), imageIsPixmap( I ).


VERIFICADOR DE HEX
EJEMPLO 1:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
EJEMPLO 2:
pixhex(0,0,"#FF0000",PA), pixhex(0,1,"#00FF00",PB), pixhex(1,0,"#0000FF",PC), pixhex(1,1,"#FFFFFF",PD), image(2,2,[PA,PB,PC,PD],I), imageIsPixmap(I).
EJEMPLO 3:
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I), imageIsPixmap( I ).


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

*/