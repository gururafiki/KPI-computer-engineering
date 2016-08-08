Program Lab2DynamicProg;
Var S,P:double;
    i,n,a:integer;
Begin
    write('n=');
    readln(n);
    S:=0;P:=1;a:=1;
    for i:=1 to n do
        begin
          a:=a*4;
          P:=P*(i+cos(i));
          S:=S+(a-i)/P;
        end;
    writeln('S=', S:4:7);
    readln;
End.