Program смещение1; //без использования доп. массивов
 const 
  n=10;
 var
  a:array[1..n] of integer;
  i,j,k,b:integer;
begin
  for i:=1 to n do
   begin
    a[i]:=i;
    write(a[i],' ');
   end;
 writeln; readln(k);
  
  for j:=1 to k do
    begin
      b:=a[1];
      
     for i:=2 to n do
       a[i-1]:=a[i];
       
      a[n]:=b;
    end;
    
  for i:=1 to n do
   write(a[i],' ');
end.