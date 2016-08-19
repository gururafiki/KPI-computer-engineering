Program SDA4v17_1;
const 
   n = 5;
var 
   A: array[1..4*n] of integer; 
   B: array[1..n] of integer; 
   i: integer;
begin
   randomize;
   write('Massiv A:  ');
   for i:=1 to 4 * n do
   begin
      a[i]:=random(50);
      write(a[i]:4);
   end;
   writeln;
   writeln;
   
   for i:=1 to n do
   begin
      b[i]:=a[i];
      a[i]:=a[i+n];
      a[i+n]:=a[4*n+1-i];
   end;
   
   
   for i:=1 to n do
   begin
      a[3*n+i]:=b[i];
      b[i]:=a[2*n+i];
   end;
   
   for i:=1 to n do
   a[2*n+i]:=b[n-i+1];
   
   write('Massiv <A>:');
   for i:=1 to 4*n do
      write(a[i]:4);
   readln;
end.