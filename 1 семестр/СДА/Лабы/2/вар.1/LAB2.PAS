Program Lab2;
Var S,P:double;
    i,j,n,a:integer;
Begin
    write('n=');
    readln(n);
    S:=0;
    for i:=1 to n do
        begin
          P:=1;a:=1;
          for j:=1 to i do
              begin
                a:=a*4;
                P:=P*(j+cos(j));
              end;
          S:=S+(a-i)/P;
        end;
    writeln('S=', S:4:7);
    readln;
End.