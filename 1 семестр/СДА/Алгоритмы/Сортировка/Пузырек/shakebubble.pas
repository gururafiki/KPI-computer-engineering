Program shakebubble; // шейкерная сортировка
 const
  n=10;
 var
  a:array[1..n] of integer;
  b,k,l,r,i:integer;
begin
 randomize;
  for i:=1 to n do
   begin
    a[i]:=random(100)-50;
    write(a[i],' ');
   end;
  writeln;
  
 r:=n; l:=1; k:=1;
 
  while l<r do
   begin
    
     for i:=l to r-1 do
      if (a[i]>a[i+1]) then
       begin
        b:=a[i];
        a[i]:=a[i+1];
        a[i+1]:=b;
        k:=i;
       end;
    r:=k;
    
      for i:=r-1 downto l do
       if (a[i]>a[i+1]) then
        begin
         b:=a[i];
         a[i]:=a[i+1];
         a[i+1]:=b;
         k:=i;
        end;
     l:=k;
     
    end;
    
 for i:=1 to n do
  write(a[i],' ');
   
end.