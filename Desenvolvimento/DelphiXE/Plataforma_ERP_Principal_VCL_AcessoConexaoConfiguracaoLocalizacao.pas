{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informa��o Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP/VCL                                                                               |}
{|   Fonte: Plataforma_ERP_Principal_VCL_AcessoConexaoConfiguracaoLocalizacao.pas                 |}
{+------------------------------------------------------------------------------------------------+}
{| Formul�rio para o cadastro das configura��es de acesso � aplica��o.                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2017 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O c�digo fonte com o programa de computador contido nesse arquivo s�o de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informa��o Ltda, e seus direitos autorais s�o     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem pr�via permiss�o por escrito da propriet�ria.                                              |}
{| A viola��o de qualquer um destes direitos � crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_ERP_Principal_VCL_AcessoConexaoConfiguracaoLocalizacao;

interface

uses
  Plataforma_Framework_Util,
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
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao = class(TForm)
    panFormulario: TPanel;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    btnSair: TButton;
    btnLimpar: TButton;
    btnLocalizar: TButton;
    rbtModoPrimeiro: TRadioButton;
    rbtModoProximo: TRadioButton;
    lblModo: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure rbtModoPrimeiroKeyPress(Sender: TObject; var Key: Char);
    procedure rbtModoProximoKeyPress(Sender: TObject; var Key: Char);
  private
    /// <summary>
    /// Procedimento para limpar os componentes do formul�rio.
    /// </summary>
    procedure ComponentesLimpar;

    /// <summary>
    /// Procedimento para popular os componentes do formul�rio.
    /// </summary>
    procedure ComponentesPopular;

    /// <summary>
    /// Procedimento para indicar a a��o de localizar.
    /// </summary>
    procedure FormularioLocalizar;

    /// <summary>
    /// Procedimento para limpar os filtros.
    /// </summary>
    procedure FormularioLimpar;

    /// <summary>
    /// Procedimento para sair.
    /// </summary>
    procedure FormularioSair;
  public
    pubClicouSair     : Boolean;
    pubLocalizarModo  : Byte;
    pubLocalizarTitulo: string;
  end;

var
  PlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao: TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao;

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
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa as vari�veis p�blicas.
  //
  pubClicouSair     := True;
  pubLocalizarModo  := VCL_LOCALIZAR_PRIMEIRO;
  pubLocalizarTitulo:= '';
end;

{+------------------------------------------------------------------------------------------------+}
{| FormShow                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de exibi��o do formul�rio.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormShow(Sender: TObject);
begin
  //
  // Limpa os componentes do formul�rio.
  //
  ComponentesLimpar;

  //
  // Popula os componentes do formul�rio com o conte�do das var�aveis p�blicas.
  //
  ComponentesPopular;

  //
  // Garante o foco no componente apropriado.
  //
  edtTitulo.SetFocus;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormKeyPress                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de pressionamento de teclas no formul�rio.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormKeyPress(Sender : TObject;
                                                                                      var Key: Char);
begin
  if Key = ESC then Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| chk                                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtTituloEnter.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.rbtModoPrimeiroKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.rbtModoProximoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtTitulo                                                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtTituloEnter.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.edtTituloEnter(Sender: TObject);
begin
  VCLEditEntrar(edtTitulo);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.edtTituloExit(Sender: TObject);
begin
  VCLEditSair(edtTitulo);
end;

{+------------------------------------------------------------------------------------------------+}
{| btnLocalizarClick                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de clique no componente btnLocalizar.                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnLimparClick                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de clique no componente btnLimpar.                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnSairClick                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de clique no componente btnSair.                                                        |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.btnSairClick(Sender: TObject);
begin
  FormularioSair;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
// �REA DE PROCEDIMENTOS E FUN��ES                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| ComponentesLimpar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.ComponentesLimpar;
begin
  rbtModoPrimeiro.Checked := True;
  rbtModoProximo.Checked  := False;
  VCLEditLimpar(edtTitulo);
end;

{+------------------------------------------------------------------------------------------------+}
{| ComponentesPopular                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.ComponentesPopular;
begin
  if pubLocalizarModo = VCL_LOCALIZAR_PRIMEIRO then rbtModoPrimeiro.Checked := True;
  if pubLocalizarModo = VCL_LOCALIZAR_PROXIMO  then rbtModoProximo.Checked  := True;

  edtTitulo.Text := pubLocalizarTitulo;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioLocalizar                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormularioLocalizar;
begin
  //
  // Carrega as vari�veis p�blicas com o conte�do dos componentes.
  //
  if rbtModoPrimeiro.Checked then pubLocalizarModo := VCL_LOCALIZAR_PRIMEIRO;
  if rbtModoProximo.Checked  then pubLocalizarModo := VCL_LOCALIZAR_PROXIMO;
  
  pubLocalizarTitulo := edtTitulo.Text;

  //
  // Define que o usu�rio n�o clicou em sair.
  //
  pubClicouSair := False;

  //
  // Fecha o formul�rio.
  //
  Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioLimpar                                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormularioLimpar;
begin
  ComponentesLimpar;
  edtTitulo.SetFocus;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSair                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Mar�o/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormularioSair;
begin
  Close;
end;

end.
