Program SelectionSort; // метод прямого выбора
 const 
  n=20;
 var
  a:array[1..n] of integer;
  i,s,imin,min:integer;
begin
 randomize;
  for i:=1 to n do
   begin
    a[i]:=random(100)-50;
    write(a[i]:3);
   end;
  writeln;
   
 for s:=1 to n-1 do
  begin
  
    min:=a[s];
    imin:=s;
    
   for i:=s+1 to n do
    if a[i]<min then 
      begin
       min:=a[i];
       imin:=i;
      end;
      
     a[imin]:=a[s];
     a[s]:=min;
  end;
  
 for i:=1 to n do
  write(a[i]:3);
  
end.
   