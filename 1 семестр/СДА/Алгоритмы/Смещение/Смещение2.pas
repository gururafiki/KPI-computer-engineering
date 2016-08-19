Program смещение2; // с использоанием массива = n
 const 
  n=10;
 var
  a,b:array[1..n] of integer;
  i,k:integer;
 begin
  for i:=1 to n do
   begin
    a[i]:=i;
    write(a[i],' ');
   end;
 writeln; readln(k);
  
  
  for i:=k+1 to n do
    b[i-k]:=a[i];
    
  for i:=1 to k do
   b[n-k+i]:=a[i];
   
  for i:=1 to n do
   a[i]:=b[i];
  
  
  for i:=1 to n do
   write(a[i],' ');
 
end.