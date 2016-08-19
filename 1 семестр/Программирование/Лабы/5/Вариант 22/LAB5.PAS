Program Lab5;
Const n=24;
      num=3;
Type Student=record
       Name:record
         First,Second,Middle:string[20];
       end;
       Session:record
         Prog,SDA,Mat,Alg:byte;
       end;
     end;
     List=array[1..n] of Student;
     sess=array[1..n] of byte;
     sess_min=array[1..num] of byte;
Var f:text;
    group:List;
    S:sess;
    iMin:sess_min;
    str:string;
    i:byte;
Procedure get_data(s:string;const k:byte);
var i,j,p:byte;
    error:integer;
begin
    while i<=Length(s) do
      begin
        inc(i);
        j:=pos(' ',s); if j=0 then j:=Length(s);
        if (j<>0) then
          begin
            inc(p);
            with group[k] do
              case p of
                1:Name.Second:=copy(s,1,j);
                2:Name.First:=copy(s,1,j);
                3:Name.Middle:=copy(s,1,j);
                4:val(copy(s,1,j),Session.Prog,error);
                5:val(copy(s,1,j),Session.SDA,error);
                6:val(copy(s,1,j),Session.Mat,error);
                7:val(copy(s,1,j),Session.Alg,error);
              end;
            delete(s,1,j);
            i:=0;
          end;
      end;
end;
Function sort_increase(sum:sess):sess_min;
var i,j:byte;
    s:sess_min;
begin
    for i:=1 to num do
      begin
        for j:=n downto i do
            if sum[i]>=sum[j] then
              begin
                s[i]:=sum[j];
                sum[j]:=sum[i];
                sum[i]:=s[i];
              end;
      end;
    sort_increase:=s;
end;
Procedure search_min(sum:sess;sorted_sum:sess_min;var min:sess_min);
var i,j:byte;
    indexes:set of byte = [0];
begin
    for i:=1 to num do for j:=1 to n do
        if (sorted_sum[i]=sum[j]) and not(j in indexes) then
          begin
            include(indexes,j);
            min[i]:=j;
            break;
          end;
end;
Begin
    assign(f,'LAB5.dat');
    reset(f);
    for i:=1 to n do
      begin
        readln(f,str);
        get_data(str,i);
        with group[i].Session do S[i]:=Prog+SDA+Mat+Alg;
      end;
    close(f);
    search_min(S,sort_increase(S),iMin);
    writeln('Студенти, які минулої сесії набрали найменшу к-ть балів:');
    writeln('#':2,'Прізвище':12,'Прог':7,'СДА':4,'Мат':4,'Алг':4,'Сума':7);
    for i:=1 to num do
      begin
        write(i,'.',group[iMin[i]].Name.Second:13);
        with group[iMin[i]].Session do writeln(Prog:6,SDA:4,Mat:4,Alg:4,S[iMin[i]]:7);
      end;
End.