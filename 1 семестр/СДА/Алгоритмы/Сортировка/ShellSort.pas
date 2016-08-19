Program SortShell;
 const
  n = 10;
  t = 3;
 var
  a:array[1..n] of integer;
  H:array[1..3] of integer;
  l,k,i,j,b:integer;
 begin
  randomize;
   for i:=1 to n do
    begin
     a[i]:=random(50);
     write(a[i]:3);
    end;
  writeln;
   
  H[1]:=4; H[2]:=2; H[3]:=1;
  
  for l:=1 to t do
   begin 
    k:=H[l];
     for i:=k+1 to n do
      begin
       b:=a[i]; j:=i;
        while (j>k) and (b<a[j-k]) do
         begin
          a[j]:=a[j-k];
          j:=j-k;
         end;
        a[j]:=b;
       end;
    end;
    
 for i:=1 to n do
  write(a[i]:3);
  writeln;
end.