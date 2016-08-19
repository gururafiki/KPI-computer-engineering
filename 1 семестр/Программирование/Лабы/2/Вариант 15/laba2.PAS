Program SDAlaba2v17;
   var 
      a, b, h, xj, y: real; 
      i, n: integer;
      
   function f1(x: real): real;
   begin
      y:=exp(ln(exp(1))*(2*x));
      f1:=y;
   end;
   
   function f2(x: real): real;
   begin
      y:=sqrt(abs(9-x*x*x));
      f2:=y;
   end;
   
   function f3(x: real): real;
   begin
      y:=exp(ln(2)*x)-exp(ln(exp(1))*(x/2));
      f3:=y;
   end;
   
begin
   a:=2; 
   b:=6; 
   n:=7;
   
   if (n > 10) or (n <= 0) or (b <= a) then writeln('nevernoe znachenie')
   else 
   begin
      h:=(b - a) / n;
      writeln(' ______________________________________________________________');
      writeln('||                     Funcii odniei zminnoi                   ||');
      writeln('||_____________________________________________________________||');
      writeln('||ArgumentX||       e^(2x)     || sqrt(|9-x^3|) || 2^x-e^(2/x) ||');
      
      for i:=0 to n do 
      begin
         xj:=a+i*h;
         writeln('||_________||__________________||_______________||_____________||');
         writeln('|| ',xj:4:5,' || ',f1(xj):15:5,'  ||   ',f2(xj):10:5,'  || ',f3(xj):10:5,'  ||');
      end;
   end;
   
   writeln('||-------------------------------------------------------------||');
   writeln('||                                 Sklav: SYMOTYIK M.V.  KV-51 ||');
   writeln(' ---------------------------------------------------------------');
   
   readln;
end.

