//
// Arquivo..: Plataforma_ERP_VCL_DataExibicao.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com a exibi��o das informa��es sobre uma data.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_DataExibicao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TPlataformaERPVCLDataExibicao = class(TForm)
    imgFormulario: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    Panel1: TPanel;
    lblData: TLabel;
    edtData: TEdit;
    lblDiaSemana: TLabel;
    edtDiaSemana: TEdit;
    lblHorario: TLabel;
    edtHorario: TEdit;
    lblMilesimos: TLabel;
    edtPeriodo: TEdit;
    lblFeriado: TLabel;
    edtFeriado: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioAtualizar(argData: TDateTime);
  public
    pubData: TDateTime;
  end;

var
  PlataformaERPVCLDataExibicao: TPlataformaERPVCLDataExibicao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLDataExibicao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubData := 0;

  //
  // Limpa componentes do formul�rio.
  //
  FormularioLimpar;
end;

//
// Evento de exibi��o dos formul�rios.
//
procedure TPlataformaERPVCLDataExibicao.FormShow(Sender: TObject);
begin
  FormularioAtualizar(pubData);
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLDataExibicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLDataExibicao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLDataExibicao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar o formul�rio.
//
procedure TPlataformaERPVCLDataExibicao.FormularioLimpar;
begin
  VCLEditLimpar(edtData);
  VCLEditLimpar(edtHorario);
  VCLEditLimpar(edtPeriodo);
  VCLEditLimpar(edtDiaSemana);
  VCLEditLimpar(edtFeriado);
end;

//
// Procedimento para atualizar as informa��es sobre a data nos componentes do formul�rio.
//
procedure TPlataformaERPVCLDataExibicao.FormularioAtualizar(argData: TDateTime);
var
  argFormatacaoHorario: string;
begin
  argFormatacaoHorario := 'hh:nn';
  if FormatDateTime('ss',  argData) <> '00'  then argFormatacaoHorario := argFormatacaoHorario + ':ss';
  if FormatDateTime('zzz', argData) <> '000' then argFormatacaoHorario := argFormatacaoHorario + '.zzz';

  edtData.Text      := FormatDateTime('dd/mm/yyyy',         argData);
  edtHorario.Text   := FormatDateTime(argFormatacaoHorario, argData);
  edtPeriodo.Text   := PeriodoDeterminar(argData);
  edtDiaSemana.Text := DiaSemanaDeterminar(argData);
  edtFeriado.Text   := FeriadoFixoDeterminar(argData);

  if edtHorario.Text = '00:00:00' then
  begin
    lblHorario.Visible := False;
    edtHorario.Visible := False;
  end;

  if edtDiaSemana.Text = '' then
  begin
    lblDiaSemana.Visible := False;
    edtDiaSemana.Visible := False;
  end;

  if edtFeriado.Text = '' then
  begin
    lblFeriado.Visible := False;
    edtFeriado.Visible := False;
  end;
end;

end.
