Program Lab9;
uses crt;
Const xMax=24;
      yMax=80;
      speed=2500;
Var k,i,j:byte;
Begin
    clrscr;
    for k:=(xMax+1) div 2 downto 1 do
      begin
        for i:=k to yMax-k do
          begin
            gotoxy(i,xMax-k+1);
            write('*');
            Delay(speed);
          end;
        for j:=xMax-k downto k do
          begin
            gotoxy(i,j);
            write('-');
            Delay(speed);
          end;
        for i:=yMax-k-1 downto k-1 do
          begin
            gotoxy(i,k);
            write('+');
            Delay(speed);
          end;
        if k<>1 then
          for j:=k+1 to xMax-k+1 do
            begin
              gotoxy(i,j);
              write('/');
              Delay(speed);
            end;
      end;
    readln;
End.