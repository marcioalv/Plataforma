//
// Arquivo..: Plataforma_ERP_VCL_CEPLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de CEP's cadastrados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_CEPLista;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLCEPLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    lvwLista: TListView;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnNovo: TBitBtn;
    pbaProgresso: TProgressBar;
    lblListaQtde: TLabel;
    imgBackground: TImage;
    mnuFormulario: TMainMenu;
    mniAtualizar: TMenuItem;
    mniNovo: TMenuItem;
    mniSelecionar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
    btnLocalizar: TBitBtn;
    mniLocalizar: TMenuItem;
    lblListaFiltros: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniLocalizarClick(Sender: TObject);
  private
    priListViewIndiceColuna   : Integer;
    priListViewOrdemAscendente: Boolean;

    priFiltroCEPInicial    : string;
    priFiltroCEPFinal      : string;
    priFiltroEndereco      : string;
    priFiltroBloqueado     : string;
    priFiltroAtivo         : string;
    priFiltroCEPIDInicial  : Integer;
    priFiltroCEPIDFinal    : Integer;
    priFiltroInsDtHrInicial: TDateTime;
    priFiltroInsDtHrFinal  : TDateTime;
    priFiltroUpdDtHrInicial: TDateTime;
    priFiltroUpdDtHrFinal  : TDateTime;    
  
    procedure FormularioControlar;
    procedure FormularioLocalizar;
    procedure FormularioAtualizar(argIndice: Integer);  
    procedure FormularioCadastroExibir(argNovo: Boolean);
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLCEPLista: TPlataformaERPVCLCEPLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_CEPFiltro,
  Plataforma_ERP_VCL_CEPCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_CEPLista.pas';

  LVW_LISTA_CEP_ID   : Integer = 0;
  LVW_LISTA_CEP      : Integer = 1;
  LVW_LISTA_ENDERECO : Integer = 2;
  LVW_LISTA_BAIRRO   : Integer = 3;
  LVW_LISTA_CIDADE   : Integer = 4;
  LVW_LISTA_ESTADO   : Integer = 5;
  LVW_LISTA_PAIS     : Integer = 6;
  LVW_LISTA_BLOQUEADO: Integer = 7;
  LVW_LISTA_ATIVO    : Integer = 8;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLCEPLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;

  priFiltroCEPInicial      := '';
  priFiltroCEPFinal        := '';
  priFiltroEndereco        := '';
  priFiltroBloqueado       := '';
  priFiltroAtivo           := '';
  priFiltroCEPIDInicial    := 0;
  priFiltroCEPIDFinal      := 0;
  priFiltroInsDtHrInicial  := 0;
  priFiltroInsDtHrFinal    := 0;
  priFiltroUpdDtHrInicial  := 0;
  priFiltroUpdDtHrFinal    := 0;  
  
  //
  // Mensagem para o label de quantidade de registros.
  //
  lblListaQtde.Caption := VCL_MENSAGEM_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLCEPLista.FormShow(Sender: TObject);
begin
  //
  // Imagem de background.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla a exibição dos componentes no formulário.
  //
  FormularioControlar;

  //
  // Atualiza a lista.
  //
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLCEPLista.FormActivate(Sender: TObject);
begin
  lblListaQtde.Left := lvwLista.Left;
  lblListaQtde.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lblListaFiltros.Left := (lvwLista.Left + lvwLista.Width) - lblListaFiltros.Width;
  lblListaFiltros.Top  := (lvwLista.Top + lvwLista.Height) + 8;  

  lvwLista.Refresh;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLCEPLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLCEPLista.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLCEPLista.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

procedure TPlataformaERPVCLCEPLista.mniNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

procedure TPlataformaERPVCLCEPLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLCEPLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLCEPLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLCEPLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLCEPLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLCEPLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLCEPLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLCEPLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLCEPLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLCEPLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLCEPLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLCEPLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLCEPLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLCEPLista.FormularioControlar;
begin
  //
  // Menu - Ações.
  //
  mniAtualizar.Visible  := Plataforma_ERP_UsuarioRotina('ERP_CEP_LISTA_ATUALIZAR');
  mniNovo.Visible       := Plataforma_ERP_UsuarioRotina('ERP_CEP_LISTA_NOVO');
  mniSelecionar.Visible := Plataforma_ERP_UsuarioRotina('ERP_CEP_LISTA_SELECIONAR');
  mniMinimizar.Visible  := True;
  mniFechar.Visible     := True;

  //
  // Botões.
  //
  btnNovo.Visible      := mniNovo.Visible;
  btnMinimizar.Visible := btnMinimizar.Enabled;
  btnFechar.Visible    := btnFechar.Enabled;
end;

//
// Procedimento para localizar registros cadastrados.
//
procedure TPlataformaERPVCLCEPLista.FormularioLocalizar;
var
  locFormulario    : TPlataformaERPVCLCEPFiltro;
  locClicouFechar  : Boolean;
  locCEPInicial    : string;
  locCEPFinal      : string;
  locEndereco      : string;
  locBloqueado     : string;
  locAtivo         : string;
  locCEPIDInicial  : Integer;
  locCEPIDFinal    : Integer;
  locInsDtHrInicial: TDateTime;
  locInsDtHrFinal  : TDateTime;
  locUpdDtHrInicial: TDateTime;
  locUpdDtHrFinal  : TDateTime;
begin
  locFormulario := TPlataformaERPVCLCEPFiltro.Create(Self);

  locFormulario.pubCEPInicial     := priFiltroCEPInicial;
  locFormulario.pubCEPFinal       := priFiltroCEPFinal;
  locFormulario.pubEndereco       := priFiltroEndereco;
  locFormulario.pubBloqueado      := priFiltroBloqueado;
  locFormulario.pubAtivo          := priFiltroAtivo;
  locFormulario.pubCEPIDInicial   := priFiltroCEPIDInicial;
  locFormulario.pubCEPIDFinal     := priFiltroCEPIDFinal;
  locFormulario.pubInsDtHrInicial := priFiltroInsDtHrInicial;
  locFormulario.pubInsDtHrFinal   := priFiltroInsDtHrFinal;
  locFormulario.pubUpdDtHrInicial := priFiltroUpdDtHrInicial;
  locFormulario.pubUpdDtHrFinal   := priFiltroUpdDtHrFinal;
  
  locFormulario.ShowModal;

  locClicouFechar   := locFormulario.pubClicouFechar;
  locCEPInicial     := locFormulario.pubCEPInicial;
  locCEPFinal       := locFormulario.pubCEPFinal;
  locEndereco       := locFormulario.pubEndereco;
  locBloqueado      := locFormulario.pubBloqueado;
  locAtivo          := locFormulario.pubAtivo;
  locCEPIDInicial   := locFormulario.pubCEPIDInicial;
  locCEPIDFinal     := locFormulario.pubCEPIDFinal;
  locInsDtHrInicial := locFormulario.pubInsDtHrInicial;
  locInsDtHrFinal   := locFormulario.pubInsDtHrFinal;
  locUpdDtHrInicial := locFormulario.pubUpdDtHrInicial;
  locUpdDtHrFinal   := locFormulario.pubUpdDtHrFinal;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroCEPInicial     := locCEPInicial;
    priFiltroCEPFinal       := locCEPFinal;
    priFiltroEndereco       := locEndereco;
    priFiltroBloqueado      := locBloqueado;
    priFiltroAtivo          := locAtivo;
    priFiltroCEPIDInicial   := locCEPIDInicial;
    priFiltroCEPIDFinal     := locCEPIDFinal;
    priFiltroInsDtHrInicial := locInsDtHrInicial;
    priFiltroInsDtHrFinal   := locInsDtHrFinal;
    priFiltroUpdDtHrInicial := locUpdDtHrInicial;
    priFiltroUpdDtHrFinal   := locUpdDtHrFinal;

    FormularioAtualizar(VCL_NENHUM_INDICE);
  end;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLCEPLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de CEPs';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
  locFiltros      : Boolean;
  locEndereco     : string;  
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa listview.
  //
  VCLListViewLimpar(lvwLista);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  // Abre conexão com o banco de dados da aplicação.
  try
    Plataforma_ERP_ADO_ConexaoAbrir(locADOConnection);
  except
    on locExcecao: Exception do
    begin
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Seleciona dados.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                             ');
  locADOQuery.SQL.Add('  [cep].[cep_id]      AS [cep_id],                 ');
  locADOQuery.SQL.Add('  [cep].[cep]         AS [cep],                    ');
  locADOQuery.SQL.Add('  [cep].[endereco]    AS [endereco],               ');
  locADOQuery.SQL.Add('  [cep].[complemento] AS [complemento],            ');
  locADOQuery.SQL.Add('  [bairro].[nome]     AS [bairro_nome],            ');
  locADOQuery.SQL.Add('  [cidade].[nome]     AS [cidade_nome],            ');
  locADOQuery.SQL.Add('  [estado].[nome]     AS [estado_nome],            ');
  locADOQuery.SQL.Add('  [pais].[nome]       AS [pais_nome],              ');
  locADOQuery.SQL.Add('  [cep].[bloqueado]   AS [bloqueado],              ');
  locADOQuery.SQL.Add('  [cep].[ativo]       AS [ativo]                   ');
  locADOQuery.SQL.Add('FROM                                               ');
  locADOQuery.SQL.Add('  [cep] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [bairro] WITH (NOLOCK)           ');
  locADOQuery.SQL.Add('    ON [bairro].[bairro_id] = [cep].[bairro_id]    ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [cidade] WITH (NOLOCK)           ');
  locADOQuery.SQL.Add('    ON [cidade].[cidade_id] = [cep].[cidade_id]    ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [estado] WITH (NOLOCK)           ');
  locADOQuery.SQL.Add('    ON [estado].[estado_id] = [cidade].[estado_id] ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [pais] WITH (NOLOCK)             ');
  locADOQuery.SQL.Add('    ON [pais].[pais_id] = [estado].[pais_id]       ');
  locADOQuery.SQL.Add('WHERE                                              ');
  locADOQuery.SQL.Add('  1 = 1                                            ');

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroCEPIDInicial > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[cep_id] >= :cep_id_inicial ');
    locADOQuery.Parameters.ParamByName('cep_id_inicial').Value := priFiltroCEPIDInicial;
  end;

  if priFiltroCEPIDFinal > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[cep_id] <= :cep_id_final ');
    locADOQuery.Parameters.ParamByName('cep_id_final').Value := priFiltroCEPIDFinal;
  end;

  if priFiltroCEPInicial <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[cep] >= :cep_inicial ');
    locADOQuery.Parameters.ParamByName('cep_inicial').Value := priFiltroCEPInicial;
  end;

  if priFiltroCEPFinal <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[cep] <= :cep_final ');
    locADOQuery.Parameters.ParamByName('cep_final').Value := priFiltroCEPFinal;
  end;

  if priFiltroEndereco <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[endereco] LIKE :endereco ');
    locADOQuery.Parameters.ParamByName('endereco').Value := StringLikeGerar(priFiltroEndereco);
  end;
  
  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[upd_local_dt_hr] >= :upd_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cep].[upd_local_dt_hr] <= :upd_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
  end;

  //
  // ORDER BY.
  //
  locADOQuery.SQL.Add('ORDER BY                   ');
  locADOQuery.SQL.Add('  [cep].[cep_id] ASC ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [cep]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  locADOQuery.Last;
  locADOQuery.First;

  //
  // Ajusta progressbar.
  //
  VCLProgressBarInicializar(pbaProgresso, locADOQuery.RecordCount);

  //
  // Insere registros no listview.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    lvwLista.Items.BeginUpdate;
    while not locADOQuery.EOF do
    begin
      VCLProgressBarIncrementar(pbaProgresso);

      locEndereco := locADOQuery.FieldByName('endereco').AsString;

      if locADOQuery.FieldByName('complemento').AsString <> '' then
      begin
        locEndereco := locEndereco + ' - ' + locADOQuery.FieldByName('complemento').AsString;
      end;
    
      locListItem         := lvwLista.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('cep_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('cep').AsString);
      locListItem.SubItems.Add(locEndereco);
      locListItem.SubItems.Add(locADOQuery.FieldByName('bairro_nome').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('cidade_nome').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('estado_nome').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('pais_nome').AsString);      
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('ativo').AsString));

      locADOQuery.Next;
    end;
    lvwLista.Items.EndUpdate;
  end;

  //
  // Label de quantidade de linhas no listview.
  //
  VCLListViewQtdeLinhasMensagem(lblListaQtde, lvwLista, locFiltros);
  lblListaFiltros.Visible := locFiltros;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLProgressBarLimpar(pbaProgresso);
  VCLCursorTrocar;

  //
  // Foco no item correto da lista.
  //
  if argIndice = VCL_NENHUM_INDICE then
  begin
    VCLListViewFocar(lvwLista);
  end
  else
  begin
    VCLListViewItemPosicionar(lvwLista, argIndice);
    lvwLista.SetFocus;
  end;
end;

//
// Procedimento para exibir o formulário de cadastro.
//
procedure TPlataformaERPVCLCEPLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario      : TPlataformaERPVCLCEPCadastro;
  locDadosAtualizados: Boolean;
  locIndice          : Integer;
  locCEPID           : Integer;
begin
  if argNovo then
  begin
    locIndice := VCL_NENHUM_INDICE;
    locCEPID  := 0;
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;
    locCEPID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CEP_ID]);
  end;

  locFormulario := TPlataformaERPVCLCEPCadastro.Create(Self);

  locFormulario.pubCEPID := locCEPID;
  
  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioAtualizar(locIndice);
  end;
end;

end.