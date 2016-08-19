Program Proga4v15;
const 
   n = 10; m = 15; k = 12;
type 
   vect = array[1..15] of real;
var 
   A, B, C: vect;

   procedure vvod(p: integer; name :char; var X: vect);
   var 
      i: integer;
      
   begin
      randomize;
      writeln(name,':');
      for i:=1 to p do 
      begin
         X[i]:=random * 50 - 25;
         write(x[i]:6:2, ' ');
      end;
      writeln;
   end;
  
   procedure change(p: integer; var X: vect);
   var 
      i: integer;
   begin
      for i:=1 to p do      
      if (i mod 3 = 0) then
         if (x[i-1] * x[i-2] < 0) then 
            x[i]:=(x[i-1] + x[i-2]) / 2;
   end;

procedure out(q: integer; x: vect);
var 
   i:integer;
begin
   for i:=1 to q do
      write(x[i]:6:2, ' ');
   writeln;
   writeln;
end; 
 
begin
 vvod(n,'A',A);
 change(n,A); 
 out(n,A);
 
 vvod(m,'B',B);
 change(m,B); 
 out(m,B);
 
 vvod(k,'C',C);
 change(k,C); 
 out(k,C);
 
 readln;
end.