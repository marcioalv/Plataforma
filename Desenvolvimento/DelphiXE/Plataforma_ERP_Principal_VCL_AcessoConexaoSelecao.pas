{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informa��o Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP/VCL                                                                               |}
{|   Fonte: Plataforma_ERP_Principal_VCL_AcessoConexaoSelecao.pas                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Formul�rio VCL para a sele��o da conex�o � base de dados do aplicativo .                       |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2017 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O c�digo fonte com o programa de computador contido nesse arquivo s�o de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informa��o Ltda, e seus direitos autorais s�o     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem pr�via permiss�o por escrito da propriet�ria.                                              |}
{| A viola��o de qualquer um destes direitos � crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_ERP_Principal_VCL_AcessoConexaoSelecao;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_Framework_Conexao,
  Plataforma_ERP_Principal_Unit_ArquivoInicializacao,
  Plataforma_ERP_Principal_VCL_AcessoConexaoFiltro,
  Plataforma_ERP_Principal_VCL_AcessoConexaoConfiguracao,
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
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

const
  LVW_COLUNA_ITEM  : Integer = 0;
  LVW_COLUNA_TITULO: Integer = 1;

type
  TPlataformaERPPrincipalVCLAcessoConexaoSelecao = class(TForm)
    panFormulario: TPanel;
    lvwLista: TListView;
    btnAtualizar: TButton;
    btnFiltrar: TButton;
    btnSair: TButton;
    btnSelecionar: TButton;
    lblQtdeLinhas: TLabel;
    lblFiltrosAplicados: TLabel;
    btnConfigurar: TButton;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure btnConfigurarClick(Sender: TObject);
  private
    priListViewColuna    : Integer;
    priListViewAscendente: Boolean;
    
    priFiltroItemInicial : Integer;
    priFiltroItemFinal   : Integer;
    priFiltroTitulo      : string;
  
    /// <summary>
    /// Procedimento para limpar os componentes do formul�rio.
    /// </summary>
    procedure ComponentesLimpar;

    /// <summary>
    /// Procedimento para controlar os componentes do formul�rio.
    /// </summary>
    procedure ComponentesControlar;

    /// <summary>
    /// Procedimento para selecionar uma das conex�es dispon�veis.
    /// </summary>
    procedure FormularioSelecionar;

    /// <summary>
    /// Procedimento para exibir o formul�rio de filtros.
    /// </summary>
    procedure FormularioFiltrar;

    /// <summary>
    /// Procedimento para atualizar a lista de conex�es dispon�veis.
    /// </summary>
    procedure FormularioAtualizar;

    /// <summary>
    /// Procedimento para abrir o formul�rio de configura��es.
    /// </summary>
    procedure FormularioConfigurar;

    /// <summary>
    /// Procedimento para sair do formul�rio.
    /// </summary>
    procedure FormularioSair;
  public
    pubClicouSair: Boolean;
    pubItem      : Integer;
    pubTitulo    : string;
  end;

var
  PlataformaERPPrincipalVCLAcessoConexaoSelecao: TPlataformaERPPrincipalVCLAcessoConexaoSelecao;

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
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis privadas do formul�rio.
  //
  priListViewColuna     := 0;
  priListViewAscendente := True;
  
  priFiltroItemInicial := 0;
  priFiltroItemFinal   := 0;
  priFiltroTitulo      := '';

  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouSair := True;
  pubItem       := 0;
  pubTitulo     := '';

  //
  // Inicializa alguns componentes.
  //
  lblQtdeLinhas.Caption := VCL_MSG_ATUALIZAR;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormShow                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de exibi��o do formul�rio.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormShow(Sender: TObject);
begin
  //
  // Carrega lista de conex�es cadastradas.
  //
  FormularioAtualizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormKeyPress                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de pressionamento de teclas no formul�rio.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| lvwLista                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do listview lvwLista.                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

{+------------------------------------------------------------------------------------------------+}
{| btnSelecionarClick                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no bot�o btnSelecionar.                                                        |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnFiltrarClick                                                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no bot�o btnFiltrar.                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.btnFiltrarClick(Sender: TObject);
begin
  FormularioFiltrar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnAtualizarClick                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no bot�o btnAtualizar.                                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.btnAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnConfigurarClick                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no bot�o btnConfigurar.                                                        |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.btnConfigurarClick(Sender: TObject);
begin
  FormularioConfigurar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnSairClick                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no bot�o btnSair.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.btnSairClick(Sender: TObject);
begin
  FormularioSair;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
// �REA DE PROCEDIMENTOS E FUN��ES                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| ComponentesLimpar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.ComponentesLimpar;
begin
  lblQtdeLinhas.Caption       := '';
  lblFiltrosAplicados.Visible := False;
  VCLListViewLimpar(lvwLista);

  ComponentesControlar;
end;

{+------------------------------------------------------------------------------------------------+}
{| ComponentesControlar                                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.ComponentesControlar;
begin
  btnSelecionar.Visible := (lvwLista.Items.Count > 0);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSelecionar                                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormularioSelecionar;
var
  locIndice: Integer;
begin
  //
  // Determina o item da linha selecionada.
  //
  if VCLListViewIndiceItemRetornar(lvwLista) = VCL_NENHUM_INDICE then
  begin
    Exit;
  end;

  locIndice := lvwLista.Selected.Index;

  //
  // Define o valor do item.
  //
  pubItem   := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_ITEM]);
  pubTitulo := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TITULO];

  //
  // Usu�rio n�o clicou em sair.
  //
  pubClicouSair := False;

  //
  // Fecha formul�rio.
  //
  Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioFiltrar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormularioFiltrar;
var
  locFormulario: TPlataformaERPPrincipalVCLAcessoConexaoFiltro;
  locClicouSair: Boolean;
begin
  //
  // Cria o formul�rio.
  //
  locFormulario := TPlataformaERPPrincipalVCLAcessoConexaoFiltro.Create(Self);

  //
  // Passa o conte�do dos filtros memorizados.
  //
  locFormulario.pubFiltroItemInicial := priFiltroItemInicial;
  locFormulario.pubFiltroItemFinal   := priFiltroItemFinal;
  locFormulario.pubFiltroTitulo      := priFiltroTitulo;
  
  //
  // Exibe o formul�rio de filtros.
  //
  locFormulario.ShowModal;

  //
  // Carrega informa��es sobre o retorno.
  //
  locClicouSair := locFormulario.pubClicouSair;

  if not locClicouSair then
  begin
    //
    // Memoriza os novos filtros informados pelo usu�rio.
    //
    priFiltroItemInicial := locFormulario.pubFiltroItemInicial;
    priFiltroItemFinal   := locFormulario.pubFiltroItemFinal;
    priFiltroTitulo      := locFormulario.pubFiltroTitulo;
  end;

  //
  // Garante que o formul�rio foi fechado.
  //  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  //
  // Executa a atualiza��o da lista com os novos filtros.
  //
  if not locClicouSair then
  begin
    FormularioAtualizar;
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioAtualizar                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormularioAtualizar;
var
  locListaConexoes: TListaConexoes;
  locContador     : Integer;
  locListItem     : TListItem;
begin
  //
  // Troca o cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componentes.
  //
  ComponentesLimpar;

  //
  // Indica se algum filtro foi informado.
  //
  if (priFiltroItemInicial <> 0) or
     (priFiltroItemFinal   <> 0) or
     (priFiltroTitulo      <> '') then
  begin
    lblFiltrosAplicados.Visible := True;
  end;

  //
  // Carrega lista de conexoes configuradas.
  //
  try
    locListaConexoes := ListaConexoesLocaisCarregar(priFiltroItemInicial,
                                                    priFiltroItemFinal,
                                                    priFiltroTitulo);
  except
    on locErro: Exception do
    begin
      VCLCursorTrocar;
      VCLErroExibir('Ocorreu algum erro ao carregar os dados da lista!',
                    locErro.Message);
      Exit;
    end;
  end;

  //
  // Carrega listview com a lista de conex�es.
  //
  if locListaConexoes <> nil then
  begin
    for locContador := 0 to (Length(locListaConexoes) - 1) do
    begin
      //
      // Insere linha no listview.
      //
      locListItem         := lvwLista.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].Item));
      locListItem.SubItems.Add(locListaConexoes[locContador].Titulo);
      locListItem.SubItems.Add(locListaConexoes[locContador].SGBD);
      locListItem.SubItems.Add(locListaConexoes[locContador].Servidor);
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].Porta));
      locListItem.SubItems.Add(locListaConexoes[locContador].Instancia);
      locListItem.SubItems.Add(locListaConexoes[locContador].Usuario);
      locListItem.SubItems.Add(locListaConexoes[locContador].Senha);
      locListItem.SubItems.Add(locListaConexoes[locContador].BancoDados);
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].TimeOut));
    end;
  end;

  //
  // Atualiza a quantidade de itens da lista.
  //
  VCLLabelQtdeLinhasExibir(lblQtdeLinhas, lvwLista, lblFiltrosAplicados.Visible);

  //
  // Controla a exibi��o dos componentes.
  //
  ComponentesControlar;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;

  //
  // Foco no listview.
  //
  VCLListViewFocar(lvwLista);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioConfigurar                                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormularioConfigurar;
var
  locFormulario: TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao;
begin
  //
  // Exibe formul�rio para configura��o de conex�es.
  //
  locFormulario := TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);

  //
  // Atualiza a lista de conex�es dispon�veis.
  //
  FormularioAtualizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSair                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoSelecao.FormularioSair;
begin
  Close;
end;

end.
