Program Lab1;
Var x, y, z, g:real;
Begin
    write('x=');
    readln(x);
    write('y=');
    readln(y);
    write('z=');
    readln(z);

    if(abs(x)-abs(y) = 0) then g:=0
    else
        if(abs(x)-abs(y) > 0) then g:=exp(ln(abs(x)-abs(y))/3)
        else g:=-exp(ln(abs(abs(x)-abs(y)))/3);

    if(y = 0) then writeln('a=', g:5:4)
    else
        if(x = 0) then writeln('a=', (1+g):5:4)
        else
            if(y > 0) then writeln('a=', (exp(ln(y)*x)+g):5:4)
            else
                if(frac(x/2) = 0) then writeln('a=', (exp(ln(abs(y))*x)+g):5:4)
                else writeln('a=', (-exp(ln(abs(y))*x)+g):5:4);

    if(x+z <> 0) then
        if(x-y*y/(x+z) <> 0) then
            begin
                writeln('b=', (x+(y*y*y/(x-y*y/(x+z)))):5:4)
            end
        else writeln('b - does not exist')
    else writeln('b - does not exist');
	writeln;
End.