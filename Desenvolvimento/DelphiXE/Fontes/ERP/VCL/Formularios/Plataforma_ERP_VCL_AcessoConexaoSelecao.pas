
unit Plataforma_ERP_VCL_AcessoConexaoSelecao;

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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

const
  LVW_COLUNA_ITEM  : Integer = 0;
  LVW_COLUNA_TITULO: Integer = 1;

type
  TPlataformaERPVCLAcessoConexaoSelecao = class(TForm)
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

    procedure ComponentesLimpar;
    procedure ComponentesControlar;
    procedure FormularioSelecionar;
    procedure FormularioFiltrar;
    procedure FormularioAtualizar;
    procedure FormularioConfigurar;
    procedure FormularioSair;
  public
    pubClicouSair: Boolean;
    pubItem      : Integer;
    pubTitulo    : string;
  end;

var
  PlataformaERPVCLAcessoConexaoSelecao: TPlataformaERPVCLAcessoConexaoSelecao;

implementation

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

{$R *.dfm}

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas do formulário.
  //
  priListViewColuna     := 0;
  priListViewAscendente := True;
  
  priFiltroItemInicial := 0;
  priFiltroItemFinal   := 0;
  priFiltroTitulo      := '';

  //
  // Inicializa variáveis públicas.
  //
  pubClicouSair := True;
  pubItem       := 0;
  pubTitulo     := '';

  //
  // Inicializa alguns componentes.
  //
  lblQtdeLinhas.Caption := VCL_MSG_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormShow(Sender: TObject);
begin
  //
  // Carrega lista de conexões cadastradas.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos da lista.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

{+------------------------------------------------------------------------------------------------+}
{| btnSelecionarClick                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnSelecionar.                                                        |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnFiltrarClick                                                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnFiltrar.                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnFiltrarClick(Sender: TObject);
begin
  FormularioFiltrar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnAtualizarClick                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnAtualizar.                                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnConfigurarClick                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnConfigurar.                                                        |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnConfigurarClick(Sender: TObject);
begin
  FormularioConfigurar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnSairClick                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnSair.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnSairClick(Sender: TObject);
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
procedure TPlataformaERPVCLAcessoConexaoSelecao.ComponentesLimpar;
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
procedure TPlataformaERPVCLAcessoConexaoSelecao.ComponentesControlar;
begin
  btnSelecionar.Visible := (lvwLista.Items.Count > 0);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSelecionar                                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioSelecionar;
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
  // Usuário não clicou em sair.
  //
  pubClicouSair := False;

  //
  // Fecha formulário.
  //
  Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioFiltrar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioFiltrar;
var
  locFormulario: TPlataformaERPPrincipalVCLAcessoConexaoFiltro;
  locClicouSair: Boolean;
begin
  //
  // Cria o formulário.
  //
  locFormulario := TPlataformaERPPrincipalVCLAcessoConexaoFiltro.Create(Self);

  //
  // Passa o conteúdo dos filtros memorizados.
  //
  locFormulario.pubFiltroItemInicial := priFiltroItemInicial;
  locFormulario.pubFiltroItemFinal   := priFiltroItemFinal;
  locFormulario.pubFiltroTitulo      := priFiltroTitulo;
  
  //
  // Exibe o formulário de filtros.
  //
  locFormulario.ShowModal;

  //
  // Carrega informações sobre o retorno.
  //
  locClicouSair := locFormulario.pubClicouSair;

  if not locClicouSair then
  begin
    //
    // Memoriza os novos filtros informados pelo usuário.
    //
    priFiltroItemInicial := locFormulario.pubFiltroItemInicial;
    priFiltroItemFinal   := locFormulario.pubFiltroItemFinal;
    priFiltroTitulo      := locFormulario.pubFiltroTitulo;
  end;

  //
  // Garante que o formulário foi fechado.
  //  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  //
  // Executa a atualização da lista com os novos filtros.
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
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioAtualizar;
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
  // Carrega listview com a lista de conexões.
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
  // Controla a exibição dos componentes.
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
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioConfigurar;
var
  locFormulario: TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao;
begin
  //
  // Exibe formulário para configuração de conexões.
  //
  locFormulario := TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);

  //
  // Atualiza a lista de conexões disponíveis.
  //
  FormularioAtualizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSair                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioSair;
begin
  Close;
end;

end.
