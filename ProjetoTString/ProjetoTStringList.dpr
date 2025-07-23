program ProjetoTStringList;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes;

var
  lista,lista2: TstringList;

var
  nome: String;
  contador: Integer;
  i, j: Integer;
begin
  try
    while True do
    begin
      lista := TStringList.Create;
      lista2 := TStringList.Create;
      for i := 0 to 9 do
      begin
        WriteLn('Escreva algo: ' + (i+1).ToString);
        ReadLn(nome);
        lista.Add(nome);
      end;
      for j := 0 to lista.Count-1 do
      begin
        Writeln('indice atual da lista : '+ (Lista[j]) );
      end;
    end;
      lista.SaveToFile(ExtractFilePath(ParamStr(0)+'Teste.txt'));
      Lista2.LoadFromFile(ExtractFilePath(ParamStr(0))+'Teste.txt');
      lista.Free;
      lista2.Free
except
  on E: Exception do
    WriteLn(E.ClassName, ': ', E.Message);
end;

end.
