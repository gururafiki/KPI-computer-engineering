Program Lab6;
Var S:string;
    ch:char;
    i,st:byte;
    b:boolean;
Procedure FirstSymbol(name:string;var symbol:char;var num:byte);
begin
    for num:=1 to Length(S) do
      if S[num]<>' ' then
        begin
          symbol:=S[num];
          break;
        end;
end;
Begin
    write('Наберіть текст:');
    readln(S);
    FirstSymbol(S,ch,i);
    delete(S,1,i-1);i:=2;
    
    st:=i;b:=true; {установки для першого слова}
    while i<=Length(S) do
      begin
        if S[i]=ch then
          begin
            delete(S,i,1);
            insert('TAK',S,i);
            b:=true;
            inc(i,2);
          end;
        if (S[i]=' ') or (i=Length(S)) then
          begin
           if b=false then
              begin
                delete(S,st,1);
                insert('HI',S,st);
                inc(i);
                st:=0;
              end;
            if ((i+1<=Length(S)) and (S[i+1]<>' ')) or (i=Length(S)) and (st=0) then
            begin
              st:=i+1;
              b:=false;
            end;
          end;
        inc(i);
      end;
    write(S);
End.