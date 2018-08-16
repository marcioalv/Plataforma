//
// Arquivo..: Plataforma_ERP_VCL_DataExibicao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a exibição das informações sobre uma data.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.Samples.Calendar,
  Vcl.Menus;

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
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
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
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLDataExibicao.FormCreate(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
  
  //
  // Inicializa variáveis públicas.
  //
  pubData := 0;

  //
  // Limpa componentes do formulário.
  //
  FormularioLimpar;
end;

//
// Evento de exibição dos formulários.
//
procedure TPlataformaERPVCLDataExibicao.FormShow(Sender: TObject);
begin
  FormularioAtualizar(pubData);
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLDataExibicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLDataExibicao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLDataExibicao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLDataExibicao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLDataExibicao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar o formulário.
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
// Procedimento para atualizar as informações sobre a data nos componentes do formulário.
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

    lblFeriado.Visible := False;
    edtFeriado.Visible := False;

    lblDia.Top := lblDia.Top + 24;
    edtDia.Top := edtDia.Top + 24;

    lblMesSeparador.Top := lblMesSeparador.Top + 24;

    lblMes.Top := lblMes.Top + 24;
    edtMes.Top := edtMes.Top + 24;

    lblAnoSeparador.Top := lblAnoSeparador.Top + 24;

    lblAno.Top := lblAno.Top + 24;
    edtAno.Top := edtAno.Top + 24;

    lblDiaSemana.Top := lblDiaSemana.Top + 24;
    edtDiaSemana.Top := edtDiaSemana.Top + 24;

    lblHora.Top := lblHora.Top - 24;
    edtHora.Top := edtHora.Top - 24;
    
    lblMinutoSeparador.Top := lblMinutoSeparador.Top - 24;
    
    lblMinuto.Top := lblMinuto.Top - 24;
    edtMinuto.Top := edtMinuto.Top - 24;

    lblSegundoSeparador.Top := lblSegundoSeparador.Top - 24;

    lblSegundo.Top := lblSegundo.Top - 24;
    edtSegundo.Top := edtSegundo.Top - 24;

    lblMilesimos.Top := lblMilesimos.Top - 24;
    edtMilesimos.Top := edtMilesimos.Top - 24;

    lblPeriodo.Top := lblPeriodo.Top - 24;
    edtPeriodo.Top := edtPeriodo.Top - 24;
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
