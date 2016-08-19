Program InsertionSort; // сортировка прямой вставкой №1
 const 
  n=10;
 var
  a:array[1..n] of integer;
  i,j,b,k:integer;
begin
 randomize;
  for i:=1 to n do
   begin
    write('a[',i,']= '); read(a[i]);//a[i]:=random(50); write(a[i]:3);
   end;
   for i:=1 to n do
    write(a[i]:3);
  writeln;
  
   
 for i:=2 to n do
  begin
   b:=a[i];
   
     j:=1;
    while b>a[j] do
     j:=j+1;
     
   for k:=i-1 downto j do
    a[k+1]:=a[k];
   
   a[j]:=b;
  end;
  
  
 for i:=1 to n do
  write(a[i]:3);
 readln;
end.