Program SDA_6_v17;
Uses 
   Crt;
const 
   n = 80; 
   m = 24; 
   t = 2;
var 
   x, y, z: integer;
begin
   ClrScr; 
   x:=1; 
   y:=1; 
   z:=-1;
   repeat
      if (y = 1) or (y = m) then
      begin
         delay(t); 
         gotoxy(x, y); 
         writeln('*');
         
         if (x <> 1) and (x <> n) then inc(x)
         else inc(y);
         
         z:=-z;
      end 
      else
         if (x = 1) or (x = n) then
         begin
            delay(t); 
            gotoxy(x, y); 
            writeln('*');
            inc(y);
            z:=-z;
         end;
      
      delay(t); 
      gotoxy(x,y); 
      writeln('*');
      
      if (y = m) and (x = n) then break;
      x:=x + z;
      y:=y - z;
   until false;
   readln;
end.