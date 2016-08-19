Program Lab3;
Const n=6;
Type Matrix=array[1..n,1..n] of real;
     Vect=array[1..n] of real;
Var A,B:Matrix;
    X:Vect;
Procedure MATRIX_CALC(var name:Matrix);
var i,j:byte;
begin
    for i:=1 to n do
        for j:=1 to n do
            name[i,j]:=2*exp(i)-0.879*i*i+13.2*j;
end;
Procedure VECTOR_CALC(name1:Matrix; var name2:Matrix; var name3:Vect);
var i,j:byte;
begin
    for i:=1 to n-1 do
        for j:=1 to n-i do
          begin
              name2[i,j]:=name1[n-j+1,n-i+1];
              name2[n-j+1,n-i+1]:=name1[i,j];
          end;
    for i:=1 to n do
      begin
        name2[n-i+1,i]:=name1[n-i+1,i];
        name3[i]:=name2[3,i];
      end;
end;
Procedure MATRIX_DISPLAY(name:Matrix);
var i,j:byte;
begin
    for i:=1 to n do
      begin
        for j:=1 to n do write(name[i,j]:3:4, ' ');
        writeln;
      end;
end;
Procedure VECTOR_DISPLAY(name:Vect);
var i:byte;
begin
    for i:=1 to n do write(name[i]:3:4, ' ');writeln;
end;
Function FUNC_CALC(name:Vect):real;
var i:byte;
    S:real;
begin
    for i:=1 to n do S:=S+sqrt(abs(name[i]-1));
    FUNC_CALC:=S;
end;
Begin
    MATRIX_CALC(A);
    VECTOR_CALC(A,B,X);
    writeln('Початкова матриця:');
    MATRIX_DISPLAY(A);
    writeln;writeln('Транспонована матриця:');
    MATRIX_DISPLAY(B);
    writeln;writeln('Отриманий вектор:');
    VECTOR_DISPLAY(X);
    writeln;writeln('Результат функції:');
    write(FUNC_CALC(X):3:4);
End.