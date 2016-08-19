Program Lab6;
uses crt;
Const xMax=24;
      yMax=80;
      speed=20;
Var k,i,j:byte;
Begin
    for k:=1 to (xMax+1) div 2 do
      begin
        for i:=k to yMax-k+1 do
          begin
            Delay(speed);
            gotoxy(i,k);
            write('+');
          end;
        for j:=k+1 to xMax-k+1 do
          begin
            Delay(speed);
            gotoxy(i,j);
            write('-');
          end;
        for i:=yMax-k downto k do
          begin
            Delay(speed);
            gotoxy(i,j);
            write('*');
          end;
        for j:=xMax-k downto k+1 do
          begin
            Delay(speed);
            gotoxy(i,j);
            write('/');
          end;
      end;
      Delay(15000);
End.