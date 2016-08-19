Program SDA2v17_2;
var 
   s, p: real; 
   i, n: integer;
begin
   writeln('n');
   readln(n);
   s:=0; 
   p:=1 + cos(1);
   for i:=1 to n do
   begin
   s:=s + p / (exp(ln(4) * i) - i);
   p:=p * (i + 1 + cos(i + 1));   
   end;
   
   writeln('s=', s:1:7);
   readln;
end.