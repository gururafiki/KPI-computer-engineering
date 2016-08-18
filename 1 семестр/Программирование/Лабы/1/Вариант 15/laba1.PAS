Program klaba1;
 var 
   a, b, x, y, z: real;
 begin
   writeln('x, y, z');
   readln(x,y,z);
  
   if cos(x)=0 then writeln('nedopustimoe dlya a')
      else 
         if cos(y)=0 then writeln('nedopustimoe dlya a')
      else 
         begin
          a:=exp(ln(abs(sin(x)/cos(x) + sin(y)/cos(y))) * (1 + 2*sqr(sin(y))));
          writeln('a = ',a); 
         end;
          
   if x=0 then writeln('nedopustimoe dlya b')
      else 
   if y=0 then writeln('nedopustimoe dlya b')
      else 
        begin
         b:=1 + z + ((z*z)/x) + ((z*z*z)/y);
         writeln('b = ', b);
        end;
        
   readln;
 end.