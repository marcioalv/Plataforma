//
// Arquivo..: Plataforma_ERP_VCL_LogLocalArquivoSelecao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para exibir as opções de seleção do arquivo de log local da aplicação.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogLocalArquivoSelecao;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_Framework_Log,
  Plataforma_ERP_Global,
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
  Vcl.Buttons,
  Vcl.Mask,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

const
  LVW_COLUNA_DATA   : Integer = 0;
  LVW_COLUNA_ARQUIVO: Integer = 1;  

type
  TPlataformaERPVCLLogLocalArquivoSelecao = class(TForm)
    panFormulario: TPanel;
    btnFechar: TBitBtn;
    rbtArquivo: TRadioButton;
    rbtHistorico: TRadioButton;
    txtArquivo: TEdit;
    btnConfirmar: TBitBtn;
    dlgArquivo: TOpenDialog;
    lblDtLog: TLabel;
    btnDtLogLocalizar: TBitBtn;
    txtDtLog: TMaskEdit;
    lblArquivo: TLabel;
    btnArquivoSelecionar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnLimpar: TBitBtn;
    Image1: TImage;
    lvwHistorico: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure rbtArquivoClick(Sender: TObject);
    procedure rbtHistoricoClick(Sender: TObject);
    procedure btnArquivoSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure txtDtLogEnter(Sender: TObject);
    procedure txtDtLogExit(Sender: TObject);
    procedure txtDtLogKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtDtLogKeyPress(Sender: TObject; var Key: Char);
    procedure btnDtLogLocalizarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure lvwHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure lvwHistoricoDblClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar;
    procedure FormularioConfirmar;

    procedure HistoricoLogPopular;
    procedure ArquivoSelecionar;
    procedure ArquivoLogDataLocalizar(argArquivo: string; argDtLog: TDateTime);
  public
    pubClicouSelecionar: Boolean;
    pubTipo            : Byte;
    pubArquivo         : string;
    pubDtLog           : TDateTime;
  end;

var
  PlataformaERPVCLLogLocalArquivoSelecao: TPlataformaERPVCLLogLocalArquivoSelecao;

implementation

{$R *.dfm}

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormCreate(Sender: TObject);
begin
  pubClicouSelecionar := False;
  pubTipo             := 0;
  pubArquivo          := '';
  pubDtLog            := 0;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormShow(Sender: TObject);
begin
  FormularioLimpar;
  HistoricoLogPopular;

  if pubTipo = LOG_SELECAO_ARQUIVO then
  begin
    rbtArquivo.Checked := True;
    txtArquivo.Text    := pubArquivo;
  end;

  if pubTipo = LOG_SELECAO_HISTORICO then
  begin
    rbtHistorico.Checked := True;
    txtDtLog.Text        := DateTimeStringConverter(pubDtLog, 'dd/mm/yyyy');

    ArquivoLogDataLocalizar(pubArquivo, pubDtLog);
  end;

  if (not rbtArquivo.Checked) and (not rbtHistorico.Checked) then rbtArquivo.Checked := True;

  pubTipo    := 0;
  pubArquivo := '';
  pubDtLog   := 0;
    
  FormularioControlar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente rbtArquivo.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.rbtArquivoClick(Sender: TObject);
begin
  FormularioControlar;
end;

//
// Eventos do componente txtArquivo.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnArquivoSelecionarClick(Sender: TObject);
begin
  ArquivoSelecionar;
end;


procedure TPlataformaERPVCLLogLocalArquivoSelecao.txtDtLogEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(txtDtLog) then Exit;
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.txtDtLogKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.txtDtLogKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.txtDtLogExit(Sender: TObject);
begin
  if not VCLMaskEditSair(txtDtLog) then Exit;
  if not VCLMaskEditDataValidar(txtDtLog) then Exit;
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnDtLogLocalizarClick(Sender: TObject);
var
  locDtLog: TDateTime;
begin
  locDtLog := StringDateTimeConverter(txtDtLog.Text);

  if locDtLog <= 0 then
  begin
    VCLConsistenciaExibir('Uma data de log deve ser informada!');
    txtDtLog.SetFocus;
    Exit;
  end;

  ArquivoLogDataLocalizar('', locDtLog);
end;

//
// Evento de click no componente rbtHistorico.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.rbtHistoricoClick(Sender: TObject);
begin
  FormularioControlar;
end;

//
// Evento do componente "Lista de arquivos".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.lvwHistoricoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwHistoricoDblClick(Sender);
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.lvwHistoricoDblClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Limpar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
  HistoricoLogPopular;
  FormularioControlar;
end;

//
// Evento de click no botao "Selecionar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormularioLimpar;
begin
  VCLRadioButtonLimpar(rbtArquivo);
  VCLEditLimpar(txtArquivo);

  VCLRadioButtonLimpar(rbtHistorico);
  VCLMaskEditLimpar(txtDtLog);
  VCLListViewLimpar(lvwHistorico);
end;

//
//
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormularioControlar;
begin
  if rbtArquivo.Checked then
  begin
    lblArquivo.Enabled           := True;
    txtArquivo.Enabled           := True;
    txtArquivo.Font.Color        := clBlack;
    btnArquivoSelecionar.Enabled := True;

    lblDtLog.Enabled          := False;
    txtDtLog.Enabled          := False;
    btnDtLogLocalizar.Enabled := False;

    lvwHistorico.Enabled    := False;
    lvwHistorico.Font.Color := clGray;
    lvwHistorico.ItemIndex  := VCL_NENHUM_INDICE;

    txtArquivo.SetFocus;
  end
  else
  begin
    lblArquivo.Enabled           := False;
    txtArquivo.Enabled           := False;
    txtArquivo.Font.Color        := clGray;
    btnArquivoSelecionar.Enabled := False;

    lblDtLog.Enabled          := True;
    txtDtLog.Enabled          := True;
    btnDtLogLocalizar.Enabled := True;

    lvwHistorico.Enabled    := True;
    lvwHistorico.Font.Color := clBlack;
    lvwHistorico.SetFocus;
  end;
end;

//
// Procedimento para confirmar o arquivo de log selecionado.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormularioConfirmar;
var
  locArquivo: string;
  locIndice : Integer;
begin
  if rbtArquivo.Checked then
  begin
    if Trim(txtArquivo.Text) = '' then
    begin
      VCLConsistenciaExibir('Algum arquivo de log deve ser selecionado!');
      txtArquivo.SetFocus;
      Exit;
    end;
    
    locArquivo := txtArquivo.Text;
  end
  else
  begin
    locIndice := VCLListViewIndiceItemRetornar(lvwHistorico);
    if locIndice = VCL_NENHUM_INDICE then Exit;

    locArquivo := lvwHistorico.Items[locIndice].SubItems.Strings[LVW_COLUNA_ARQUIVO];
  end;

  pubClicouSelecionar := True;

  if rbtArquivo.Checked then
    pubTipo := LOG_SELECAO_ARQUIVO
  else
    pubTipo := LOG_SELECAO_HISTORICO;

  pubArquivo := locArquivo;
  pubDtLog   := StringDateTimeConverter(txtDtLog.Text);
  Close;
end;

//
// Procedimento para carregar o listbox com os arquivos de log da aplicação.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.HistoricoLogPopular;
var
  locListaArquivos: TStringList;
  locContador     : Integer;
  locArquivo      : string;
  locArquivoNome  : string;
  locArquivoData  : string;
  locListItem     : TListItem;
begin
  // Limpa o listbox.
  VCLListViewLimpar(lvwHistorico);

  // Carrega lista de arquivos de log.
  try
    locListaArquivos := ListaArquivosRetornar(gloLocalLog.FilePath, '*.log', True);
  except
    on locErro: Exception do
    begin
      VCLExcecaoExibir('Impossível pesquisar histórico de arquivos de log neste computador!', locErro.Message);
      Exit;
    end;
  end;

  // Nenhum arquivo encontrado.
  if locListaArquivos.Count <= 0 then Exit;

  // Percorre lista de arquivos para inserir no listbox.
  lvwHistorico.Items.BeginUpdate;
  for locContador := 0 to (locListaArquivos.Count - 1) do
  begin
    locArquivoNome := StringRemover(locListaArquivos[locContador], ExtractFilePath(locListaArquivos[locContador]));

    locArquivoData := Copy(locArquivoNome, 1, 10);
    locArquivoData := Copy(locArquivoData, 9, 2) + '/' + Copy(locArquivoData, 6, 2) + '/' + Copy(locArquivoData, 1, 4);

    locListItem := lvwHistorico.Items.Add;
    locListItem.SubItems.Add(locArquivoData);
    locListItem.SubItems.Add(locListaArquivos[locContador]);
  end;
  lvwHistorico.Items.EndUpdate;
end;

//
// Procedimento para selecionar um arquivo de log.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.ArquivoSelecionar;
begin
  VCLCursorTrocar(True);

  dlgArquivo.Title       := 'Selecionar arquivo de log';
  dlgArquivo.Filter      := 'Arquivos de log (*.log)|*.log|Todos os arquivos|*.*';
  dlgArquivo.FilterIndex := 0;

  if not dlgArquivo.Execute then
  begin
    VCLCursorTrocar;
    Exit;
  end;

  txtArquivo.Text := dlgArquivo.FileName;
  VCLCursorTrocar;
end;

//
// Procedimento para localizar um arquivo de log do histórico pela data.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.ArquivoLogDataLocalizar(argArquivo: string; argDtLog: TDateTime);
var
  locContador   : Integer;
  locNomeArquivo: string;
  locDtArquivo  : TDateTime;
  locEncontrou  : Boolean;
begin
  locEncontrou := False;
  for locContador := 0 to (lvwHistorico.Items.Count - 1) do
  begin
    locNomeArquivo := lvwHistorico.Items[locContador].SubItems.Strings[LVW_COLUNA_ARQUIVO];
    locDtArquivo   := StringDateTimeConverter(lvwHistorico.Items[locContador].SubItems.Strings[LVW_COLUNA_DATA]);

    if argArquivo <> '' then
    begin
      if argArquivo = locNomeArquivo then locEncontrou := True;
    end;

    if argDtLog > 0 then
    begin
      if argDtLog = locDtArquivo then locEncontrou := True;
    end;
                         
    if locEncontrou then
    begin
      VCLListViewItemPosicionar(lvwHistorico, locContador);
      Break;
    end;
  end;

  if not locEncontrou then
  begin
    if argArquivo <> '' then VCLConsistenciaExibir('Nenhum arquivo de log encontrado no histórico com o nome informada: ' + argArquivo + '!');
    if argDtLog > 0     then VCLConsistenciaExibir('Nenhum arquivo de log encontrado no histórico com a data informada: ' + DateTimeStringConverter(argDtLog, 'dd/mm/yyyy') + '!');
    txtDtLog.SetFocus;
    Exit;
  end;

  VCLListViewFocar(lvwHistorico);
end;

end.
