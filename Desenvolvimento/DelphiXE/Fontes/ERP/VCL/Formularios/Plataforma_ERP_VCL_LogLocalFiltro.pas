//
// Arquivo..: Plataforma_ERP_VCL_LogLocalFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para exibir os filtros do log local da aplicação.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogLocalFiltro;

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
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.Mask;                             

type
  TPlataformaERPVCLLogLocalFiltro = class(TForm)
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblDtOcorrenciaIni: TLabel;
    lblOcorrenciaAte: TLabel;
    lblMensagem: TLabel;
    txtMensagem: TEdit;
    txtDtOcorrenciaIni: TMaskEdit;
    txtDtOcorrenciaFim: TMaskEdit;
    txtHrOcorrenciaIni: TMaskEdit;
    txtHrOcorrenciaFim: TMaskEdit;
    lblHrOcorrenciaIni: TLabel;
    lblDtOcorrenciaFim: TLabel;
    lblHrOcorrenciaFim: TLabel;
    imgFormulario: TImage;
    btnLimpar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnMinimizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure txtDtOcorrenciaIniEnter(Sender: TObject);
    procedure txtDtOcorrenciaIniKeyPress(Sender: TObject; var Key: Char);
    procedure txtDtOcorrenciaIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtDtOcorrenciaIniExit(Sender: TObject);
    procedure txtHrOcorrenciaIniEnter(Sender: TObject);
    procedure txtHrOcorrenciaIniExit(Sender: TObject);
    procedure txtHrOcorrenciaIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtHrOcorrenciaIniKeyPress(Sender: TObject; var Key: Char);
    procedure txtDtOcorrenciaFimEnter(Sender: TObject);
    procedure txtDtOcorrenciaFimExit(Sender: TObject);
    procedure txtDtOcorrenciaFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtDtOcorrenciaFimKeyPress(Sender: TObject; var Key: Char);
    procedure txtHrOcorrenciaFimEnter(Sender: TObject);
    procedure txtHrOcorrenciaFimExit(Sender: TObject);
    procedure txtHrOcorrenciaFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtHrOcorrenciaFimKeyPress(Sender: TObject; var Key: Char);
    procedure txtMensagemEnter(Sender: TObject);
    procedure txtMensagemExit(Sender: TObject);
    procedure txtMensagemKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioConfirmar;
  public
    pubClicouConfirmar  : Boolean;
    pubDtHrOcorrenciaIni: TDateTime;
    pubDtHrOcorrenciaFim: TDateTime;
    pubMensagem         : string;
  end;

var
  PlataformaERPVCLLogLocalFiltro: TPlataformaERPVCLLogLocalFiltro;

implementation

{$R *.dfm}

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormCreate(Sender: TObject);
begin
  pubClicouConfirmar   := False;
  pubDtHrOcorrenciaIni := 0;
  pubDtHrOcorrenciaFim := 0;
  pubMensagem          := '';
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormShow(Sender: TObject);
begin
  FormularioLimpar;

  if pubDtHrOcorrenciaIni > 0 then
  begin
    txtDtOcorrenciaIni.Text := DateTimeStringConverter(pubDtHrOcorrenciaIni, 'dd/mm/yyyy');
    txtHrOcorrenciaIni.Text := DateTimeStringConverter(pubDtHrOcorrenciaIni, 'hh:nn');
  end;
  
  if pubDtHrOcorrenciaFim > 0 then
  begin
    txtDtOcorrenciaFim.Text := DateTimeStringConverter(pubDtHrOcorrenciaFim, 'dd/mm/yyyy');
    txtHrOcorrenciaFim.Text := DateTimeStringConverter(pubDtHrOcorrenciaFim, 'hh:nn');
  end;

  txtMensagem.Text := pubMensagem;

  txtDtOcorrenciaIni.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "Data inicial". 
//
procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaIniEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(txtDtOcorrenciaIni) then Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaIniKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaIniExit(Sender: TObject);
begin
  if not VCLMaskEditSair(txtDtOcorrenciaIni) then Exit;
  if not VCLMaskEditDataValidar(txtDtOcorrenciaIni) then Exit;
end;

//
// Horário inicial.
//
procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaIniEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(txtHrOcorrenciaIni) then Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaIniKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_HORARIO);
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaIniExit(Sender: TObject);
begin
  if not VCLMaskEditSair(txtHrOcorrenciaIni) then Exit;
  if not VCLMaskEditHorarioValidar(txtHrOcorrenciaIni) then Exit;
end;

//
// Data final.
//
procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaFimEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(txtDtOcorrenciaFim) then Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaFimKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtDtOcorrenciaFimExit(Sender: TObject);
begin
  if not VCLMaskEditSair(txtDtOcorrenciaFim) then Exit;
  if not VCLMaskEditDataValidar(txtDtOcorrenciaFim) then Exit;
end;

//
// Horário final.
//
procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaFimEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(txtHrOcorrenciaFim) then Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaFimKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_HORARIO);
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtHrOcorrenciaFimExit(Sender: TObject);
begin
  if not VCLMaskEditSair(txtHrOcorrenciaFim) then Exit;
  if not VCLMaskEditHorarioValidar(txtHrOcorrenciaFim) then Exit;  
end;

//
// Eventos do componente "Mensagem".
//
procedure TPlataformaERPVCLLogLocalFiltro.txtMensagemEnter(Sender: TObject);
begin
  if not VCLEditEntrar(txtMensagem) then Exit;
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtMensagemKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLLogLocalFiltro.txtMensagemExit(Sender: TObject);
begin
  if not VCLEditSair(txtMensagem) then Exit;
  if not VCLEditTextoValidar(txtMensagem) then Exit;
end;

//
// Evento de click no botão "Limpar".
//
procedure TPlataformaERPVCLLogLocalFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
  txtDtOcorrenciaIni.SetFocus;
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLLogLocalFiltro.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLLogLocalFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogLocalFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormularioLimpar;
begin
  VCLMaskEditLimpar(txtDtOcorrenciaIni);
  VCLMaskEditLimpar(txtHrOcorrenciaIni);

  VCLMaskEditLimpar(txtDtOcorrenciaFim);
  VCLMaskEditLimpar(txtHrOcorrenciaFim);

  VCLEditLimpar(txtMensagem);
end;

//
// Formulário confirmar.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormularioConfirmar;
var
  locDtHrOcorrenciaIni: TDateTime;
  locDtHrOcorrenciaFim: TDateTime;
  locMensagem         : string;
begin
  locDtHrOcorrenciaIni := StringDateTimeConverter(txtDtOcorrenciaIni.Text + ' ' + txtHrOcorrenciaIni.Text + ':00.000');
  locDtHrOcorrenciaFim := StringDateTimeConverter(txtDtOcorrenciaFim.Text + ' ' + txtHrOcorrenciaFim.Text + ':59.999');
  locMensagem          := StringTrim(txtMensagem.Text);

  if locDtHrOcorrenciaFim < locDtHrOcorrenciaIni then
  begin
    VCLConsistenciaExibir('A data de ocorrência final não pode ser anterior a data inicial!');
    txtDtOcorrenciaIni.SetFocus;
    Exit;
  end;

  pubDtHrOcorrenciaIni  := locDtHrOcorrenciaIni;
  pubDtHrOcorrenciaFim  := locDtHrOcorrenciaFim;
  pubMensagem           := locMensagem;
  pubClicouConfirmar    := True;
  Close;
end;

end.
