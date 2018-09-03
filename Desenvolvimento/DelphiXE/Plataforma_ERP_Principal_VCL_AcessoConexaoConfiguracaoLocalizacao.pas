{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informação Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP/VCL                                                                               |}
{|   Fonte: Plataforma_ERP_Principal_VCL_AcessoConexaoConfiguracaoLocalizacao.pas                 |}
{+------------------------------------------------------------------------------------------------+}
{| Formulário para o cadastro das configurações de acesso à aplicação.                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Março/2017 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O código fonte com o programa de computador contido nesse arquivo são de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informação Ltda, e seus direitos autorais são     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem prévia permissão por escrito da proprietária.                                              |}
{| A violação de qualquer um destes direitos é crime!                                             |}
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
    /// Procedimento para limpar os componentes do formulário.
    /// </summary>
    procedure ComponentesLimpar;

    /// <summary>
    /// Procedimento para popular os componentes do formulário.
    /// </summary>
    procedure ComponentesPopular;

    /// <summary>
    /// Procedimento para indicar a ação de localizar.
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
// ÁREA DE EVENTOS                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| FormCreate                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de criação do formulário.                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa as variáveis públicas.
  //
  pubClicouSair     := True;
  pubLocalizarModo  := VCL_LOCALIZAR_PRIMEIRO;
  pubLocalizarTitulo:= '';
end;

{+------------------------------------------------------------------------------------------------+}
{| FormShow                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de exibição do formulário.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormShow(Sender: TObject);
begin
  //
  // Limpa os componentes do formulário.
  //
  ComponentesLimpar;

  //
  // Popula os componentes do formulário com o conteúdo das varíaveis públicas.
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
{| Evento de pressionamento de teclas no formulário.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
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
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
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
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
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
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
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
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
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
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.btnSairClick(Sender: TObject);
begin
  FormularioSair;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
// ÁREA DE PROCEDIMENTOS E FUNÇÕES                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| ComponentesLimpar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
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
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
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
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormularioLocalizar;
begin
  //
  // Carrega as variáveis públicas com o conteúdo dos componentes.
  //
  if rbtModoPrimeiro.Checked then pubLocalizarModo := VCL_LOCALIZAR_PRIMEIRO;
  if rbtModoProximo.Checked  then pubLocalizarModo := VCL_LOCALIZAR_PROXIMO;
  
  pubLocalizarTitulo := edtTitulo.Text;

  //
  // Define que o usuário não clicou em sair.
  //
  pubClicouSair := False;

  //
  // Fecha o formulário.
  //
  Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioLimpar                                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormularioLimpar;
begin
  ComponentesLimpar;
  edtTitulo.SetFocus;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSair                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 04/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.FormularioSair;
begin
  Close;
end;

end.
