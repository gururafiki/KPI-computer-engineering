Program SDA4v17_2;
Uses 
   Crt;
const 
   n = 3;
var 
   A: array[1..4*n] of integer; 
   i, j, k: integer;
begin
   ClrScr;
   randomize;
   write('Matrica  A:');
   for i:=1 to 4*n do
   begin
      a[i]:=random(50);
      write(a[i]:3);
   end;
   writeln;
   
   for j:=1 to n do
   begin
      k:=a[1];
      for i:=2 to 4*n do
         a[i-1]:=a[i];
      a[4*n]:=k;
   end;
   
   for i:=n+2 to 2*n+1 do
   begin
      k:=a[3*n+1-i+n+1];
      a[3*n+2-i+n]:=a[i-1];
      a[i-1]:=k;
   end;
   
   write('Matrica<A>:');
   for i:=1 to 4*n do
      write(a[i]:3);
   readln;
end.



