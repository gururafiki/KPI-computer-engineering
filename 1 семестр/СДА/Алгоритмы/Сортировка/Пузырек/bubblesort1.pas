Program bubblesort1; // простой алгоритм прямого обмена
 const
  n=20;
 var
  a:array[1..n] of integer;
  i,r,b:integer;
begin
 randomize;
  for i:=1 to n do
   begin
    a[i]:=random(100)-50;
    write(a[i],' ');
   end;
  writeln;
 
 for r:=n downto 2 do
  
   for i:=1 to r-1 do
    
     if a[i]>a[i+1] then
       begin
         b:=a[i];
         a[i]:=a[i+1];
         a[i+1]:=b;
       end;
       
 for i:=1 to n do
  write(a[i],' ');

end.