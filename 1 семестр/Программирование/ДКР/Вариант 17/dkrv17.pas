Program dkrv17;
Uses Crt; 
var 
   n:integer; ch:char; f:boolean;

Procedure Frame(x1,y1,x2,y2:integer); {основна рамка}
  var
    i:integer;
  begin
     TextColor(11);
      gotoxy(x1,y1); write('╔');
        for i:=(x1+1)to (x2-1) do
           write('═');
     write('╗');
        for i:=(y1+1) to (y2-1) do
          begin
             gotoxy(x1,i); write('║');
             gotoxy(x2,i); write('║');
          end;
      gotoxy(x1,y2); write('╚');
        for i:=(x1+1)to (x2-1) do
           write('═');
           write('╝');
  end;
  
 Procedure Zastavka; {головна заставка на початку роботи програми}
  begin
   ClrScr; 
    Frame(10,5,65,18);
    TextColor(7);
     gotoxy(32,6); write('НТУУ КПI');
     gotoxy(24,7); write('Домашня контрольна робота');
     gotoxy(31,9); write('Варiант №17');
     gotoxy(23,11); write('Симотюка Миколи Вiкторовича');
     gotoxy(31,12); write('Група КВ-51');
     gotoxy(32,17); write('Київ 2015');
     gotoxy(63,17); TextColor(12); write('<3');
      TextColor(15);
     gotoxy(17,20); write('Натиснiть будь-яку клавiшу для продовження');
   readkey; ClrScr;
     Frame(10,5,65,18); TextColor(7); 
 gotoxy(12,10); writeln('Дана програма надає можливiсть обчислити кiлькiсть'); 
 gotoxy(12,11); write('можливих способiв оплати суми,заданої користувачем,');
 gotoxy(20,12); write('копiйками номiналом 1,2,5,10,25,50.'); TextColor(15);
 gotoxy(17,20); write('Натиснiть будь-яку клавiшу для продовження');readkey; ClrScr;
 end;

function amount(n:integer):integer;  {алгоритм обчислення суми}
  var
    i1,i2,i3,i4,i5,i6,k:integer;
  begin
 k:=0;
  for i1:=0 to 100 do
   for i2:=0 to 50 do
    for i3:=0 to 20 do
     for i4:=0 to 10 do
      for i5:=0 to 4 do
       for i6:=0 to 2 do
        
        if (i1*1 + i2*2 + i3*5 + i4*10 + i5*25 + i6*50 = n)then k:=k+1;
        amount:=k;
  end;
begin {main}
Zastavka;
 
 repeat {початок повторного використання програми користувачем} 
Frame(10,5,65,18); TextColor(7);
gotoxy(14,9); writeln('Введiть суму (не бiльше ста) та натистнiть Enter'); TextColor(LightRed);
gotoxy(35,11); readln(n); ClrScr; {введення n - суми,заданої користувачем}

Frame(10,5,65,18); 
gotoxy(30,8);  TextColor(7); write('Ви ввели суму '); TextColor(LightRed); write(n);

 TextColor(7); gotoxy(19,12);
 if (n>0) and (n<=100) then 
            begin
              write('Цю суму можливо оплатити '); TextColor(14); write(amount(n)); 
              TextColor(7); write(' способами') 
            end
   else if (n=0) then 
            begin 
              gotoxy(11,12);
              write('Цю суму можливо оплатити '); TextColor(14); write(amount(n));
              TextColor(7); write(' способами(не видати нiчого)')
           end
   else 
     begin 
       gotoxy(24,12);
       write('Це некоректне значення суми');
     end;
  
  gotoxy(12,20); TextColor(15); write('Натиснiть Esc для виходу або Enter, щоб скористуватися');
   gotoxy(30,21); write('програмою ще раз'); ch:=readkey; ClrScr;
  
  case ch of 
  #27{Esc}: begin
            Frame(10,5,65,18); TextColor(7); 
            gotoxy(21,9); write('Дякую, що скористалися програмою!');
            gotoxy(30,11); writeln('На все добре!'); delay(1500); f:=false;
         end;
  #13{Enter}: f:=true;
  end;{case}
 until f=false;
       
end.