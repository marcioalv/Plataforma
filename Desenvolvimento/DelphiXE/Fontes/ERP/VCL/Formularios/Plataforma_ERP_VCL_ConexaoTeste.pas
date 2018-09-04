
unit Plataforma_ERP_VCL_ConexaoTeste;

interface

uses
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
    priTimeOutGeral: Integer;
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
//  Plataforma_Framework_Conexao,
  Plataforma_Framework_VCL;


{$R *.dfm}

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLConexaoTeste.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis privadas.
  //
  priTimeOutGeral := 15;

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
  locSucesso : Boolean;
  locMensagem: string;
begin
  //
  // Muda cursor.
  //
  VCLCursorTrocar(True);

  //
  // Configura o timeout geral para o teste.
  //
  //pubConexao.TimeOut := priTimeOutGeral;

  //
  // Executar teste.
  //
  //ADOConexaoTestar(pubConexao, locSucesso, locMensagem);

  //
  // Falha no teste.  
  if not locSucesso then
  begin
    VCLCursorTrocar;
    Hide;
    VCLConsistenciaExibir('N�o foi poss�vel estabeler uma conex�o com os dados informados!', locMensagem);
    Close;
    Exit;
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
