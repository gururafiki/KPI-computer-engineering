Program binsearch1; // находит случайный элемент
 const 
  n=10;
 var
  a:array[1..n] of integer;
  l,r,i,x:integer;
begin
  for i:=1 to n do
   begin
    write('a[',i,']= '); readln(a[i]);
   end;
   write('ћассив а: ');
  for i:=1 to n do
   write(a[i],' ');
 writeln; write('¬ведите искомый элемент: '); readln(x);
 
 
  L:=1; R:=n;
    while L<=R do
     begin
     
       i:=(L+R) div 2;
       
      if a[i]=x then break
      else
         if a[i]<x then L:=i+1
           else R:=i-1;
           
     end;
     
  if L<=R then writeln('элемент ',x,' на позиции ',i)
   else writeln('Ёлемент ',x,' не найдено');
   
  readln;
end.