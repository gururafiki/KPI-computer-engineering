Program Lab6;
uses crt;
Const xMax=24;
      yMax=80;
      speed=10;
Var k,i,j:byte;
Begin
    clrscr;
    for k:=1 to (xMax+1) div 2 do
      begin
        for i:=yMax-k+1 downto k do
          begin
            gotoxy(i,xMax-k+1);
            write('*');
            Delay(speed);
          end;
        for j:=xMax-k downto k do
          begin
            gotoxy(i,j);
            write('/');
            Delay(speed);
          end;
        for i:=k+1 to yMax-k+1 do
          begin
            gotoxy(i,k);
            write('+');
            Delay(speed);
          end;
        for j:=k+1 to xMax-k do
          begin
            gotoxy(i,j);
            write('-');
            Delay(speed);
          end;
      end;
    readln;
End.