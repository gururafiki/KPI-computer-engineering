Program InsertionSort2; // ¹2
 const
  n = 10;
 var
  a:array[1..n] of integer;
  b,i,j:integer;
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
   b:=a[i];
    j:=i;
   while (j>1) and (b<a[j-1]) do
    begin
     a[j]:=a[j-1];
     j:=j-1;
    end;
   a[j]:=b;
  end;
  
 for i:=1 to n do
  write(a[i]:3);
end.