Program SDA1V5;
var 
   x, y: real;
begin
   repeat
      writeln('x');
      readln(x);
      if x <= -10 then writeln('funcia ne isnue')
      else 
         if x <= -5 then 
         begin
            y:=(x * x * x) - 6;
            writeln('y=', y)
         end
         else if x <= 5 then writeln('funcia ne isnue')
         else if x <= 15 then 
         begin
            y:=(x * x * x) - 6;
            writeln('y=', y)
         end
         else if x < 25 then writeln('funcia ne isnue')
         else 
         begin
            y:=(2 * x * x * x) - (3 * x) + 2;
            writeln('y=', y);
         end;
   until (x = -1);
   readln;
end.
