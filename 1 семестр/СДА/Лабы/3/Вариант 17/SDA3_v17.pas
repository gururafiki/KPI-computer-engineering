Program SDA3_v17;
const 
   n = 10;
var 
   a, b, r: real; 
   i, p: integer; 
   y, z: array[1..n] of real;
procedure massivY;
begin
   randomize;
   readln(a, b);
   write('Y: ');
   for i:=1 to n do
   begin
      y[i]:=random * 100 - 50;
      write(y[i]:3:0, ' ');
   end;
   writeln;
end;

procedure massivZ;
begin
   write('Z: ');
   for i:=1 to n do
   begin
      if (-15 <= y[i]) and (25 >= y[i]) then
         z[i]:=y[i] + a * b
      else
         z[i]:=2 * a + 3 * b;
      write(z[i]:3:0, ' ');
   end;
   writeln;
end;
 
procedure resultR;
begin
   p:=1; 
   r:=1;
   for i:=1 to n do
   begin
      R:=r * p * (6 * b * z[i] - sqr(i) * a);
      p:=-p;
   end;
   writeln('R=', r:1:3);
end;
begin
   writeln('a,b');
   massivY;
   massivZ;
   resultR;
   readln;
end.