Program bubblesort2; // алгоритм с использованием флажка
 const
  n=20;
 var
  a:array[1..n] of integer;
  i,r,b:integer;
  f:boolean;
begin
 randomize;
  for i:=1 to n do
   begin
    a[i]:=random(100)-50;
    write(a[i],' ');
   end;
  writeln;
 
   r:=n; f:=true;
 while f=true do
  begin
      f:=false;
     for i:=1 to r-1 do
     
       if a[i]>a[i+1] then 
        begin 
          b:=a[i];
          a[i]:=a[i+1];
          a[i+1]:=b;
          f:=true;
        end;
       
     r:=r-1;
  end;
       
 for i:=1 to n do
  write(a[i],' ');

end.