{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informação Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP/VCL                                                                               |}
{|   Fonte: Plataforma_ERP_Principal_VCL_AcessoConexaoFiltro.pas                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Formulário VCL para os filtros de conexão à base de dados do aplicativo .                      |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2017 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O código fonte com o programa de computador contido nesse arquivo são de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informação Ltda, e seus direitos autorais são     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem prévia permissão por escrito da proprietária.                                              |}
{| A violação de qualquer um destes direitos é crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_ERP_Principal_VCL_AcessoConexaoFiltro;

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
  TPlataformaERPPrincipalVCLAcessoConexaoFiltro = class(TForm)
    panFormulario: TPanel;
    btnAplicar: TButton;
    btnSair: TButton;
    lblItem: TLabel;
    edtItemInicial: TEdit;
    lblItemAte: TLabel;
    edtItemFinal: TEdit;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    btnLimpar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtItemInicialEnter(Sender: TObject);
    procedure edtItemInicialExit(Sender: TObject);
    procedure edtItemInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemFinalEnter(Sender: TObject);
    procedure edtItemFinalExit(Sender: TObject);
    procedure edtItemFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
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
    /// Função para consistir se os dados informados no formulário podem ser aplicados.
    /// </summary>
    /// <returns>
    /// TRUE se os dados estão consistentes ou FALSE se houver alguma critica.
    /// </returns>
    function AplicacaoConsistir: Boolean;

    /// <summary>
    /// Procedimento para aplicar os filtros.
    /// </summary>
    procedure FormularioAplicar;

    /// <summary>
    /// Procedimento para limpar os filtros.
    /// </summary>
    procedure FormularioLimpar;

    /// <summary>
    /// Procedimento para sair.
    /// </summary>
    procedure FormularioSair;
  public
    pubClicouSair       : Boolean;
    pubFiltroItemInicial: Integer;
    pubFiltroItemFinal  : Integer;
    pubFiltroTitulo     : string;
  end;

var
  PlataformaERPPrincipalVCLAcessoConexaoFiltro: TPlataformaERPPrincipalVCLAcessoConexaoFiltro;

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
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa as variáveis públicas.
  //
  pubClicouSair        := True;
  pubFiltroItemInicial := 0;
  pubFiltroItemFinal   := 0;
  pubFiltroTitulo      := '';
end;

{+------------------------------------------------------------------------------------------------+}
{| FormShow                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de exibição do formulário.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.FormShow(Sender: TObject);
begin
  //
  // Limpa os componentes do formulário. 
  //
  ComponentesLimpar;

  //
  // Popula os componentes do formulário com o conteúdo das varíaveis públicas.
  //
  ComponentesPopular;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormKeyPress                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de pressionamento de teclas no formulário.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| edtItemInicial                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtItemInicial.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtItemInicialEnter(Sender: TObject);
begin
  VCLEditEntrar(edtItemInicial);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtItemInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtItemInicialExit(Sender: TObject);
begin
  VCLEditSair(edtItemInicial);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtItemFinal                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtItemFinal.                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtItemFinalEnter(Sender: TObject);
begin
  VCLEditEntrar(edtItemFinal);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtItemFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtItemFinalExit(Sender: TObject);
begin
  VCLEditSair(edtItemFinal);
end;

{+------------------------------------------------------------------------------------------------+}
  {| edtTitulo                                                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtTituloEnter.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtTituloEnter(Sender: TObject);
begin
  VCLEditEntrar(edtTitulo);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.edtTituloExit(Sender: TObject);
begin
  VCLEditSair(edtTitulo);
end;

{+------------------------------------------------------------------------------------------------+}
{| btnAplicarClick                                                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no componente btnAplicar.                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.btnAplicarClick(Sender: TObject);
begin
  FormularioAplicar
end;

{+------------------------------------------------------------------------------------------------+}
{| btnLimparClick                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no componente btnLimpar.                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnSairClick                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no componente btnSair.                                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.btnSairClick(Sender: TObject);
begin
  FormularioSair;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
// ÁREA DE PROCEDIMENTOS E FUNÇÕES                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| ComponentesLimpar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.ComponentesLimpar;
begin
  VCLEditLimpar(edtItemInicial);
  VCLEditLimpar(edtItemFinal);
  VCLEditLimpar(edtTitulo);
end;

{+------------------------------------------------------------------------------------------------+}
{| ComponentesPopular                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.ComponentesPopular;
begin
  edtItemInicial.Text := IntegerStringConverter(pubFiltroItemInicial, True);
  edtItemFinal.Text   := IntegerStringConverter(pubFiltroItemFinal,   True);
  edtTitulo.Text      := pubFiltroTitulo;
end;

{+------------------------------------------------------------------------------------------------+}
{| AplicacaoConsistir                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
function TPlataformaERPPrincipalVCLAcessoConexaoFiltro.AplicacaoConsistir: Boolean;
var
  locItemInicial: Integer;
  locItemFinal  : Integer;
begin
  //
  // Retorno padrão.
  //
  Result := False;

  //
  // Carrega variáveis.
  //
  locItemInicial := StringIntegerConverter(edtItemInicial.Text);
  locItemFinal   := StringIntegerConverter(edtItemFinal.Text);

  //
  // O número do item final não pode ser menor que o inicial.
  //
  if locItemFinal < locItemInicial then
  begin
    VCLConsistenciaExibir('O número do item final não pode ser menor que o inicial!');
    edtItemInicial.SetFocus;
    Exit;
  end;

  //
  // Se passou por todas as consistências então está OK.
  //
  Result := True;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioAplicar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.FormularioAplicar;
begin
  //
  // Consistências.
  //
  if not AplicacaoConsistir then Exit;

  //
  // Carrega as variáveis públicas com o conteúdo dos componentes.
  //
  pubFiltroItemInicial := StringIntegerConverter(edtItemInicial.Text);
  pubFiltroItemFinal   := StringIntegerConverter(edtItemFinal.Text);
  pubFiltroTitulo      := edtTitulo.Text;

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
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.FormularioLimpar;
begin
  ComponentesLimpar;
  edtItemInicial.SetFocus;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSair                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoFiltro.FormularioSair;
begin
  Close;
end;

end.
