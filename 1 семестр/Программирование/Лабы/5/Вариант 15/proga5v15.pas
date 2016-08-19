Program Laba5v15;
const 
   n=10;
type
   anketa = record
      p, i , b: string;
      proga, sda, matan, lineika: integer;
   end;
   spisok = array[1..n] of anketa;
   massiv = array[1..n,1..4] of boolean; {po ocenkam, 4 predmeta}
var
   group: spisok;
   smart: massiv;
   
Procedure readfile(n: integer; var x: spisok);
var
   f: text;
   i: integer;
   ch: char;
begin
   assign(f, 'FILE.txt');
   reset(f);  
   for i:=1 to n do
   begin
      read(f, ch);
      while(ch <> ' ') do
      begin
         x[i].p:=x[i].p + ch;
         read(f, ch);
      end;
      
      read(f, ch);
      while(ch <> ' ') do
      begin
         x[i].i:=x[i].i + ch;
         read(f, ch);
      end;
      
      read(f, ch);
      while(ch <> ' ') do
      begin
         x[i].b:=x[i].b + ch;
         read(f, ch);
      end;
      
      read(f, x[i].proga);
      read(f, x[i].sda);
      read(f, x[i].matan);
      read(f, x[i].lineika);  
   end;
   close(f);
end;
Procedure sort(n: integer; x: spisok; var m: massiv);
var
   i:integer;
begin
   for i:=1 to n do
   begin
      if x[i].proga = 5 then m[i, 1]:=true
      else m[i, 1]:=false;
      
      if x[i].sda = 5 then m[i, 2]:=true
      else m[i, 2]:=false;
      
      if x[i].matan = 5 then m[i, 3]:=true
      else m[i, 3]:=false;
      
      if x[i].lineika = 5 then m[i, 4]:=true
      else m[i, 4]:=false;
   end;
end;

Procedure vivod(m: massiv);
var
   i, j, k: integer;
begin 
   writeln('Вiдмiнники з дисциплiни "Програмування":');
   for i:=1 to n do
      if m[i, 1] = true then write(group[i].p, ' ', group[i].i, ' ', group[i].b, ' ', group[i].proga, ' ', group[i].sda, ' ', group[i].matan, ' ', group[i].lineika);
   writeln; writeln; 
   
   writeln('Вiдмiнники з дисциплiни "СДА":');
   for i:=1 to n do
      if m[i, 2] = true then write(group[i].p, ' ', group[i].i, ' ', group[i].b, ' ', group[i].proga, ' ', group[i].sda, ' ', group[i].matan, ' ', group[i].lineika);
   writeln; writeln;   
   
   writeln('Вiдмiнники з дисциплiни "Математичний аналiз":'); 
   writeln;
   for i:=1 to n do
      if m[i, 3] = true then write(group[i].p, ' ', group[i].i, ' ', group[i].b, ' ', group[i].proga, ' ', group[i].sda, ' ', group[i].matan, ' ', group[i].lineika);
   writeln; writeln;   
   
   writeln('Вiдмiнники з дисциплiни "Лiнiйна алгебра":');
   for i:=1 to n do
      if m[i, 4] = true then write(group[i].p, ' ', group[i].i, ' ', group[i].b, ' ', group[i].proga, ' ', group[i].sda, ' ', group[i].matan, ' ', group[i].lineika);
   writeln; writeln; 
   
   writeln('Повнi вiдмiнники:');
   for i:=1 to n do
   begin
      k:=0;
      for j:=1 to 4 do 
         if m[i, j] = true then k:=k + 1;
      if k = 4 then write(group[i].p, ' ', group[i].i, ' ', group[i].b, ' ', group[i].proga, ' ', group[i].sda, ' ', group[i].matan, ' ', group[i].lineika);
   end;
end;
begin
   readfile(n, group);
   sort(n, group, smart);
   vivod(smart);
   readln;
end.