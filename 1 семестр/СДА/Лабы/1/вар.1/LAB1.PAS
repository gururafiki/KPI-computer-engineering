Program Lab1;
Var x,y:real;
Begin
  write('x=');
  readln(x);
  if(x>=-49) then
    if(x<-10) then
      begin
        y:=10*x*x*x+7*x/5+2;
        writeln('y=', y:5:4);
      end
    else
      if(x>0) then
        if(x<=10) then
          begin
            y:=10*x*x*x+7*x/5+2;
            writeln('y=', y:5:4);
          end
        else
          if(x>20) then
            begin
              y:=-x+9;
              writeln('y=', y:5:4);
            end
          else writeln('y - does not exist')
      else writeln('y - does not exist')
  else writeln('y - does not exist');
  writeln;
End.