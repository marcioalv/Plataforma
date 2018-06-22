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
  Vcl.Mask;

type
  TPlataformaERPVCLLogLocalArquivoSelecao = class(TForm)
    panFormulario: TPanel;
    btnFechar: TBitBtn;
    rbtArquivo: TRadioButton;
    rbtHistorico: TRadioButton;
    lbxHistorico: TListBox;
    txtArquivo: TEdit;
    btnConfirmar: TBitBtn;
    dlgArquivo: TOpenDialog;
    lblDtLog: TLabel;
    btnDtLogLocalizar: TBitBtn;
    txtDtLog: TMaskEdit;
    lblArquivo: TLabel;
    btnArquivoSelecionar: TBitBtn;
    btnMinimizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure rbtArquivoClick(Sender: TObject);
    procedure rbtHistoricoClick(Sender: TObject);
    procedure lbxHistoricoDblClick(Sender: TObject);
    procedure lbxHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure btnArquivoSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar;
    procedure FormularioConfirmar;

    procedure HistoricoLogPopular;
    procedure ArquivoSelecionar;
  public
    pubClicouSelecionar: Boolean;
    pubArquivo         : string;
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
  pubArquivo          := '';
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormShow(Sender: TObject);
begin
  FormularioLimpar;
  HistoricoLogPopular;
  FormularioControlar;

  txtArquivo.Text := 'C:\Plataforma\Desenvolvimento\DelphiXE\Fontes\ERP\Instalacao\Log\2018_06_06_Plataforma_ERP_VCL.log';
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

//
// Evento de click no componente rbtHistorico.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.rbtHistoricoClick(Sender: TObject);
begin
  FormularioControlar;
end;

//
// Evento do componente lbxHistorico.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.lbxHistoricoDblClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.lbxHistoricoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lbxHistoricoDblClick(Sender);
end;

//
// Evento de click no botao "Selecionar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLMinimizar;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormularioLimpar;
begin
  rbtArquivo.Checked := True;
  txtArquivo.Text    := '';

  rbtHistorico.Checked := False;
  txtDtLog.Text        := '  /  /   ';
  lbxHistorico.Items.Clear;
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

    lbxHistorico.Enabled   := False;
    lbxHistorico.ItemIndex := VCL_NENHUM_INDICE;

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

    lbxHistorico.Enabled         := True;
    lbxHistorico.BorderStyle     := bsSingle;
    lbxHistorico.SetFocus;
  end;
end;

//
// Procedimento para confirmar o arquivo de log selecionado.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormularioConfirmar;
var
  locArquivo: string;
begin
  if rbtArquivo.Checked then
  begin
    locArquivo := txtArquivo.Text;
  end
  else
  begin
    locArquivo := Trim(Copy(lbxHistorico.Items[lbxHistorico.ItemIndex], 14, 255));
  end;

  pubClicouSelecionar := True;
  pubArquivo          := locArquivo;
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
begin
  // Limpa o listbox.
  lbxHistorico.Items.BeginUpdate;
  lbxHistorico.Items.Clear;
  lbxHistorico.Items.EndUpdate;

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
  lbxHistorico.Items.BeginUpdate;
  for locContador := 0 to (locListaArquivos.Count - 1) do
  begin
    locArquivoNome := StringRemover(locListaArquivos[locContador], ExtractFilePath(locListaArquivos[locContador]));

    locArquivoData := Copy(locArquivoNome, 1, 10);
    locArquivoData := Copy(locArquivoData, 9, 2) + '/' + Copy(locArquivoData, 6, 2) + '/' + Copy(locArquivoData, 1, 4);


    lbxHistorico.Items.Add('(' + locArquivoData + ') ' + locListaArquivos[locContador]);
  end;
  lbxHistorico.Items.EndUpdate;
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

end.
