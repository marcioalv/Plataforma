//
// Arquivo..: Plataforma_ERP_VCL_LogLocalLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para exibir a lista de logs da aplicação ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogLocalLista;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
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
  Vcl.Buttons, Vcl.Imaging.pngimage;

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
    imgArquivoLogSelecionar: TImage;
    lblInformacoes: TLabel;
    lvwInformacoes: TListView;
    btnFiltrar: TBitBtn;
    btnLocalizar: TBitBtn;
    btnAtualizar: TBitBtn;
    btnFechar: TBitBtn;
    btnDetalhes: TBitBtn;
    btnMinimizar: TBitBtn;
    Image1: TImage;
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
    procedure imgArquivoLogSelecionarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
  private
    priSelecaoTipo            : Byte;
    priSelecaoArquivo         : string;
    priSelecaoDtLog           : TDateTime;

    priFiltroDtHrOcorrenciaIni: TDateTime;
    priFiltroDtHrOcorrenciaFim: TDateTime;
    priFiltroMensagem         : string;

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
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormCreate(Sender: TObject);
begin
  priSelecaoTipo             := 0;
  priSelecaoArquivo          := '';
  priSelecaoDtLog            := 0;

  priFiltroDtHrOcorrenciaIni := 0;
  priFiltroDtHrOcorrenciaFim := 0;
  priFiltroMensagem          := '';

  priLocalizarDtHrOcorrencia := 0;
  priLocalizarMensagem       := '';
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormShow(Sender: TObject);
begin

  // Título do formulário.
  Caption := 'Visualização do arquivo de log local';

  // Limpa componentes do formulário.
  FormularioLimpar;

  // Arquivo de log padrão.
  VCLEditLimpar(txtArquivoLog);
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormActivate(Sender: TObject);
begin
  VCLSDIMaximizar(Self);
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Procedimento para exibir o formulário de seleção do arquivo de log local.
//
procedure TPlataformaERPVCLLogLocalLista.imgArquivoLogSelecionarClick(Sender: TObject);
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
// Evento de click no botão "Filtrar".
//
procedure TPlataformaERPVCLLogLocalLista.btnFiltrarClick(Sender: TObject);
begin
  FormularioFiltroExibir;
end;

//
// Evento de click no botão "Localizar".
//
procedure TPlataformaERPVCLLogLocalLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizarExibir;
end;

//
// Evento de click no botão "Atualizar".
//
procedure TPlataformaERPVCLLogLocalLista.btnAtualizarClick(Sender: TObject);
begin
  InformacoesPopular;
end;

//
// Evento de click no botão "Detalhes".
//
procedure TPlataformaERPVCLLogLocalLista.btnDetalhesClick(Sender: TObject);
begin
  FormularioDetalhesExibir;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLLogLocalLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
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
// Popula as informações do arquivo de log no listview.
//
procedure TPlataformaERPVCLLogLocalLista.InformacoesPopular;
var
  locArquivoLog    : string;
  locTextFile      : TextFile;
  locLinha         : string;
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
  // Consistências.
  if not ArquivoLogConsistir then Exit;

  // Troca cursor.
  VCLCursorTrocar(True);

  // Limpa listview.
  VCLListViewLimpar(lvwInformacoes);

  // Localização do arquivo de log que será exibido.
  locArquivoLog := txtArquivoLog.Text;

  // Confirma se o arquivo realmente existe.
  if not FileExists(locArquivoLog) then
  begin
    VCLCursorTrocar;
    VCLConsistenciaExibir('O arquivo de log informando não foi localizado ou não pôde ser acessado em [' + locArquivoLog + ']');
    Exit;
  end;

  // Acessa o arquivo texto.
  try
    AssignFile(locTextFile, locArquivoLog);
  except
    on locErro: Exception do
    begin
      VCLCursorTrocar;
      VCLExcecaoExibir('Impossível acessar o arquivo de log: [' + locArquivoLog + ']', locErro.Message);
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
      VCLExcecaoExibir('Impossível abrir o arquivo de log para leitura: [' + locArquivoLog + ']', locErro.Message);
      Exit;
    end;
  end;

  // Percorre cada uma das linhas do arquivo texto.
  while not EOF(locTextFile) do
  begin
    // Lê uma linha do arquivo texto.
    Readln(locTextFile, locLinha);

    // Separa a linha em partes.
    locStringList := StringSeparar(locLinha, '|');

    // Inicializa variáveis.
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
    
    // Insere dados no listview.
    if Trim(locMensagem) <> '' then
    begin
      locListItem         := lvwInformacoes.Items.Add;
      locListItem.Caption := '';                                                                 // Ícone.
      locListItem.SubItems.Add(locAppNome);                                                      // Aplicativo.
      locListItem.SubItems.Add(locAppHashCode);                                                  // HashCode.
      locListItem.SubItems.Add(locHostName);                                                     // HostName.
      locListItem.SubItems.Add(locUserName);                                                     // UserName.
      locListItem.SubItems.Add(IntegerStringConverter(locAppUsuarioID));                         // Usuário ID.
      locListItem.SubItems.Add(locAppUsuarioNome);                                               // Usuário nome.
      locListItem.SubItems.Add(BooleanStringConverter(locCritico, False));                       // Crítico.
      locListItem.SubItems.Add(DateTimeStringConverter(locDataHora, 'dd/mm/yyyy hh:nn:ss.zzz')); // Data e hora.
      locListItem.SubItems.Add(locMensagem);                                                     // Mensagem.
    end;
  end;

  // Fecha arquivo texto.
  CloseFile(locTextFile);

  // Finaliza.
  VCLCursorTrocar;
end;

//
// Procedimento para localizar informações na lista.
//
procedure TPlataformaERPVCLLogLocalLista.InformacoesLocalizar;
var
  locContador      : Integer;
  locDtHrOcorrencia: TDateTime;
  locMensagem      : string;
begin
  for locContador := 0 to (lvwInformacoes.Items.Count - 1) do
  begin
    locDtHrOcorrencia := StringDateTimeConverter(lvwInformacoes.Items[locContador].SubItems.Strings[LVW_COLUNA_DATA_HORA]);
    locMensagem       := lvwInformacoes.Items[locContador].SubItems.Strings[LVW_COLUNA_MENSAGEM];
  end;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioLimpar;
begin
  VCLCursorTrocar;
  VCLEditLimpar(txtArquivoLog);
  VCLListViewLimpar(lvwInformacoes);
  VCLCursorTrocar(False);
end;

//
// Procedimento para exibir o formulário de seleção do arquivo de log.
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
// Procedimento para exibir o formulário de filtros.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioFiltroExibir;
var
  locFormulario       : TPlataformaERPVCLLogLocalFiltro;
  locClicouSelecionar : Boolean;
  locDtHrOcorrenciaIni: TDateTime;
  locDtHrOcorrenciaFim: TDateTime;
  locMensagem         : string;
begin
  locFormulario := TPlataformaERPVCLLogLocalFiltro.Create(Self);

  locFormulario.pubDtHrOcorrenciaIni := priFiltroDtHrOcorrenciaIni;
  locFormulario.pubDtHrOcorrenciaFim := priFiltroDtHrOcorrenciaFim;
  locFormulario.pubMensagem          := priFiltroMensagem;
  
  locFormulario.ShowModal;

  locClicouSelecionar  := locFormulario.pubClicouConfirmar;
  locDtHrOcorrenciaIni := locFormulario.pubDtHrOcorrenciaIni;
  locDtHrOcorrenciaFim := locFormulario.pubDtHrOcorrenciaFim;
  locMensagem          := locFormulario.pubMensagem;
 
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouSelecionar then Exit;

  priFiltroDtHrOcorrenciaIni := locDtHrOcorrenciaIni;
  priFiltroDtHrOcorrenciaFim := locDtHrOcorrenciaFim;
  priFiltroMensagem          := locMensagem;

  InformacoesPopular;
end;

//
// Procedimento para exibir o formulário de localizar.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioLocalizarExibir;
var
  locFormulario     : TPlataformaERPVCLLogLocalLocalizar;
  locClicouConfirmar: Boolean;
  locDtHrOcorrencia : TDateTime;
  locMensagem       : string;
begin
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
// Procedimento para exibir o formulário de detalhes do log selecionado.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioDetalhesExibir;
var
  locIndex      : Integer;
  locAplicativo : string;
  locHashCode   : string;
  locHostName   : string;
  locUserName   : string;
  locUsuarioID  : Integer;
  locUsuarioNome: string;
  locCritico    : Boolean;
  locDataHora   : TDateTime;
  locMensagem   : string;
  locFormulario : TPlataformaERPVCLLogLocalDetalhe;
begin
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
  locFormulario.FormularioPopular(locAplicativo, locHashCode, locHostName, locUserName, locUsuarioID, locUsuarioNome, locCritico, locDataHora, locMensagem);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
