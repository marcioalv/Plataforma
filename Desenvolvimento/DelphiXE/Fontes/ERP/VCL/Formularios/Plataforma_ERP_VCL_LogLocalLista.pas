unit Plataforma_ERP_VCL_LogLocalLista;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
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
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDetalhesClick(Sender: TObject);
  private
    procedure FormularioDimensionar;
    procedure InformacoesColunasDimensionar;
    procedure InformacoesPopular;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLLogLocalLista: TPlataformaERPVCLLogLocalLista;

implementation

{$R *.dfm}

procedure TPlataformaERPVCLLogLocalLista.FormCreate(Sender: TObject);
begin
//  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  txtArquivoLog.Text := 'C:\Plataforma\Desenvolvimento\DelphiXE\Fontes\ERP\Instalacao\Log\2018_06_06_Plataforma_ERP_VCL.log';
end;

procedure TPlataformaERPVCLLogLocalLista.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Application.MainForm.ClientWidth - 4;
  Height := Application.MainForm.ClientHeight - 4;

  FormularioDimensionar;
end;

procedure TPlataformaERPVCLLogLocalLista.FormPaint(Sender: TObject);
begin
  FormularioDimensionar;
end;

procedure TPlataformaERPVCLLogLocalLista.FormResize(Sender: TObject);
begin
  FormularioDimensionar;
end;

procedure TPlataformaERPVCLLogLocalLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPlataformaERPVCLLogLocalLista.btnAtualizarClick(Sender: TObject);
begin
  InformacoesPopular;
end;

procedure TPlataformaERPVCLLogLocalLista.btnDetalhesClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLLogLocalDetalhe;
begin
  locFormulario := TPlataformaERPVCLLogLocalDetalhe.Create(Self);
  locFormulario.Show;
end;

procedure TPlataformaERPVCLLogLocalLista.FormularioDimensionar;
begin
  txtArquivoLog.Width := panFormulario.Width - (txtArquivoLog.Left + 48);

  lvwInformacoes.Width := panFormulario.Width - (lvwInformacoes.Left + 16);
  lvwInformacoes.Height := panFormulario.Height - (lvwInformacoes.Top + 16);

  InformacoesColunasDimensionar;
end;

procedure TPlataformaERPVCLLogLocalLista.InformacoesColunasDimensionar;
begin
  lvwInformacoes.Columns[LVW_COLUNA_ICONE        + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_APLICATIVO   + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_HASH_CODE    + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_HOST_NAME    + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_USER_NAME    + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_USUARIO_ID   + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_USUARIO_NOME + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_CRITICO      + 1].Width := 0;
  lvwInformacoes.Columns[LVW_COLUNA_DATA_HORA    + 1].Width := 150;  
  lvwInformacoes.Columns[LVW_COLUNA_MENSAGEM     + 1].Width := lvwInformacoes.Width - (150) - 25;
end;

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

end.
