Program Lab2;
Const a=-6;
      b=-1;
      n=7;
      h=(b-a)/n;
Var x:real;
    i,j:integer;
Function F17(x:real):real;
begin
    F17:=exp(-(x-3));
end;
Function F22(x:real):real;
begin
    F22:=x*sqrt(exp(ln(abs(13*x-6))*3));
end;
Function F29(x:real):real;
begin
    F29:=exp(ln(x+10)*5);
end;

Begin
    Write(' '); for j:=1 to 83 do Write('_'); Writeln;
    Writeln('|', 'Функцiї однiєї змiнної':52, '|':32);
    Write('|');
    for j:=1 to 83 do
        if(j mod 21) = 0 then Write(' ')
        else Write('_');
    Writeln('|');
    Writeln('|', 'Аргумент Х':20, '|', 'e^(-(x-3))':20, '|', 'x*(|13*x-6|^3)^(1/2)':20, '|', '(x+10)^5':20, '|');
	
    for i:=0 to n do
        begin
          for j:=0 to 84 do
              if(j mod 21 = 0) then Write('|')
              else Write('_');
          Writeln;
          x:=a+i*h;
          Writeln('|', x:20:4, '|', F17(x):20:4, '|', F22(x):20:4, '|', F29(x):20:4, '|');
        end;
    for i:=0 to 84 do
        if(i mod 21) = 0 then Write('|')
        else Write('_');
    Writeln;
    Writeln('|', 'Склав: Базильський Л.О., КВ-51':82, '|':2);
    Write('|'); for j:=1 to 83 do Write('_'); Write('|');
    Readln;
End.