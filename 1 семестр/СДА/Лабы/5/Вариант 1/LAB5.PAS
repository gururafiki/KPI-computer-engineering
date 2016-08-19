Program Lab5;
Const m=7;
      n=8;
      e=0.001;
Type Matrix=array[1..m,1..n] of real;
Var A:Matrix;
    X:real;
    i,j,k,l:byte;
    b:boolean;
Begin
    randomize;
    writeln('An array of real numbers:');
    for i:=1 to m do
      begin
        for j:=1 to n do
          begin
            A[i,j]:=100*random-50;
            write(trunc(A[i,j]/e)*e:5:3, ' ');
          end;
        writeln;
      end;
    
    writeln;writeln('Enter required number:');
    Write('X=');Readln(X);b:=false;
    for i:=1 to m do
      begin
        for j:=1 to n do
            if trunc(A[i,j]/e)=trunc(X/e) then
              begin
                b:=true;
                break;
              end;
        if b then
          begin
            writeln('It is located in the cell [',i,',',j,'].');
            b:=false
          end;
      end;
End.