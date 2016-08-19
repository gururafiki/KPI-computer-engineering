Program QuickSorting;
 const
  n = 16;
 var
  a: array [1..n] of integer;
 procedure fillingArray;
  var
   i: integer;
  begin
   randomize;
  for i:=1 to n do
   begin
    a[i]:= random(50);
    write(a[i]:3);
   end;
  end;
  
 procedure Qsort (L, R: integer);
  var
   x, b, i, j: integer;
  begin
   x:= a[(L+R) div 2];
   
   i:=L; j:=R;
    while (i < j) do
     begin
     
      while a[i] < x do
       inc(i);
       
      while a[j] > x do
       dec(j);
       
      if (i <= j) then
       begin
        b:= a[i];
        a[i]:=a[j];
        a[j]:=b;
        inc(i);
        dec(j);
       end;
       
     end;  // i < j
     
    if (L < j) then
     Qsort(L, j);
    if (i < R) then
     Qsort(i, R);
  end;
 
 procedure outArray;
  var
   i: integer;
  begin
   writeln;
   for i:=1 to n do
    write(a[i]:3);
  end; 
   
begin //main
 fillingArray;
 Qsort(1, n);
 outArray;
end.