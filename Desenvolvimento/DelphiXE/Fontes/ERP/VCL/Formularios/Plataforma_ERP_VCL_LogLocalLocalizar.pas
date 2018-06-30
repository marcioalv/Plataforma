//
// Arquivo..: Plataforma_ERP_VCL_LogLocalLocalizar.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para exibir as opções de campos para a localização de informações no arquivo de log.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogLocalLocalizar;

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
  Vcl.Mask,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLLogLocalLocalizar = class(TForm)
    imgFormulario: TImage;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblDtOcorrencia: TLabel;
    lblMensagem: TLabel;
    lblHrOcorrencia: TLabel;
    txtMensagem: TEdit;
    txtDtOcorrencia: TMaskEdit;
    txtHrOcorrencia: TMaskEdit;
    btnLimpar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnMinimizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure txtDtOcorrenciaEnter(Sender: TObject);
    procedure txtDtOcorrenciaExit(Sender: TObject);
    procedure txtDtOcorrenciaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtDtOcorrenciaKeyPress(Sender: TObject; var Key: Char);
    procedure txtHrOcorrenciaKeyPress(Sender: TObject; var Key: Char);
    procedure txtHrOcorrenciaExit(Sender: TObject);
    procedure txtHrOcorrenciaEnter(Sender: TObject);
    procedure txtHrOcorrenciaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtMensagemEnter(Sender: TObject);
    procedure txtMensagemExit(Sender: TObject);
    procedure txtMensagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtMensagemKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioConfirmar;
  public
    pubClicouConfirmar: Boolean;
    pubDtHrOcorrencia : TDateTime;
    pubMensagem       : string;
  end;

var
  PlataformaERPVCLLogLocalLocalizar: TPlataformaERPVCLLogLocalLocalizar;

implementation

{$R *.dfm}

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogLocalLocalizar.FormCreate(Sender: TObject);
begin
  pubClicouConfirmar := False;
  pubDtHrOcorrencia  := 0;
  pubMensagem        := '';
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogLocalLocalizar.FormShow(Sender: TObject);
begin
  FormularioLimpar;

  txtDtOcorrencia.Text := DateTimeStringConverter(pubDtHrOcorrencia, 'dd/mm/yyyy');
  txtHrOcorrencia.Text := DateTimeStringConverter(pubDtHrOcorrencia, 'hh:nn');
  txtMensagem.Text     := pubMensagem;

  txtDtOcorrencia.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogLocalLocalizar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componentes "Data da ocorrência".
//
procedure TPlataformaERPVCLLogLocalLocalizar.txtDtOcorrenciaEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(txtDtOcorrencia) then Exit;
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtDtOcorrenciaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtDtOcorrenciaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtDtOcorrenciaExit(Sender: TObject);
begin
  if not VCLMaskEditSair(txtDtOcorrencia) then Exit;
  if not VCLMaskEditDataValidar(txtDtOcorrencia) then Exit;
end;

//
// Eventos do componente "Hora da ocorrência".
//
procedure TPlataformaERPVCLLogLocalLocalizar.txtHrOcorrenciaEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(txtHrOcorrencia) then Exit;
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtHrOcorrenciaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_HORARIO);
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtHrOcorrenciaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtHrOcorrenciaExit(Sender: TObject);
begin
  if not VCLMaskEditSair(txtHrOcorrencia) then Exit;
  if not VCLMaskEditHorarioValidar(txtHrOcorrencia) then Exit;
end;

//
// Eventos do componente "Mensagem".
//
procedure TPlataformaERPVCLLogLocalLocalizar.txtMensagemEnter(Sender: TObject);
begin
  if not VCLEditEntrar(txtMensagem) then Exit;
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtMensagemKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtMensagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLLogLocalLocalizar.txtMensagemExit(Sender: TObject);
begin
  if not VCLEditSair(txtMensagem) then Exit;
  if not VCLEditTextoValidar(txtMensagem) then Exit;
end;

//
// Evento de click no botão "Limpar".
//
procedure TPlataformaERPVCLLogLocalLocalizar.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
  txtDtOcorrencia.SetFocus;
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLLogLocalLocalizar.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Minimizar.
//
procedure TPlataformaERPVCLLogLocalLocalizar.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogLocalLocalizar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLogLocalLocalizar.FormularioLimpar;
begin
  VCLMaskEditLimpar(txtDtOcorrencia);
  VCLMaskEditLimpar(txtHrOcorrencia);
  VCLEditLimpar(txtMensagem);
end;

//
// Procedimento para confirmar as opções do formulário.
//
procedure TPlataformaERPVCLLogLocalLocalizar.FormularioConfirmar;
var
  locDtHrOcorrencia: TDateTime;
  locMensagem      : string;
begin
  locDtHrOcorrencia := StringDateTimeConverter(txtDtOcorrencia.Text + ' ' + txtHrOcorrencia.Text);
  locMensagem       := StringTrim(txtMensagem.Text);

  pubDtHrOcorrencia := locDtHrOcorrencia;
  pubMensagem       := locMensagem;

  pubClicouConfirmar := True;
  Close;
end;

end.
