Program Lab3;
Const a=-1.5;
      b=3.4;
      n=5;
Type Vect=array[1..n] of real;
Var Y,Z:Vect;
    i:byte;f:integer;
    R,m:real;
Procedure VECTOR_DISPLAY(name:Vect);
var i:byte;
begin
    for i:=1 to n do write(name[i]:3:3, ' ');writeln;
end;
Begin
    randomize;
    for i:=1 to n do
      begin
        Y[i]:=100*random-50;
        if (Y[i]<11) or (Y[i]>33) then Z[i]:=Y[i]+5*b
        else Z[i]:=Y[i]-10*a;
      end;
    f:=-1;R:=f*a*Z[1];
    for i:=2 to n do
      begin
        f:=-f;m:=f*a*Z[i];
        if R>m then R:=m;
      end;
    write('Y[n]:');VECTOR_DISPLAY(Y);
    write('Z[n]:');VECTOR_DISPLAY(Z);
    write('R=');write(R:3:3);
    readln;
End.