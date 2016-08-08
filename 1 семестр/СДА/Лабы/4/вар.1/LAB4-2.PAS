Program Lab4;
Const n=5;
Type Vect=array[1..4*n] of integer;
Var A:Vect;
    b:integer;
    i:byte;
Procedure VECTOR_DISPLAY(name:Vect);
var i:byte;
begin for i:=1 to 4*n do write(name[i], ' ');writeln; end;
Begin
    randomize;
    for i:=1 to 4*n do A[i]:=random(101)-50;
    writeln('The original array A:');
    VECTOR_DISPLAY(A);
    for i:=1 to trunc(n/2) do
      begin
        b:=A[i];
        A[i]:=A[n-i+1];
        A[n-i+1]:=b;
        b:=A[n+i];
        A[n+i]:=A[2*n-i+1];
        A[2*n-i+1]:=b;
      end;
    for i:=1 to n do
      begin
        b:=A[n+i];
        A[n+i]:=A[2*n+i];
        A[2*n+i]:=b;
        b:=A[n+i];
        A[n+i]:=A[3*n+i];
        A[3*n+i]:=b;
      end;
    writeln;writeln('Converted array A:');
    VECTOR_DISPLAY(A);
	readln;
End.