Program alg4; // с сохранением значений средних элементов массива
 const
  n=12;
  k=5;
 var
  a:array[1..n] of integer;
  b:array[1..(n-2*k)] of integer;
  i:integer;
begin
 for i:=1 to n do 
  begin
   a[i]:=i; write(a[i],' ');
  end;
 writeln;
 
  
 for i:=k+1 to n-k do
  b[i-k]:=a[i];
  
 for i:=1 to k do
  begin
   a[k+i]:=a[i];
   a[i]:=a[n-k+i];
  end;
  
 for i:=1 to n-2*k do
  a[2*k+i]:=b[i];
  
  
 for i:=1 to n do
  write(a[i],' ');
end.