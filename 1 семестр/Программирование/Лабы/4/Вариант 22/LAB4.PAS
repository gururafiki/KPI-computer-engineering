Program Lab4;
Const iLenA=4;jLenA=4;
      iLenB=9;jLenB=5;
      iLenC=6;jLenC=6;
Type DynMatrix=array of array of integer;
Var A,B,C:DynMatrix;
Procedure MATRIX_VVOD(var name:DynMatrix; iLen:integer; jLen:integer);
var i,j:byte;
begin
    randomize;
    SetLength(name, iLen);
    for i:=0 to iLen-1 do
      begin
        SetLength(name[i], jLen);
        for j:=0 to jLen-1 do name[i,j]:=random(101)-50;
      end;
end;
Procedure MATRIX_MINMAX_TRANS(var name:DynMatrix; iLen:integer; jLen:integer);
var i,j:byte;
    xMax,yMax,xMin,yMin:byte;
begin
    for j:=0 to jLen-1 do
      begin
        xMax:=0;yMax:=j;
        xMin:=0;yMin:=j;
        for i:=1 to iLen-1 do
          begin
            if name[i,j]>name[xMax,yMax] then xMax:=i
            else
              if name[i,j]<=name[xMin,yMin] then xMin:=i
          end;
        name[xMax,yMax]:=name[xMax,yMax]+name[xMin,yMin];
        name[xMin,yMin]:=name[xMax,yMax]-name[xMin,yMin];
        name[xMax,yMax]:=name[xMax,yMax]-name[xMin,yMin];
      end;
end;
Procedure MATRIX_DISPLAY(name:DynMatrix; iLen:integer; jLen:integer);
var i,j:byte;
begin
    for i:=0 to iLen-1 do
      begin
        for j:=0 to jLen-1 do write(name[i,j], ' ');
        writeln;
      end;
end;
Begin
    writeln('Початкова матриця A:');
    MATRIX_VVOD(A,iLenA,jLenA);
    MATRIX_DISPLAY(A,iLenA,jLenA);
    writeln;
    writeln('Перетворена матриця A:');
    MATRIX_MINMAX_TRANS(A,iLenA,jLenA);
    MATRIX_DISPLAY(A,iLenA,jLenA);
    writeln;
    
    writeln('Початкова матриця B:');
    MATRIX_VVOD(B,iLenB,jLenB);
    MATRIX_DISPLAY(B,iLenB,jLenB);
    writeln;
    writeln('Перетворена матриця B:');
    MATRIX_MINMAX_TRANS(B,iLenB,jLenB);
    MATRIX_DISPLAY(B,iLenB,jLenB);
    writeln;
    
    writeln('Початкова матриця C:');
    MATRIX_VVOD(C,iLenC,jLenC);
    MATRIX_DISPLAY(C,iLenC,jLenC);
    writeln;
    writeln('Перетворена матриця C:');
    MATRIX_MINMAX_TRANS(C,iLenC,jLenC);
    MATRIX_DISPLAY(C,iLenC,jLenC);
End.