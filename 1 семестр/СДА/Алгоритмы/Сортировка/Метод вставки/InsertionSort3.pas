Program InsertionSort3; //с использованием барьера
 const
  n=10;
 var
  a:array[0..n] of integer;
  i,j:integer;
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
   a[0]:=a[i]; j:=i;
    while (a[0]<a[j-1]) do
     begin
      a[j]:=a[j-1];
      j:=j-1;
     end;
   a[j]:=a[0];
  end;
  
 for i:=1 to n do
  write(a[i]:3);
end.