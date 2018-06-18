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
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TPlataformaERPVCLLogLocalArquivoSelecao = class(TForm)
    panFormulario: TPanel;
    btnFechar: TBitBtn;
    rbtArquivo: TRadioButton;
    rbtHistorico: TRadioButton;
    lbxHistorico: TListBox;
    txtArquivo: TEdit;
    imgArquivoSelecionar: TImage;
    btnSelecionar: TBitBtn;
    dlgArquivo: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure rbtArquivoClick(Sender: TObject);
    procedure rbtHistoricoClick(Sender: TObject);
    procedure imgArquivoSelecionarClick(Sender: TObject);
    procedure lbxHistoricoDblClick(Sender: TObject);
    procedure lbxHistoricoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar;
    procedure FormularioSelecionar;

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
procedure TPlataformaERPVCLLogLocalArquivoSelecao.imgArquivoSelecionarClick(Sender: TObject);
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
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLLogLocalArquivoSelecao.lbxHistoricoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lbxHistoricoDblClick(Sender);
end;

//
// Evento de click no botao "Selecionar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
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
  rbtArquivo.Checked := True;
  txtArquivo.Text    := '';

  rbtHistorico.Checked := False;
  lbxHistorico.Items.Clear;
end;

//
//
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormularioControlar;
begin
  if rbtArquivo.Checked then
  begin
    txtArquivo.Enabled           := True;
    txtArquivo.Font.Color        := clBlack;
    imgArquivoSelecionar.Visible := True;
    lbxHistorico.Enabled         := False;
    lbxHistorico.BorderStyle     := bsNone;
    lbxHistorico.ItemIndex       := VCL_NENHUM_INDICE;
    
    txtArquivo.SetFocus;
  end
  else
  begin
    txtArquivo.Enabled           := False;
    txtArquivo.Font.Color        := clGray;
    imgArquivoSelecionar.Visible := False;
    lbxHistorico.Enabled         := True;
    lbxHistorico.BorderStyle     := bsSingle;
    lbxHistorico.SetFocus;
  end;
end;

//
// Procedimento para selecionar o arquivo de log.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormularioSelecionar;
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
begin
  lbxHistorico.Items.BeginUpdate;
  lbxHistorico.Items.Clear;
  lbxHistorico.Items.EndUpdate;

  lbxHistorico.Items.BeginUpdate;
  lbxHistorico.Items.Add('(18/06/2018) C:\Plataforma\Desenvolvimento\DelphiXE\ERP\Instalacao\Log\2018\Plataforma_ERP_2018_06_18.log');
  lbxHistorico.Items.Add('(17/06/2018) C:\Plataforma\Desenvolvimento\DelphiXE\ERP\Instalacao\Log\2018\Plataforma_ERP_2018_06_17.log');
  lbxHistorico.Items.Add('(16/06/2018) C:\Plataforma\Desenvolvimento\DelphiXE\ERP\Instalacao\Log\2018\Plataforma_ERP_2018_06_16.log');
  lbxHistorico.Items.EndUpdate;
end;

//
// Procedimento para selecionar um arquivo de log.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.ArquivoSelecionar;
begin
  dlgArquivo.Title       := 'Selecionar arquivo de log';
  dlgArquivo.Filter      := 'Arquivos de log (*.log)|*.log|Todos os arquivos|*.*';
  dlgArquivo.FilterIndex := 0;

  if not dlgArquivo.Execute then Exit;

  txtArquivo.Text := dlgArquivo.FileName;
end;

end.
