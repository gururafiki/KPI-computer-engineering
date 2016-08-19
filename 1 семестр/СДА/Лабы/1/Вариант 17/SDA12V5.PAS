Program SDA12V5;
var 
   x, y: real;
begin
   repeat
      writeln('x');
      readln(x);
      if (x > -10) and (x <= -5) or (x > 5) and (x <= 15) then 
      begin
         y:=x * x * x - 6;
         writeln('y=', y)
      end
      else if x >= 25 then 
      begin
         y:=2 * x * x * x - 3 * x + 2;
         writeln('y=', y);
      end
      else 
         writeln('funcia ne isnue');
   until (x = -1);
   readln;
end.
