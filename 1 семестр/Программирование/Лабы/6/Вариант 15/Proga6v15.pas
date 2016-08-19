Program proga6v15;
const
   smallset = ['a'..'z'];
var
   st: string;
   
Procedure change(var st: string);
var
   i: integer;
   ch: char;
begin
   i:=1;
   while i < length(st) do
   begin
      while st[i] <> ' ' do
      begin 
         if (st[i] in smallset) and (st[i+1] in smallset) then
         begin
            ch:=st[i];
            st[i]:=st[i+1];
            st[i+1]:=ch;
         end;
         inc(i, 2);
         if i >= length(st) then break;
      end;    
      inc(i);
   end;   
end;
begin
 readln(st);
 change(st);
 writeln(st);
end.