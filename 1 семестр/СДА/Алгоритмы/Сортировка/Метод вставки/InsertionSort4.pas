Program InsertionSort4; // с двоичным поиска места вставки 
 const
  n = 10;
 var
  a:array[1..n] of integer;
  x,i,l,r,j,k:integer;
begin
 randomize;
  for i:=1 to n do
   begin
    a[i]:=random(50);
    write(a[i]:3);
   end;
 writeln;
   
 for i:=2 to n do
  begin
   x:=a[i];
   L:=1; R:=i;
    while L<R do
     begin
      j:=((L+R) div 2);
       if (a[j]<=x) then
        L:=j+1
       else
        R:=j;
     end;
    
   for k:=i-1 downto R do
     a[k+1]:=a[k];
     
    a[R]:=x;
  end;
  
 for i:=1 to n do
  write(a[i]:3);
end.