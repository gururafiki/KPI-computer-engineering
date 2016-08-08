Program Lab4WithArray;
Const n=5;
Type Vect=array[1..4*n] of integer;
Var A:Vect;
    B:array[1..n] of integer;
    i:byte;
Procedure VECTOR_DISPLAY(name:Vect);
var i:byte;
begin for i:=1 to 4*n do write(name[i], ' ');writeln; end;
Begin
    randomize;
    for i:=1 to 4*n do A[i]:=random(101)-50;
    writeln('The original array A:');
    VECTOR_DISPLAY(A);
    for i:=1 to n do
      begin
        B[n-i+1]:=A[n+i];
        A[n+i]:=A[3*n+i];
        A[3*n+i]:=A[2*n+i];
      end;
    for i:=1 to n do
      begin
        A[2*n+i]:=B[i];
        B[i]:=A[n-i+1];
      end;
    for i:=1 to n do A[i]:=B[i];
    writeln;writeln('Converted array A:');
    VECTOR_DISPLAY(A);
	readln;
End.