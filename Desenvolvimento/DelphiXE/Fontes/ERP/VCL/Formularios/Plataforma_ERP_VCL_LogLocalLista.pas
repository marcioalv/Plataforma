//
// Arquivo..: Plataforma_ERP_VCL_LogLocalLista.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para exibir a lista de logs da aplica��o ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_LogLocalLista;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_Framework_Log,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_LogLocalArquivoSelecao,
  Plataforma_ERP_VCL_LogLocalFiltro,
  Plataforma_ERP_VCL_LogLocalLocalizar,
  Plataforma_ERP_VCL_LogLocalDetalhe,
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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.Menus;

const
  LVW_COLUNA_ICONE       : Integer = -1;
  LVW_COLUNA_APLICATIVO  : Integer =  0;
  LVW_COLUNA_HASH_CODE   : Integer =  1;
  LVW_COLUNA_HOST_NAME   : Integer =  2;
  LVW_COLUNA_USER_NAME   : Integer =  3;
  LVW_COLUNA_USUARIO_ID  : Integer =  4;
  LVW_COLUNA_USUARIO_NOME: Integer =  5;
  LVW_COLUNA_CRITICO     : Integer =  6;
  LVW_COLUNA_DATA_HORA   : Integer =  7;
  LVW_COLUNA_MENSAGEM    : Integer =  8;

type
  TPlataformaERPVCLLogLocalLista = class(TForm)
    panFormulario: TPanel;
    lblArquivoLog: TLabel;
    txtArquivoLog: TEdit;
    lblInformacoes: TLabel;
    lvwInformacoes: TListView;
    btnFiltrar: TBitBtn;
    btnLocalizar: TBitBtn;
    btnAtualizar: TBitBtn;
    btnFechar: TBitBtn;
    btnDetalhes: TBitBtn;
    btnMinimizar: TBitBtn;
    imgFormulario: TImage;
    btnSelecionar: TBitBtn;
    pbaProgresso: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDetalhesClick(Sender: TObject);
    procedure lvwInformacoesCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwInformacoesCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwInformacoesDblClick(Sender: TObject);
    procedure lvwInformacoesKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    priSelecaoTipo            : Byte;
    priSelecaoArquivo         : string;
    priSelecaoDtLog           : TDateTime;

    priFiltroDtHrOcorrenciaIni: TDateTime;
    priFiltroDtHrOcorrenciaFim: TDateTime;
    priFiltroMensagem         : string;
    priFiltroHashCode         : string;

    priLocalizarDtHrOcorrencia: TDateTime;
    priLocalizarMensagem      : string;
  
    function  ArquivoLogConsistir: Boolean;
    procedure InformacoesPopular;
    procedure InformacoesLocalizar;
    procedure FormularioLimpar;
    procedure FormularioArquivoSelecaoExibir;
    procedure FormularioFiltroExibir;
    procedure FormularioLocalizarExibir;
    procedure FormularioDetalhesExibir;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLLogLocalLista: TPlataformaERPVCLLogLocalLista;

implementation

{$R *.dfm}

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormCreate(Sender: TObject);
begin
  // Inicializa vari�veis privadas.
  priSelecaoTipo             := 0;
  priSelecaoArquivo          := '';
  priSelecaoDtLog            := 0;

  priFiltroDtHrOcorrenciaIni := 0;
  priFiltroDtHrOcorrenciaFim := 0;
  priFiltroMensagem          := '';
  priFiltroHashCode          := '';

  priLocalizarDtHrOcorrencia := 0;
  priLocalizarMensagem       := '';
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormShow(Sender: TObject);
begin
  // Limpa componentes do formul�rio.
  FormularioLimpar;

  // Arquivo de log padr�o.
  txtArquivoLog.Text := Plataforma_ERP_Global.gloLocalLog.PathFile;
  priSelecaoTipo     := LOG_SELECAO_HISTORICO;
  priSelecaoArquivo  := txtArquivoLog.Text;

  // Carregar lista.
  InformacoesPopular;
end;

//
// Evento de ativa��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormActivate(Sender: TObject);
begin
  // Maximizar formul�rio.
  VCLSDIMaximizar(Self);
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // Usu�rio clicou ESC.
  if Key = ESC then Close;
end;

//
// Evento de redimensionamento do formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormResize(Sender: TObject);
begin
  txtArquivoLog.Width := panFormulario.Width - (btnSelecionar.Width + (txtArquivoLog.Left * 2) + 8);

  btnSelecionar.Top   := txtArquivoLog.Top - 1;
  btnSelecionar.Left  := panFormulario.Width - (btnSelecionar.Width + txtArquivoLog.Left);

  lvwInformacoes.Width  := panFormulario.Width  - (lvwInformacoes.Left * 2);
  lvwInformacoes.Height := panFormulario.Height - (lvwInformacoes.Top + lvwInformacoes.Left);

  pbaProgresso.Width   := lvwInformacoes.Width - (lvwInformacoes.Margins.Left + lvwInformacoes.Margins.Right);
end;

//
// Procedimento para exibir o formul�rio de sele��o do arquivo de log local.
//
procedure TPlataformaERPVCLLogLocalLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioArquivoSelecaoExibir;
end;

//
// Eventos de controle do listview.
//
procedure TPlataformaERPVCLLogLocalLista.lvwInformacoesCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogLocalLista.lvwInformacoesCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogLocalLista.lvwInformacoesDblClick(Sender: TObject);
begin
  btnDetalhesClick(Sender);
end;

procedure TPlataformaERPVCLLogLocalLista.lvwInformacoesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwInformacoesDblClick(Sender);
end;

//
// Evento de click no bot�o "Filtrar".
//
procedure TPlataformaERPVCLLogLocalLista.btnFiltrarClick(Sender: TObject);
begin
  FormularioFiltroExibir;
end;

//
// Evento de click no bot�o "Localizar".
//
procedure TPlataformaERPVCLLogLocalLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizarExibir;
end;

//
// Evento de click no bot�o "Atualizar".
//
procedure TPlataformaERPVCLLogLocalLista.btnAtualizarClick(Sender: TObject);
begin
  InformacoesPopular;  
end;

//
// Evento de click no bot�o "Detalhes".
//
procedure TPlataformaERPVCLLogLocalLista.btnDetalhesClick(Sender: TObject);
begin
  FormularioDetalhesExibir;
end;

//
// Evento de click no bot�o "Minimizar".
//
procedure TPlataformaERPVCLLogLocalLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLLogLocalLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// ArquivoLogConsistir.
//
function TPlataformaERPVCLLogLocalLista.ArquivoLogConsistir: Boolean;
begin
  if txtArquivoLog.Text = '' then
  begin
    VCLConsistenciaExibir('Nenhum arquivo de log selecionado!');
    Result := False;
    Exit;
  end;

  Result := True;
end;

//
// Popula as informa��es do arquivo de log no listview.
//
procedure TPlataformaERPVCLLogLocalLista.InformacoesPopular;
var
  locMsgLog        : string;
  locContador      : Integer;
  locArquivoLog    : string;  
  locTextFile      : TextFile;
  locLinha         : string;
  locLinhasArquivo : array of string;
  locStringList    : TStringList;
  locHostName      : string;
  locUserName      : string;
  locAppNome       : string;
  locAppHashCode   : string;
  locAppUsuarioID  : Integer;
  locAppUsuarioNome: string;
  locCritico       : Boolean;
  locDataHora      : TDateTime;
  locMensagem      : string;
  locListItem      : TListItem;
begin
  // Consist�ncias.
  if not ArquivoLogConsistir then Exit;

  // Troca cursor.
  VCLCursorTrocar(True);

  // Limpa listview.
  VCLListViewLimpar(lvwInformacoes);

  // Localiza��o do arquivo de log que ser� exibido.
  locArquivoLog := txtArquivoLog.Text;

  // Confirma se o arquivo realmente existe.
  if not FileExists(locArquivoLog) then
  begin
    VCLCursorTrocar;
    locMsgLog := 'O arquivo de log informando n�o foi localizado ou n�o p�de ser acessado em [' + locArquivoLog + ']';
    VCLConsistenciaExibir(locMsgLog);
    Exit;
  end;

  // Acessa o arquivo texto.
  try
    AssignFile(locTextFile, locArquivoLog);
  except
    on locErro: Exception do
    begin
      VCLCursorTrocar;
      locMsgLog := 'Imposs�vel acessar o arquivo de log: [' + locArquivoLog + ']';
      Plataforma_ERP_Logar(True, locMsgLog, locErro.Message);
      VCLErroExibir(locMsgLog, locErro.Message);
      Exit;
    end;
  end;

  // Abre arquivo texto para leitura.
  try
    Reset(locTextFile);
  except
    on locErro: Exception do
    begin
      VCLCursorTrocar;
      locMsgLog := 'Imposs�vel abrir o arquivo de log para leitura: [' + locArquivoLog + ']';
      Plataforma_ERP_Logar(True, locMsgLog, locErro.Message);
      VCLErroExibir(locMsgLog, locErro.Message);
      Exit;
    end;
  end;

  // Percorre cada uma das linhas do arquivo texto.
  locLinhasArquivo := nil;
  
  while not EOF(locTextFile) do
  begin
    // L� uma linha do arquivo texto.
    Readln(locTextFile, locLinha);

    // Insere no array.
    SetLength(locLinhasArquivo, Length(locLinhasArquivo) + 1);
    locLinhasArquivo[Length(locLinhasArquivo) - 1] := locLinha;
  end;

  // Fecha arquivo texto.
  CloseFile(locTextFile);

  // Carrega o listview.
  VCLProgressBarInicializar(pbaProgresso, Length(locLinhasArquivo));

  lvwInformacoes.Items.BeginUpdate;
  
  for locContador := (Length(locLinhasArquivo) - 1) downto 0 do
  begin
    // Incrementa progressbar.
    VCLProgressBarIncrementar(pbaProgresso);
  
    // L� uma linha do array.
    locLinha := locLinhasArquivo[locContador];

    // Separa a linha em partes.
    locStringList := StringSeparar(locLinha, '|');

    // Inicializa vari�veis.
    locHostName       := '';
    locUserName       := '';
    locAppNome        := '';
    locAppHashCode    := '';
    locAppUsuarioID   := 0;
    locAppUsuarioNome := '';
    locCritico        := False;
    locDataHora       := 0;
    locMensagem       := '';

    // Carrega cada parte separadamente.
    if locStringList.Count >= 1 then locHostName       := locStringList[0];
    if locStringList.Count >= 2 then locUserName       := locStringList[1];
    if locStringList.Count >= 3 then locAppNome        := locStringList[2];
    if locStringList.Count >= 4 then locAppHashCode    := locStringList[3];
    if locStringList.Count >= 5 then locAppUsuarioID   := StringIntegerConverter(locStringList[4]);
    if locStringList.Count >= 6 then locAppUsuarioNome := locStringList[5];
    if locStringList.Count >= 7 then locCritico        := StringBooleanConverter(locStringList[6]);
    if locStringList.Count >= 8 then locDataHora       := StringDataHoraPersistidaConverter(locStringList[7]);
    if locStringList.Count >= 9 then locMensagem       := locStringList[8];

    // Filtro por data.
    if priFiltroDtHrOcorrenciaIni > 0 then
    begin
      if locDataHora < priFiltroDtHrOcorrenciaIni then Continue;
    end;

    if priFiltroDtHrOcorrenciaFim > 0 then
    begin
      if locDataHora > priFiltroDtHrOcorrenciaFim then Continue;
    end;

    // Filtro por mensagem.
    if priFiltroMensagem <> '' then
    begin
      if not StringLocalizar(StringAcentosRemover(locMensagem), StringAcentosRemover(priFiltroMensagem)) then Continue;
    end;

    // Filtro pelo hashcode.
    if priFiltroHashCode <> '' then
    begin
      if not StringLocalizar(locAppHashCode, priFiltroHashCode) then Continue;
    end;
    
    // Insere dados no listview.
    if Trim(locMensagem) <> '' then
    begin
      locListItem         := lvwInformacoes.Items.Add;
      locListItem.Caption := '';                                                                 // �cone.
      locListItem.SubItems.Add(locAppNome);                                                      // Aplicativo.
      locListItem.SubItems.Add(locAppHashCode);                                                  // HashCode.
      locListItem.SubItems.Add(locHostName);                                                     // HostName.
      locListItem.SubItems.Add(locUserName);                                                     // UserName.
      locListItem.SubItems.Add(IntegerStringConverter(locAppUsuarioID));                         // Usu�rio ID.
      locListItem.SubItems.Add(locAppUsuarioNome);                                               // Usu�rio nome.
      locListItem.SubItems.Add(BooleanStringConverter(locCritico, False));                       // Cr�tico.
      locListItem.SubItems.Add(DateTimeStringConverter(locDataHora, 'dd/mm/yyyy hh:nn:ss.zzz')); // Data e hora.
      locListItem.SubItems.Add(locMensagem);                                                     // Mensagem.
    end;
  end;

  lvwInformacoes.Items.EndUpdate;
  VCLProgressBarLimpar(pbaProgresso);

  // Posiciona na �ltima linha.
  VCLListViewItemPosicionar(lvwInformacoes, 0);

  // Finaliza.
  VCLCursorTrocar;
end;

//
// Procedimento para localizar informa��es na lista.
//
procedure TPlataformaERPVCLLogLocalLista.InformacoesLocalizar;
var
  locContador      : Integer;
  locDtHrOcorrencia: TDateTime;
  locMensagem      : string;
  locAchou         : Boolean;
begin
  VCLCursorTrocar(True);
  VCLProgressBarInicializar(pbaProgresso, lvwInformacoes.Items.Count);

  locAchou := False;
  for locContador := (lvwInformacoes.Items.Count - 1) downto 0 do
  begin
    VCLProgressBarIncrementar(pbaProgresso);
  
    locDtHrOcorrencia := StringDateTimeConverter(lvwInformacoes.Items[locContador].SubItems.Strings[LVW_COLUNA_DATA_HORA]);
    locMensagem       := StringAcentosRemover(lvwInformacoes.Items[locContador].SubItems.Strings[LVW_COLUNA_MENSAGEM]);

    if priLocalizarDtHrOcorrencia <> 0 then
    begin
      if locDtHrOcorrencia >= priLocalizarDtHrOcorrencia then
      begin
        locAchou := True;
        VCLListViewItemPosicionar(lvwInformacoes, locContador);
        Break;
      end;
    end;

    if priLocalizarMensagem <> '' then
    begin
      if StringLocalizar(locMensagem, StringAcentosRemover(priLocalizarMensagem)) then
      begin
        locAchou := True;
        VCLListViewItemPosicionar(lvwInformacoes, locContador);
        Break;
      end;
    end;
  end;

  VCLProgressBarLimpar(pbaProgresso);
  VCLCursorTrocar;
  
  if not locAchou then
  begin
    VCLConsistenciaExibir('Informa��o n�o localizada!');
  end;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioLimpar;
begin
  // Troca cursor espera.
  VCLCursorTrocar;

  // Limpando componentes.
  VCLEditLimpar(txtArquivoLog);
  VCLListViewLimpar(lvwInformacoes);

  // Troca cursor normal.
  VCLCursorTrocar(False);
end;

//
// Procedimento para exibir o formul�rio de sele��o do arquivo de log.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioArquivoSelecaoExibir;
var
  locFormulario      : TPlataformaERPVCLLogLocalArquivoSelecao;
  locClicouSelecionar: Boolean;
  locTipo            : Byte;
  locArquivo         : string;
  locDtLog           : TDateTime;
begin
  locArquivo := txtArquivoLog.Text;

  locFormulario            := TPlataformaERPVCLLogLocalArquivoSelecao.Create(Self);
  locFormulario.pubTipo    := priSelecaoTipo;
  locFormulario.pubArquivo := priSelecaoArquivo;
  locFormulario.pubDtLog   := priSelecaoDtLog;

  locFormulario.ShowModal;

  locClicouSelecionar := locFormulario.pubClicouSelecionar;
  locTipo             := locFormulario.pubTipo;
  locArquivo          := locFormulario.pubArquivo;
  locDtLog            := locFormulario.pubDtLog;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouSelecionar then Exit;

  priSelecaoTipo    := locTipo;
  priSelecaoArquivo := locArquivo;
  priSelecaoDtLog   := locDtLog;

  txtArquivoLog.Text := priSelecaoArquivo;

  InformacoesPopular;
end;

//
// Procedimento para exibir o formul�rio de filtros.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioFiltroExibir;
var
  locFormulario       : TPlataformaERPVCLLogLocalFiltro;
  locClicouSelecionar : Boolean;
  locDtHrOcorrenciaIni: TDateTime;
  locDtHrOcorrenciaFim: TDateTime;
  locMensagem         : string;
  locHashCode         : string;
begin
  if not ArquivoLogConsistir then Exit;

  locFormulario := TPlataformaERPVCLLogLocalFiltro.Create(Self);

  locFormulario.pubDtHrOcorrenciaIni := priFiltroDtHrOcorrenciaIni;
  locFormulario.pubDtHrOcorrenciaFim := priFiltroDtHrOcorrenciaFim;
  locFormulario.pubMensagem          := priFiltroMensagem;
  locFormulario.pubHashCode          := priFiltroHashCode;
  
  locFormulario.ShowModal;

  locClicouSelecionar  := locFormulario.pubClicouConfirmar;
  locDtHrOcorrenciaIni := locFormulario.pubDtHrOcorrenciaIni;
  locDtHrOcorrenciaFim := locFormulario.pubDtHrOcorrenciaFim;
  locMensagem          := locFormulario.pubMensagem;
  locHashCode          := locFormulario.pubHashCode;
 
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouSelecionar then Exit;

  priFiltroDtHrOcorrenciaIni := locDtHrOcorrenciaIni;
  priFiltroDtHrOcorrenciaFim := locDtHrOcorrenciaFim;
  priFiltroMensagem          := locMensagem;
  priFiltroHashCode          := locHashCode;

  InformacoesPopular;
end;

//
// Procedimento para exibir o formul�rio de localizar.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioLocalizarExibir;
var
  locFormulario     : TPlataformaERPVCLLogLocalLocalizar;
  locClicouConfirmar: Boolean;
  locDtHrOcorrencia : TDateTime;
  locMensagem       : string;
begin
  if not ArquivoLogConsistir then Exit;

  locFormulario := TPlataformaERPVCLLogLocalLocalizar.Create(Self);

  locFormulario.pubDtHrOcorrencia := priLocalizarDtHrOcorrencia;
  locFormulario.pubMensagem       := priLocalizarMensagem;
  
  locFormulario.ShowModal;

  locClicouConfirmar := locFormulario.pubClicouConfirmar;
  locDtHrOcorrencia  := locFormulario.pubDtHrOcorrencia;
  locMensagem        := locFormulario.pubMensagem;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouConfirmar then Exit;

  priLocalizarDtHrOcorrencia := locDtHrOcorrencia;
  priLocalizarMensagem       := locMensagem;

  InformacoesLocalizar;
end;

//
// Procedimento para exibir o formul�rio de detalhes do log selecionado.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioDetalhesExibir;
var
  locIndex         : Integer;
  locAplicativo    : string;
  locHashCode      : string;
  locHostName      : string;
  locUserName      : string;
  locUsuarioID     : Integer;
  locUsuarioNome   : string;
  locCritico       : Boolean;
  locDataHora      : TDateTime;
  locMensagem      : string;
  locFormulario    : TPlataformaERPVCLLogLocalDetalhe;
  locClicouAnterior: Boolean;
  locClicouProximo : Boolean;
begin
  if not ArquivoLogConsistir then Exit;

  locIndex := VCLListViewIndiceItemRetornar(lvwInformacoes);
  if locIndex = VCL_NENHUM_INDICE then Exit;

  locAplicativo  := lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_APLICATIVO];
  locHashCode    := lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_HASH_CODE];
  locHostName    := lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_HOST_NAME];
  locUserName    := lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_USER_NAME];
  locUsuarioID   := StringIntegerConverter(lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_USUARIO_ID]);
  locUsuarioNome := lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_USUARIO_NOME];
  locCritico     := StringBooleanConverter(lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_CRITICO]);
  locDataHora    := StringDateTimeConverter(lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_DATA_HORA]);
  locMensagem    := lvwInformacoes.Items[locIndex].SubItems.Strings[LVW_COLUNA_MENSAGEM];

  locFormulario := TPlataformaERPVCLLogLocalDetalhe.Create(Self);
  locFormulario.FormularioPopular(locIndex, locAplicativo, locHashCode, locHostName, locUserName, locUsuarioID, locUsuarioNome, locCritico, locDataHora, locMensagem);
  locFormulario.ShowModal;

  locIndex          := locFormulario.pubSequencial;
  locClicouAnterior := locFormulario.pubClicouAnterior;
  locClicouProximo  := locFormulario.pubClicouProximo;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if (not locClicouAnterior) and (not locClicouProximo) then Exit;

  //
  // Anterior e pr�ximo parecem trocados pq eles funcionam de acorco com a data do log.
  //

  if locClicouProximo then
  begin
    Dec(locIndex);
    if locIndex < 0 then Exit;
    VCLListViewItemPosicionar(lvwInformacoes, locIndex);
    FormularioDetalhesExibir;
  end;

  if locClicouAnterior then
  begin
    Inc(locIndex);
    if locIndex > (lvwInformacoes.Items.Count - 1) then Exit;
    VCLListViewItemPosicionar(lvwInformacoes, locIndex);
    FormularioDetalhesExibir;
  end;
end;

end.
