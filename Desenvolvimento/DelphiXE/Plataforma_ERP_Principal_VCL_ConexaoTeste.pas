{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informa��o Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP/VCL                                                                               |}
{|   Fonte: Plataforma_ERP_Principal_VCL_ConexaoTeste.pas                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Formul�rio para execu��o do teste de conex�o.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O c�digo fonte com o programa de computador contido nesse arquivo s�o de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informa��o Ltda, e seus direitos autorais s�o     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem pr�via permiss�o por escrito da propriet�ria.                                              |}
{| A viola��o de qualquer um destes direitos � crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_ERP_Principal_VCL_ConexaoTeste;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_Conexao,
  Plataforma_Framework_VCL,
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
  TPlataformaERPPrincipalVCLConexaoTeste = class(TForm)
    panFormulario: TPanel;
    lblMensagem: TLabel;
    timInicializacao: TTimer;
    procedure timInicializacaoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    priTimeOutGeral: Integer;
  
    /// <summary>
    /// Procedimento para executar o teste da conex�o recebida como par�metro pelo formul�rio.
    /// </summary>
    procedure TesteExecutar;
  public
    pubConexao: TConexao;
  end;

var
  PlataformaERPPrincipalVCLConexaoTeste: TPlataformaERPPrincipalVCLConexaoTeste;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////////////////////////
// �REA DE EVENTOS                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| FormCreate                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de cria��o do formul�rio.                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis privadas.
  //
  priTimeOutGeral := 15;

  //
  // Inicializa vari�veis p�blicas.
  //
  ConexaoLimpar(pubConexao);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormShow                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de exibi��o do formul�rio.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.FormShow(Sender: TObject);
begin
  //
  // Liga timer para iniciar a execu��o.
  //
  timInicializacao.Enabled := True;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormKeyPress                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de pressionamento de teclas no formul�rio.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| timInicializacaoTimer                                                                          |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de timer no componente timInicializacao.                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.timInicializacaoTimer(Sender: TObject);
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

////////////////////////////////////////////////////////////////////////////////////////////////////
// �REA DE PROCEDIMENTOS E FUN��ES                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| TesteExecutar                                                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.TesteExecutar;
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
  pubConexao.TimeOut := priTimeOutGeral;

  //
  // Executar teste.
  //
  ADOConexaoTestar(pubConexao, locSucesso, locMensagem);

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
