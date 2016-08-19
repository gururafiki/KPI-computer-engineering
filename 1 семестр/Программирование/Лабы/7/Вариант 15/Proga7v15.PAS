Program progav2; {работает только в TP (наверное)}
Uses
 Graph, Crt;
 Procedure dvaD(color:byte);
   begin
       SetLineStyle(0,0,3); SetColor(color); Circle(300,370,7);
       SetFillStyle(1,color); FloodFill(300,370,color);
       Arc(300,320,270,360,50); Line(350,320,350,100);
       Line(320,98,495,98); Line(325,101,490,101);
       Bar(420,101,460,373); Line(390,375,490,375);
       Line(395,373,485,373);
       SetLineStyle(0,0,1);
   end;
 Procedure triD(color:byte);
   begin
     SetLineStyle(0,0,3); SetColor(color); SetFillStyle(1,color);
      Arc(300,270,270,360,50); Arc(300,270,270,360,90);
      Line(300,320,300,360); Line(350,270,350,100); Line(390,270,390,140);
      Line(390,140,430,140); Line(430,140,430,360); Line(430,360,480,360);
      Line(480,360,480,100); Line(480,100,350,100);
      FloodFill(470,300,color); SetLineStyle(3,0,1);
      Line(300,360,270,330); Line(300,320,270,290); Line(350,100,320,70);
      Arc(270,241,270,360,50); Line(320,241,320,70); Line(320,70,450,70);
      Line(480,100,450,70); Line(270,330,270,290);
      Line(430,360,400,330); Line(400,330,400,100);
      SetFillStyle(11,color);

      SetLineStyle(0,0,1);

  end;
 Procedure zastavka(color,shrift:byte);
   begin
     ClearDevice;
     SetColor(color); Rectangle(20,30,620,400);
     SetTextStyle(shrift,0,5);
     OutTextXY(210,35,'NTUU KPI'); OutTextXY(95,70,'Labaratorna robota #7');
     SetTextStyle(shrift,0,3); OutTextXY(250,115,'Variant 17');
     OutTextXY(230,170,'Simotiyka M.V.'); OutTextXY(240,195,'Grupa KV-51');
     OutTextXY(250,350,'Kyiv 2015');
     SetColor(3); SetTextStyle(1,0,1);
     repeat
       OutTextXY(190,410,'Press any key to Continue'); delay(400);
       SetFillStyle(0,0); FloodFill(30,410,color);  delay(400);
     until(keypressed);
   end;

 Procedure Menu(color,shrift:byte);
  begin

    ClearDevice; SetColor(Color); Rectangle(20,30,620,400);
    SetTextStyle(shrift,0,5); OutTextXY(70,40,'Menu');
    Line(30,90,220,90);
    SetTextStyle(shrift,0,4); OutTextXY(100,110,'2D');
    OutTextXY(100,160,'3D'); OutTextXY(30,210,'ChangeColor');
    OutTextXY(33,260,'ChangeFont'); OutTextXY(90,350,'Exit');
  end;

 Procedure ClrKeyBuf;
   var
     ch:char;
  begin
    while KeyPressed do ch:=readkey;
  end;

 Procedure Choice(color,shrift:byte; var y:byte);
  var
    ch:char;
    f:boolean;
   begin
   ClearDevice;
    Menu(color,shrift);

     SetColor(2); SetTextStyle(shrift,0,4); OutTextXY(100,110,'2D');
     if y=10 then dvaD(color);
     if y=11 then triD(color);

        y:=1; f:=false;
     repeat
       ClrKeyBuf;
       ch:=readkey;
      if ch=#0 then ch:=readkey;
    case ch of
    {down}#80:
         case y of
          1: begin
               Menu(color,shrift); SetColor(2); OutTextXY(100,160,'3D');
                y:=2;
             end;
          2: begin
               Menu(color,shrift); SetColor(2); OutTextXY(30,210,'ChangeColor');
                y:=3;
             end;
          3: begin
               Menu(color,shrift); SetColor(2); OutTextXY(33,260,'ChangeFont');
                y:=4;
             end;
          4: begin
               Menu(color,shrift); SetColor(2); OutTextXY(90,350,'Exit');
                y:=5;
             end;
          end;{casey}
     {up}#72:
         case y of
          5: begin
               Menu(color,shrift); SetColor(2); OutTextXY(33,260,'ChangeFont');
                y:=4;
             end;
          4: begin
               Menu(color,shrift); SetColor(2); OutTextXY(30,210,'ChangeColor');
                y:=3;
             end;
          3: begin
               Menu(color,shrift); SetColor(2); OutTextXY(100,160,'3D');
                y:=2;
             end;
          2: begin
               Menu(color,shrift); SetColor(2); OutTextXY(100,110,'2D');
                y:=1;
             end;
           end;{casey}
      {enter}#13: f:=true;
     end;{casech}

    until (f=true);
  end;

 Procedure colormenu(color,shrift:byte);
  begin
        ClearDevice; SetColor(Color); Rectangle(20,30,620,400);
        SetTextStyle(shrift,0,4); OutTextXY(30,40,'ChangeColor');
        OutTextXY(80,70,'menu');  Line(30,110,220,110);
        SetColor(1); OutTextXY(110,130,'1'); SetColor(12);
        OutTextXY(110,170,'2'); SetColor(3); OutTextXY(110,210,'3');
        SetColor(4); OutTextXY(110,250,'4');
        SetColor(5); OutTextXY(110,290,'5'); SetColor(6);
        OutTextXY(110,330,'6');
  end;

 Procedure choicecolor(color,shrift:byte; var int:byte);
  var
    ch:char;
    f:boolean;
    y:byte;
  begin
       colormenu(color,shrift);
     SetColor(2); SetTextStyle(shrift,0,4); OutTextXY(90,130,'*');

        y:=1; f:=false;
       repeat
       ClrKeyBuf;
       ch:=readkey;
      if ch=#0 then ch:=readkey;
    case ch of
    {down}#80:
         case y of
          1: begin
               colormenu(color,shrift); SetColor(2); OutTextXY(80,170,'*');
                y:=2;
             end;
          2: begin
               colormenu(color,shrift); SetColor(2); OutTextXY(80,210,'*');
                y:=3;
             end;
          3: begin
               colormenu(color,shrift); SetColor(2); OutTextXY(80,250,'*');
                y:=4;
             end;
          4: begin
               colormenu(color,shrift); SetColor(2); OutTextXY(80,290,'*');
                y:=5;
             end;
          5: begin
               colormenu(color,shrift); SetColor(2); OutTextXY(80,330,'*');
                y:=6;
             end;
          end;{casey}
     {up}#72:
         case y of
          6: begin
               ColorMenu(color,shrift); SetColor(2); OutTextXY(80,290,'*');
                y:=5;
             end;
          5: begin
               ColorMenu(color,shrift); SetColor(2); OutTextXY(80,250,'*');
                y:=4;
             end;
          4: begin
               ColorMenu(color,shrift); SetColor(2); OutTextXY(80,210,'*');
                y:=3;
             end;
          3: begin
               ColorMenu(color,shrift); SetColor(2); OutTextXY(80,170,'*');
                y:=2;
             end;
          2: begin
               ColorMenu(color,shrift); SetColor(2); OutTextXY(80,130,'*');
                y:=1;
             end;
           end;{casey}
      {enter}#13: f:=true;
     end;{casech}
     if y=2 then int:=12
     else
     int:=y;
    until(f=true);
  end;

 Procedure FontMenu(color,shrift:byte);
   begin
    ClearDevice; SetColor(Color); Rectangle(20,30,620,400);
        SetTextStyle(shrift,0,4); OutTextXY(30,40,'ChangeFont');
        OutTextXY(74,65,'menu');  Line(30,110,220,110);

     SetTextStyle(1,0,4); OutTextXY(90,130,'Text'); SetTextStyle(3,0,4);
        OutTextXY(90,170,'Text'); SetTextStyle(4,0,4); OutTextXY(90,210,'Text');
        SetTextStyle(5,0,4); OutTextXY(90,250,'Text');
        SetTextStyle(6,0,4); OutTextXY(90,290,'Text'); SetTextStyle(7,0,4);
        OutTextXY(90,330,'Text');
   end;
 Procedure chaiceFont(color,shrift:byte; var int:byte);
    var
    ch:char;
    f:boolean;
    y:byte;
  begin
       FontMenu(color,shrift);
     SetColor(2); SetTextStyle(1,0,4); OutTextXY(90,130,'Text');

        y:=1; f:=false;
       repeat
       ClrKeyBuf;
       ch:=readkey;
      if ch=#0 then ch:=readkey;
    case ch of
    {down}#80:
         case y of
          1: begin
               FontMenu(color,shrift); SetTextStyle(3,0,4); SetColor(2);
               OutTextXY(90,170,'Text');
                y:=2;
             end;
          2: begin
               FontMenu(color,shrift); SetTextStyle(4,0,4); SetColor(2);
               OutTextXY(90,210,'Text');
                y:=3;
             end;
          3: begin
               FontMenu(color,shrift); SetTextStyle(5,0,4); SetColor(2);
               OutTextXY(90,250,'Text');
                y:=4;
             end;
          4: begin
               FontMenu(color,shrift); SetTextStyle(6,0,4); SetColor(2);
               OutTextXY(90,290,'Text');
                y:=5;
             end;
          5: begin
               FontMenu(color,shrift); SetTextStyle(7,0,4); SetColor(2);
               OutTextXY(90,330,'Text');
                y:=6;
             end;
          end;{casey}
     {up}#72:
         case y of
          6: begin
               FontMenu(color,shrift); SetTextStyle(6,0,4); SetColor(2);
               OutTextXY(90,290,'Text');
                y:=5;
             end;
          5: begin
               FontMenu(color,shrift); SetTextStyle(5,0,4); SetColor(2);
               OutTextXY(90,250,'Text');
                y:=4;
             end;
          4: begin
               FontMenu(color,shrift); SetTextStyle(4,0,4); SetColor(2);
               OutTextXY(90,210,'Text');
                y:=3;
             end;
          3: begin
               FontMenu(color,shrift); SetTextSTyle(3,0,4); SetColor(2);
               OutTextXY(90,170,'Text');
                y:=2;
             end;
          2: begin
               FontMenu(color,shrift); SetTextStyle(1,0,4); SetColor(2);
               OutTextXY(90,130,'Text');
                y:=1;
             end;
           end;{casey}
      {enter}#13: f:=true;
     end;{casech}
     if y=1 then int:=1
     else
     int:=y+1;
    until(f=true);
  end;

  var
   gd,gm:integer;
   ch:char;
   f:boolean;
   color,shrift,y,int:byte;
begin {main}
  gd:=detect;
  Initgraph(gd,gm,'');

     Color:=15; Shrift:=8;
   zastavka(color,shrift);
   repeat
    Choice(color,shrift,y);

    case y of
     1:begin
          dvaD(color); y:=10;
       end;
     2:begin
          triD(color); y:=11;
       end;
     3:begin
          choicecolor(color,shrift,int);
          color:=int;
       end;
     5:begin
         ClearDevice; SetColor(color); Rectangle(20,30,620,400);
         OutTextXY(210,180,'\_(-_-)_/'); delay(2000); break;
       end;
     4:begin
         ChaiceFont(color,shrift,int);
         shrift:=int;
       end;
     end;{case}

    until(false);

  Closegraph;
end.
