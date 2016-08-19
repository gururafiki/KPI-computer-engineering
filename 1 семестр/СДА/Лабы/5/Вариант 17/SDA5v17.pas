Program SDA5v17;
Uses 
   Crt;
const 
   n = 7;
var 
   a: array[1..n, 1..n] of real; 
   i, j, ip, jp, ipp, jpp: integer; 
   s: real; 
   f: boolean;
begin
   ClrScr;
   randomize;
   for i:=1 to n do 
   begin
      for j:=1 to n do 
      begin
         a[i, j]:=random * 10 - 5;
         write(a[i, j]:4:1, ' ');
      end;
      writeln;
   end;
   writeln;
   write('Obhod po pobochnoi diagonali: ');
   
   f:=true;
   for i:=1 to n do
   if a[i, n-i+1] > 0 then 
   begin 
      ip:=i; 
      jp:=n - i + 1; 
      f:=not f; 
      break;
   end;
   if f = true then writeln('polozhitelnih net') else 
   begin
      
      for j:=1 to n do
         if a[n-j+1,j] < 0 then 
            begin 
               f:=not f; 
               ipp:=n - j + 1; 
               jpp:=j; 
               break; 
            end;
      if f = false then writeln('otricatelnix net') else 
      begin      
         write('pervoe polozhitelnoe: i=', ip, ' j=', jp, ';');
         writeln('  poslednee otricatelnoe: i=', ipp, ' j=', jpp);
         writeln;
         writeln('menyaem ih mestami:');
         s:=a[ip, jp]; 
         a[ip, jp]:=a[ipp, jpp]; 
         a[ipp, jpp]:=s;
         for i:=1 to n do 
         begin
            for j:=1 to n do
               write(a[i, j]:4:1, ' ');
            writeln;
         end;
      end;
   end;
   readln;
end.
