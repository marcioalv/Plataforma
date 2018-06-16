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
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
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
  txtArquivoLog.Text := 'C:\Plataforma\Desenvolvimento\DelphiXE\Fontes\ERP\Instalacao\Log\2018_06_06_Plataforma_ERP_VCL.log';
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
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogLocalLista.btnFecharClick(Sender: TObject);
begin
  Close;
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
  // Localização do arquivo de log que será exibido.
  locArquivoLog := txtArquivoLog.Text;

  // Confirma se o arquivo realmente existe.
  if not FileExists(locArquivoLog) then
  begin
    VCLConsistenciaExibir('O arquivo de log informando não foi localizado ou não pôde ser acessado em [' + locArquivoLog + ']');
    Exit;
  end;

  // Acessa o arquivo texto.
  try
    AssignFile(locTextFile, locArquivoLog);
  except
    on locErro: Exception do
    begin
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

  // Fecha arquivo texto.
  CloseFile(locTextFile);
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLogLocalLista.FormularioLimpar;
begin
  VCLCursorTrocar;
  txtArquivoLog.Text := '';
  VCLListViewLimpar(lvwInformacoes);
  VCLCursorTrocar(False);
end;

//
// Procedimento para exibir o formulário de seleção do arquivo de log.
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
// Procedimento para exibir o formulário de filtros.
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
// Procedimento para exibir o formulário de localizar.
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
// Procedimento para exibir o formulário de detalhes do log selecionado.
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
