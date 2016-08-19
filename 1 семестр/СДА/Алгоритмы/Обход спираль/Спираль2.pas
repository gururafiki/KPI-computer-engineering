Program спираль2; //НЕсимметрический способ
 Uses Crt;
 const 
   n=11; t=60;
 var
   i,j,p:integer;
   a:array[1..n,1..n] of integer; // тут без матрицы, поэтому она-то и не нужна здесь, но если с матрицей - нужно менять местами координаты
 begin
 
  for p:=1 to ((n+1) div 2) do
   begin
   
{1} for j:=p to n-p+1 do
     begin
      GoToXY(j,p); delay(t); write('*');
     end;
      
{2} for i:=p+1 to n-p+1 do
     begin
      gotoxy(n-p+1,i); delay(t); write('*');
     end;
     
{3} for j:=n-p downto p do
     begin
      gotoxy(j,n-p+1); delay(t); write('*');
     end;
     
{4} for i:=n-p downto p+1 do
     begin
      gotoxy(p,i); delay(t); write('*');
     end;
     
   end;
 
   readln;
 end.