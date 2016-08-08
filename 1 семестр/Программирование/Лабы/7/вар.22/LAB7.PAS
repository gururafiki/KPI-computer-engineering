Program Lab7;
Uses GraphABC;
Const n=3;
      Items:array[1..n] of string[22]=('Двумерное изображение','Трехмерное изображение','Выход');
Var k:byte;
    b:boolean;
Procedure Beginning;
begin
    SetFontColor(clGreen);
    SetFontSize(17);
    Textout(50,200,'Лабораторна робота №7');
    SetFontColor(clGreenYellow);
    Textout(50,230,'Студента:');
    Textout(50,260,'Групи КВ-51');
    Textout(50,290,'Базильського Л.О.');
    b:=true;
end;
Procedure Main_Menu(var k:byte);
var i,y:byte;
begin
    SetFontColor(clGreen);
    Textout(50,100,'Меню');
    for i:=1 to n do 
      begin
        if i=k then SetFontColor(clDarkRed)
        else SetFontColor(clTeal);
        if i=n then y:=60 else y:=0;
        Textout(50,130+40*i+y,Items[i]);
      end;
end;
procedure TwoD;
begin
    SetPenColor(clGoldenrod);
    SetPenWidth(10);
    DrawRectangle(3,3,597,597);
    SetPenWidth(3);
    DrawRoundRect(100,125,500,325,150,150);
    DrawRoundRect(125,150,475,300,100,100);
    DrawRectangle(275,75,325,500);
    FloodFill(280,80,clGoldenrod);
    FloodFill(280,130,clGoldenrod);
    FloodFill(280,155,clGoldenrod);
    FloodFill(280,320,clGoldenrod);
    FloodFill(280,340,clGoldenrod);
    FloodFill(270,130,clGoldenrod);
    FloodFill(330,130,clGoldenrod);
end;

procedure ThreeD;
begin
    TwoD;
    DrawRoundRect(120,100,525,310,150,150);
    SetPenColor(clBlack);
    Line(348,100,325,100);
    SetPenColor(clGoldenrod);
    Line(350,50,350,100);
    Line(350,125,350,475);
    Line(350,50,325,75);
    Line(350,475,325,500);
    Line(275,75,300,50);
    Line(300,50,350,50);
    Line(325,125,350,100);
end;
procedure KeyDown(Key: integer);
begin
    case Key of
      VK_Up:
      if not b then
          begin
            k:=k-1;
            if k=0 then k:=n;
            ClearWindow(clBlack);
            Main_Menu(k);
          end;
      VK_Down:
        if not b then
          begin
              k:=k+1;
              if k>n then k:=1;
              ClearWindow(clBlack);
              Main_Menu(k);
          end;
      VK_Enter:begin
        ClearWindow(clBlack);
        if b then
          begin
            Main_Menu(k);
            b:=false;
          end
        else
          begin
            b:=true;
            case k of
              1:TwoD;
              2:ThreeD;
              n:CloseWindow;
            end;
          end;
      end;
    end;
end;
Begin
    SetWindowSize(600,600);
    ClearWindow(clBlack);
    SetBrushColor(clBlack);
    OnKeyDown:=KeyDown;
    Beginning;
    SetFontStyle(fsBold);
    SetFontSize(20);
    k:=1;
End.