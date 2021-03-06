MODULE Linie;

IMPORT XYplane := oocXYplane, In := compatIn;

VAR abbruch: BOOLEAN; 
Zaehler,Wert1, Wert2, Wert3, Wert4,Wert5, Wert6, Wert7, Wert8,Ende: INTEGER;

(* Version 1.0 / 6.April 96 / Peter Brantschen *)

PROCEDURE Linie*(StartX,StartY,EndeX,EndeY: INTEGER);

VAR i,x,y,LaengeX,LaengeY: INTEGER;


BEGIN
LaengeX:=EndeX-StartX;
LaengeY:=EndeY-StartY;
IF LaengeX>=0 THEN
  IF LaengeY>=0 THEN
    FOR i:=0 TO LaengeX DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,1);
      END;
    END;
    FOR i:=0 TO LaengeY DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,1);
      END;
    END;
  ELSE
    FOR i:=0 TO LaengeX DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,1);
      END;
    END;
    FOR i:=LaengeY  TO 0 DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,1);
      END;
    END;
  END;
ELSE
  IF LaengeY>=0 THEN
    FOR i:=LaengeX TO 0 DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,1);
      END;
    END;
    FOR i:=0 TO LaengeY DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,1);
      END;
    END;
  ELSE
    FOR i:=LaengeX TO 0 DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,1);
      END;
    END;
    FOR i:=LaengeY  TO 0 DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,1);
      END;
    END;
  END;
END;

END Linie;

PROCEDURE LoescheLinie*(StartX,StartY,EndeX,EndeY: INTEGER);

VAR i,x,y,LaengeX,LaengeY: INTEGER;


BEGIN
LaengeX:=EndeX-StartX;
LaengeY:=EndeY-StartY;
IF LaengeX>=0 THEN
  IF LaengeY>=0 THEN
    FOR i:=0 TO LaengeX DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,0);
      END;
    END;
    FOR i:=0 TO LaengeY DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,0);
      END;
    END;
  ELSE
    FOR i:=0 TO LaengeX DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,0);
      END;
    END;
    FOR i:=LaengeY  TO 0 DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,0);
      END;
    END;
  END;
ELSE
  IF LaengeY>=0 THEN
    FOR i:=LaengeX TO 0 DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,0);
      END;
    END;
    FOR i:=0 TO LaengeY DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,0);
      END;
    END;
  ELSE
    FOR i:=LaengeX TO 0 DO;
      IF LaengeX#0 THEN 
        x:=StartX+i;
        y:=StartY + (i*LaengeY)DIV LaengeX;
        XYplane.Dot(x,y,0);
      END;
    END;
    FOR i:=LaengeY  TO 0 DO;
      IF LaengeY#0 THEN 
        x:=StartX + (i*LaengeX) DIV LaengeY;
        y:=StartY + i;
        XYplane.Dot(x,y,0);
      END;
    END;
  END;
END;

END LoescheLinie;


PROCEDURE Fraktal(x1,y1,x2,y2: INTEGER);

BEGIN;
IF ~abbruch THEN
  INC(Zaehler);
  IF Zaehler>Ende THEN abbruch:=TRUE; END;
  Linie(x1,y1,x2,y2);
  Fraktal(x1+ Wert1,y1+Wert2,x2+Wert3,y2+Wert4);
END;

END Fraktal;

PROCEDURE Fraktal4Eck(x1,y1,x2,y2,x3,y3,x4,y4: INTEGER);

BEGIN
IF ~abbruch THEN
  INC(Zaehler);
  IF Zaehler>Ende THEN abbruch:=TRUE; END;
  Linie(x1,y1,x2,y2);
  Linie(x2,y2,x3,y3);
  Linie(x3,y3,x4,y4);
  Linie(x4,y4,x1,y1);
  Fraktal4Eck(x1+ Wert1,y1+Wert2,x2+Wert3,y2+Wert4,x3+ Wert5,y3+Wert6,x4+Wert7,y4+Wert8);
END;

END Fraktal4Eck;

PROCEDURE Start*;

BEGIN
  XYplane.Open;
  In.Open;
  In.Int(Wert1); In.Int(Wert2); In.Int(Wert3); In.Int(Wert4);In.Int(Ende);
  abbruch:=FALSE;
  Zaehler:=0;
  Fraktal(150,150,250,250);
END Start;

PROCEDURE Start4Eck*;

BEGIN
  XYplane.Open;
  In.Open;
  In.Int(Wert1); In.Int(Wert2); In.Int(Wert3); In.Int(Wert4);
  In.Int(Wert5); In.Int(Wert6); In.Int(Wert7); In.Int(Wert8);In.Int(Ende);
  abbruch:=FALSE;
  Zaehler:=0;
  Fraktal4Eck(150,150,150,250,250,250,250,150);
END Start4Eck;

END Linie.


  
