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
  Plataforma_ERP_VCL_LogLocalArquivoSelecao,
  Plataforma_ERP_VCL_LogLocalFiltro,
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
  Vcl.Buttons;

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
  private
    procedure InformacoesPopular;
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
  Exit;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormShow(Sender: TObject);
begin
  // T�tulo do formul�rio.
  Caption := 'Visualiza��o do arquivo de log local';

  // Limpa componentes do formul�rio.
  FormularioLimpar;

  // Arquivo de log padr�o.
  txtArquivoLog.Text := 'C:\Plataforma\Desenvolvimento\DelphiXE\Fontes\ERP\Instalacao\Log\2018_06_06_Plataforma_ERP_VCL.log';
end;

//
// Procedimento para exibir o formul�rio de sele��o do arquivo de log local.
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
  Exit;
end;

procedure TPlataformaERPVCLLogLocalLista.lvwInformacoesCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalLista.lvwInformacoesDblClick(Sender: TObject);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalLista.lvwInformacoesKeyPress(Sender: TObject; var Key: Char);
begin
  Exit;
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
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLLogLocalLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Popula as informa��es do arquivo de log no listview.
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
  // Localiza��o do arquivo de log que ser� exibido.
  locArquivoLog := txtArquivoLog.Text;

  // Confirma se o arquivo realmente existe.
  if not FileExists(locArquivoLog) then
  begin
    VCLConsistenciaExibir('O arquivo de log informando n�o foi localizado ou n�o p�de ser acessado em [' + locArquivoLog + ']');
    Exit;
  end;

  // Acessa o arquivo texto.
  try
    AssignFile(locTextFile, locArquivoLog);
  except
    on locErro: Exception do
    begin
      VCLExcecaoExibir('Imposs�vel acessar o arquivo de log: [' + locArquivoLog + ']', locErro.Message);
      Exit;
    end;
  end;

  // Abre arquivo texto para leitura.
  try
    Reset(locTextFile);
  except
    on locErro: Exception do
    begin
      VCLExcecaoExibir('Imposs�vel abrir o arquivo de log para leitura: [' + locArquivoLog + ']', locErro.Message);
      Exit;
    end;
  end;

  // Percorre cada uma das linhas do arquivo texto.
  while not EOF(locTextFile) do
  begin
    // L� uma linha do arquivo texto.
    Readln(locTextFile, locLinha);

    // Separa a linha em partes.
    locStringList := StringSeparar(locLinha, '|');

    // Carrega cada parte separadamente.
    locHostName       := locStringList[0];
    locUserName       := locStringList[1];
    locAppNome        := locStringList[2];
    locAppHashCode    := locStringList[3];
    locAppUsuarioID   := StringIntegerConverter(locStringList[4]);
    locAppUsuarioNome := locStringList[5];
    locCritico        := StringBooleanConverter(locStringList[6]);
    locDataHora       := StringDataHoraPersistidaConverter(locStringList[7]);
    locMensagem       := locStringList[8];
    
    // Insere dados no listview.
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

  // Fecha arquivo texto.
  CloseFile(locTextFile);
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioLimpar;
begin
  VCLCursorTrocar;
  txtArquivoLog.Text := '';
  VCLListViewLimpar(lvwInformacoes);
  VCLCursorTrocar(False);
end;

//
// Procedimento para exibir o formul�rio de sele��o do arquivo de log.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioArquivoSelecaoExibir;
var
  locFormulario: TPlataformaERPVCLLogLocalArquivoSelecao;
begin
  locFormulario := TPlataformaERPVCLLogLocalArquivoSelecao.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o formul�rio de filtros.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioFiltroExibir;
var
  locFormulario: TPlataformaERPVCLLogLocalFiltro;
begin
  locFormulario := TPlataformaERPVCLLogLocalFiltro.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o formul�rio de localizar.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioLocalizarExibir;
var
  locFormulario: TPlataformaERPVCLLogLocalFiltro;
begin
  locFormulario := TPlataformaERPVCLLogLocalFiltro.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o formul�rio de detalhes do log selecionado.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioDetalhesExibir;
var
  locFormulario: TPlataformaERPVCLLogLocalDetalhe;
begin
  locFormulario := TPlataformaERPVCLLogLocalDetalhe.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
