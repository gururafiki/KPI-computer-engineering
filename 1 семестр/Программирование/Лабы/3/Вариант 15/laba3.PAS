Program laba3v15;
Uses 
   Crt;
const 
   n=6;
var
   A: array[1..n, 1..n] of real; 
   X: array[1..n] of real; 
   ip, jp: integer;
   
procedure MatA;
var
   i, j: integer;
begin
   for i:=1 to n do
      for j:=1 to n do
         a[i, j]:= -2 * (4.75 * i - 2.71 * j) + 8.11 * abs(2 * j - 5);
end;

procedure wrMatA;
var
   i, j: integer;
begin
   writeln('Matrica A:');
   for i:=1 to n do
   begin
      for j:=1 to n do
         write(' ', a[i, j]:8:2, ' ');
      writeln;
   end;
end;

procedure ij;
var
   i, j: integer;
begin
   for j:=1 to n do
      for i:=1 to n do
         if a[i, j] < 0 then 
         begin 
            ip:=i; 
            jp:=j; 
            exit;
         end;
end;
 
procedure MatX;
var 
   p, v:    real; 
   i, j, q: integer;
begin
   p:=0;
   
   for q:=1 to n do
      p:=p+a[q,jp];
   
   for j:=1 to n do
      p:=p+a[ip,j];
      
   x[n]:=p; 
   v:=(n + 1) / 2; 
   j:=trunc(v);
   
   for i:=1 to n - 1 do
      x[i]:=a[i, j];
      
   writeln('Matrica X:');
   for i:=1 to n do
      write(x[i]:7:2, ' ');
end;
 
procedure resultU;
var
   i:    integer;
   u, e: real;
begin
   u:=0; 
   e:=exp(1);
   
   for i:=1 to n do
      u:=u + (exp(ln(e) * (-x[i]))) * (ln(abs(x[i])));
      
   writeln;
   writeln;
   writeln('u=', u:3:3);
end;
begin
ClrScr;

 MatA;
 wrMatA;
 ij;
 writeln;
 writeln('Pervii otricatelnii element: i=', ip, ' j=', jp);
 writeln;
 MatX;
 resultU;

 readln;
end.




