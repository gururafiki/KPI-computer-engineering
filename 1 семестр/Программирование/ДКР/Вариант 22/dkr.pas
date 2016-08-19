Program Dkr;
Var S:string;
Function IsIdentifier(name:string):integer;
const valid_begin=['A'..'Z','a'..'z','_'];
      valid_chars=['A'..'Z','a'..'z','0'..'9','_'];
      reserved_words:array[1..59] of string=('absolute','and','array','asm','assembler','begin','case','const','constructor','destructor','div','do','downto','else','end',
                                    'external','far','file','for','forward','function','goto','if','implementation','in','inherited','inline','interface','interrupt','label',
                                    'mod','near','nil','not','object','of','оr','packed','private','procedure','program','public','record','repeat','set',
                                    'shl','shr','string','then','to','type','unit','until','uses','var','virtual','while','witn','xor');
var i:byte;
    k:integer;
begin
    k:=1;
    if Length(name)=0 then k:=0
    else
        if not(name[1] in valid_begin) then k:=-1
        else
            if Length(name)>127 then k:=-2
            else
              begin
                for i:=2 to Length(name) do
                  if not(name[i] in valid_chars) then
                    begin
                      k:=-3;
                      break;
                    end;
                if k=1 then
                    for i:=1 to 59 do
                        if reserved_words[i]=name then
                          begin
                            k:=-4;
                            break;
                          end;
              end;
    IsIdentifier:=k;
end;
Function IsDec(name:string):boolean;
const valid_num=['0'..'9'];
var i:byte;
    b:boolean;
begin
    b:=true;
    for i:=1 to Length(name) do
        if not(name[i] in valid_num) then
          begin
            b:=false;
            break;
          end;
    IsDec:=b;
end;
Begin
    Write('Наберiть текст:');
    Readln(S);
    Case IsIdentifier(S) of
        1:Write('Текст є iдентифiкатором.');
        0:Write('Текст не мiстить жодного символу!');
        -1:begin
              if IsDec(S) then Write('Текст є десятковим записом цiлого числа.')
              else Write('Недопустимий символ в назвi iдентифiкатора!');
           end;
        -2:Write('Недопустима кiлькiсть символів в назвi iдентифікатора!');
        -3:Write('Недопустимий символ в назвi ідентифікатора!');
        -4:Write('Назва iдентифiкатора не повинна спiвпадати iз зарезервованими словами!');
    end;
    readln;
End.