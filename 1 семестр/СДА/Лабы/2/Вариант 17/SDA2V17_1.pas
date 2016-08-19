Program SDA2v17_1;
var 
   i, n, j: integer; 
   s, p: real;
begin
   writeln('n');
   readln(n);
   if n <= 0 then writeln('nevernoe znachenie') 
   else
      begin
         s:=0;
         for i:=1 to n do
         begin
            p:=1;
            for j:=1 to i do   
               p:=p * (j + cos(j));
            s:=s + (p / (exp(ln(4) * i) - i));
         end;
         writeln('s=', s:1:7);
      end;
   readln;
end.