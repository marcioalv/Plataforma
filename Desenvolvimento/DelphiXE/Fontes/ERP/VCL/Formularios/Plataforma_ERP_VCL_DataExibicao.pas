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
  Vcl.ExtCtrls, Vcl.Grids, Vcl.Samples.Calendar;

type
  TPlataformaERPVCLDataExibicao = class(TForm)
    imgFormulario: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    panFormulario: TPanel;
    lblDia: TLabel;
    edtDia: TEdit;
    lblDiaSemana: TLabel;
    edtDiaSemana: TEdit;
    lblHora: TLabel;
    edtHora: TEdit;
    lblPeriodo: TLabel;
    edtPeriodo: TEdit;
    lblFeriado: TLabel;
    edtFeriado: TEdit;
    lblMes: TLabel;
    edtMes: TEdit;
    lblAno: TLabel;
    edtAno: TEdit;
    lblMinuto: TLabel;
    edtMinuto: TEdit;
    lblSegundo: TLabel;
    edtSegundo: TEdit;
    edtMilesimos: TEdit;
    lblMilesimos: TLabel;
    lblMinutoSeparador: TLabel;
    lblSegundoSeparador: TLabel;
    lblMesSeparador: TLabel;
    lblAnoSeparador: TLabel;
    imgBackground: TImage;
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
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_Generico;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLDataExibicao.FormCreate(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
  
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
  VCLEditLimpar(edtDia);
  VCLEditLimpar(edtMes);
  VCLEditLimpar(edtAno);
  VCLEditLimpar(edtDiaSemana);
  VCLEditLimpar(edtFeriado);
  VCLEditLimpar(edtHora);
  VCLEditLimpar(edtMinuto);
  VCLEditLimpar(edtSegundo);
  VCLEditLimpar(edtMilesimos);
  VCLEditLimpar(edtPeriodo);
end;

//
// Procedimento para atualizar as informa��es sobre a data nos componentes do formul�rio.
//
procedure TPlataformaERPVCLDataExibicao.FormularioAtualizar(argData: TDateTime);
begin
  edtDia.Text       := FormatDateTime('dd',   argData);
  edtMes.Text       := NomeMesDeterminar(argData);
  edtAno.Text       := FormatDateTime('yyyy', argData);
  edtDiaSemana.Text := DiaSemanaDeterminar(argData);
 
  edtFeriado.Text   := FeriadoFixoDeterminar(argData);  

  edtHora.Text      := FormatDateTime('hh',  argData);
  edtMinuto.Text    := FormatDateTime('nn',  argData);
  edtSegundo.Text   := FormatDateTime('ss',  argData);
  edtMilesimos.Text := FormatDateTime('zzz', argData);
  edtPeriodo.Text   := PeriodoDeterminar(argData);

  if edtFeriado.Text = '' then
  begin
    edtFeriado.Text := 'Nenhum feriado programado nesta data!';
  end;

  if (edtHora.Text = '00') then
  begin
    lblHora.Visible := False;
    edtHora.Visible := False;
  end;

  if (edtMinuto.Text = '00') then
  begin
    lblMinutoSeparador.Visible := False;
    lblMinuto.Visible          := False;
    edtMinuto.Visible          := False;
  end;

  if (edtSegundo.Text = '00') then
  begin
    lblSegundoSeparador.Visible := False;
    lblSegundo.Visible          := False;
    edtSegundo.Visible          := False;    
  end;

  if (edtMilesimos.Text = '000') then
  begin
    lblMilesimos.Visible := False;
    edtMilesimos.Visible := False;
  end;

  if (edtHora.Text      = '00') and
     (edtMinuto.Text    = '00') and
     (edtSegundo.Text   = '00') and
     (edtMilesimos.Text = '000') then
  begin
    lblPeriodo.Visible := False;
    edtPeriodo.Visible := False;    
  end;
end;

end.
