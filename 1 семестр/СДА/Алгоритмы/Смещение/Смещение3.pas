Program смещение3; //с массивом = k
 const 
  n=8; k=6;
 var
  a:array[1..n] of integer;
  b:array[1..k] of integer;
  i:integer;
 begin
  for i:=1 to n do
   begin
    a[i]:=i;
    write(a[i],' ');
   end;
 writeln; 
  
  
  for i:=1 to k do
   b[i]:=a[i];
   
  for i:=k+1 to n do
   a[i-k]:=a[i];
   
  for i:=1 to k do
   a[n-k+i]:=b[i];
  
  
  for i:=1 to n do
   write(a[i],' ');
 end.