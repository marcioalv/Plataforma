
unit Plataforma_ERP_VCL_ConexaoTeste;

interface

uses
  Data.Win.ADODB,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TPlataformaERPVCLConexaoTeste = class(TForm)
    panFormulario: TPanel;
    lblMensagem: TLabel;
    timInicializacao: TTimer;
    procedure timInicializacaoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure TesteExecutar;
  public
    pubServidor  : string;
    pubPorta     : Integer;
    pubInstancia : string;
    pubBancoDados: string;
    pubUsuario   : string;
    pubSenha     : string;
  end;

var
  PlataformaERPVCLConexaoTeste: TPlataformaERPVCLConexaoTeste;

implementation

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

{$R *.dfm}

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLConexaoTeste.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubServidor   := '';
  pubPorta      := 0;
  pubInstancia  := '';
  pubBancoDados := '';
  pubUsuario    := '';
  pubSenha      := '';
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLConexaoTeste.FormShow(Sender: TObject);
begin
  //
  // Liga timer para iniciar a execu��o.
  //
  timInicializacao.Enabled := True;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLConexaoTeste.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de tick no timer.
//
procedure TPlataformaERPVCLConexaoTeste.timInicializacaoTimer(Sender: TObject);
begin
  //
  // Desliga o timer de inicializa��o pois ele s� deve ser executado uma �nica vez.
  //
  timInicializacao.Enabled := False;

  //
  // Chama teste.
  //
  TesteExecutar;
end;

//
// Procedimento para executar o teste da conex�o.
//
procedure TPlataformaERPVCLConexaoTeste.TesteExecutar;
var
  locADOConnection: TADOConnection;
begin
  //
  // Muda cursor.
  //
  VCLCursorTrocar(True);

  //
  // Executar teste.
  //
  try
    locADOConnection                   := TADOConnection.Create(Self);
    locADOConnection.ConnectionString  := ADOConnectionStringGerar(pubServidor, pubInstancia, pubPorta, pubUsuario, pubSenha, pubBancoDados);
    locADOConnection.ConnectionTimeout := 15;
    locADOConnection.Open;
  except
    on locExcecao: Exception do
    begin
      Hide;
      VCLConsistenciaExibir('N�o foi poss�vel estabeler uma conex�o com os dados informados!', locExcecao.Message);
      Close;
      Exit;
    end;
  end;

  //
  // Sucesso no teste.
  //
  VCLCursorTrocar;
  Hide;
  VCLInformacaoExibir('Conex�o estabelecida com sucesso!');

  //
  // Fecha formul�rio.
  //
  Close;
end;

end.
