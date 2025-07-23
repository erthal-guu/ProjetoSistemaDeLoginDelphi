program Project3;

{$APPTYPE CONSOLE}
{$R *.res}
// Criar uma funcionalidade de login

// Usuário
// Senha
uses
  System.SysUtils;

// Estilização do Menu
procedure MostrarMenu;
begin
  WriteLn('---------Menu---------');
  WriteLn('| 1 - Realizar Login |');
  WriteLn('| 2 - Sair           |');
  WriteLn('| 1 - Realizar Login |');
  WriteLn('----------------------');
  WriteLn('Digite sua escolha:');
end;

procedure MostrarMenuCadastro;
begin
  WriteLn('---------Menu----------');
  WriteLn('| 1 -Adicionar Usuário |');
  WriteLn('| 2 - Sair             |');
  WriteLn('-----------------------');
  WriteLn('Digite sua escolha:');
end;

var
  usuario, senha, opcao: String;
  EscolhaUsuario, num1, num2: Integer;
  operacao: Double;
  logado: Boolean;

Const
  usuarioAdmin: String = 'admin';
  senhaAdmin: String = 'admin';

Procedure PedirDados;
begin
  WriteLn('Digite seu nome de Usuário:');
  WriteLn('');
  ReadLn(usuario);
  WriteLn('Digite sua Senha:');
  WriteLn('');
  ReadLn(senha);
end;

function LoginValido(usuario, senha: String): Boolean;
begin
  result := false;
  if (usuario = usuarioAdmin) and (senha = senhaAdmin) then
  begin
    logado := true;
    result := true;
  end;
end;

Function TamanhoSenhaValido(senha: String): Boolean;
begin
  result := (senha.Length >= 5);
end;

function Adicao(num1, num2: Integer): Integer;
begin
  result := num1 + num2;
end;

function Subtracao(num1, num2: Integer): Integer;
begin
  result := num1 - num2;
end;

function divisao(num1, num2: Integer): Double;
begin
  result := num1 / num2;
end;

function multiplicacao(num1, num2: Integer): Integer;
begin
  result := num1 * num2;
end;

procedure PedirNumeroConta;
begin
  WriteLn('------Calculadora------');
  WriteLn('');
  WriteLn('Digite um número:');
  ReadLn(num1);
  WriteLn('Digite outro número:');
  ReadLn(num2);
end;

procedure MostrarMenuOperacoes;
begin
  WriteLn('---------Menu---------');
  WriteLn('| 1 - Adição        |');
  WriteLn('| 2 - Subtração     |');
  WriteLn('| 3 - Divisão       |');
  WriteLn('| 4 - Multiplicação |');
  WriteLn('| 5 - Sair          |');
  WriteLn('----------------------');
  WriteLn('Digite sua escolha:');
end;

var
  i, j: Integer;

begin
  try

    // Comparação da Escolha do Usuário
    i := 0;
    while true do
    begin
      MostrarMenu;
      ReadLn(opcao);
      if (opcao = '1') then
      begin
        WriteLn('Seja Bem-Vindo ao nosso sistema');
        while true do
        begin
          PedirDados;
          if LoginValido(usuario, senha) then
          begin
            WriteLn('Login bem sucessedido !!!');
            Sleep(2000);
            break;
          end
          else if not(TamanhoSenhaValido(senha)) then
          begin
            WriteLn('A senha precisa conter no minímo 5 caracteres, Tente Novamente !!!');
          end
          else
          begin
            WriteLn('Login ou senha inválidos.');
            Sleep(1500);
            i := i + 1;
            if i = 3 then
            begin
              WriteLn('Você atingiu o número máximo de tentativas !!!');
              Sleep(1500);
              WriteLn('Fechando o sistema em ...');
              for j := 1 to 3 do
              begin
                Sleep(1000);
                WriteLn(j.ToString + '...');
              end;
              exit;
            end;
          end;
        end;
        break;
      end
      else if (opcao = '2') then
      begin
        WriteLn('Você Escolheu sair');
        WriteLn('Encerando....');
        Sleep(1500);
        exit;
      end
      else
      begin
        WriteLn('Valor inválido, Redirecionado você novamente para o menu.');
        Sleep(1500);

      end;
    end;

    // ínicio da calculadora
    while true do
    begin
      MostrarMenuOperacoes;
      ReadLn(EscolhaUsuario);
      // Comparações das escolhas do usuário
      if EscolhaUsuario = 1 then
      begin
        PedirNumeroConta;
        operacao := Adicao(num1, num2);
        WriteLn('O Resultado de ' + num1.ToString + ' + ' + num2.ToString +
          ' = ' + operacao.ToString);
        break;
      end
      else if EscolhaUsuario = 2 then
      begin
        PedirNumeroConta;
        operacao := Subtracao(num1, num2);
        WriteLn('O Resultado de ' + num1.ToString + ' - ' + num2.ToString +
          ' = ' + operacao.ToString);
        break;
      end
      else if EscolhaUsuario = 3 then
      begin
        PedirNumeroConta;
        operacao := divisao(num1, num2);
        WriteLn('O Resultado de ' + num1.ToString + ' / ' + num2.ToString +
          ' = ' + operacao.ToString);
        break;
      end
      else if EscolhaUsuario = 4 then
      begin
        PedirNumeroConta;
        operacao := multiplicacao(num1, num2);
        WriteLn('O Resultado de ' + num1.ToString + ' * ' + num2.ToString +
          ' = ' + operacao.ToString);
        break;
      end
      else if EscolhaUsuario = 5 then
      begin
        WriteLn('Você escolheu sair !! ');
        Sleep(1500);
        WriteLn('Encerrando....');
        Sleep(2000);
        exit;
      end
      else
      begin
        WriteLn('Valor inválido, Tente novamente !!');
        Sleep(1500);
        WriteLn('Redirecionando você para o menu de escolha novamente !!!');
        Sleep(2000);
      end;
    end;
    var
      nome, email: String;
    var
      idades: Integer;

    if logado then
    begin
      Sleep(1000);
      MostrarMenuCadastro;
      ReadLn(opcao);
      while true do
      begin

        if opcao = '1' then
        begin
          WriteLn('Digite o nome completo de usuário ');
          Read(nome);
          WriteLn('Digite a idade de usuário ');
          Read(idades);
          WriteLn('Digite o email do usuário ');
          Read(email);

        end
        else if opcao = '2' then
        begin
          logado := false;
          break;
        end
        else
        begin
          WriteLn('Opção inválida');
          Sleep(1000);
        end;
      end;
    end;

    ReadLn;
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;

end.
