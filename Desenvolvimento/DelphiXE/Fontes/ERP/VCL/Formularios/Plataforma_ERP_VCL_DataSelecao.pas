unit Plataforma_ERP_VCL_DataSelecao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.DateUtils,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.Samples.Calendar;

type
  TPlataformaERPVCLDataSelecao = class(TForm)
    imgFormulario: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    Image1: TImage;
    Panel1: TPanel;
    calCalendario: TCalendar;
    cbxMes: TComboBox;
    cbxAnos: TComboBox;
    imgMesDecrementar: TImage;
    imgMesIncrementar: TImage;
    lblHoje: TLabel;
    btnSelecionar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure imgMesDecrementarClick(Sender: TObject);
    procedure imgMesIncrementarClick(Sender: TObject);
    procedure lblHojeClick(Sender: TObject);
    procedure cbxMesEnter(Sender: TObject);
    procedure cbxMesExit(Sender: TObject);
    procedure cbxMesKeyPress(Sender: TObject; var Key: Char);
    procedure cbxAnosEnter(Sender: TObject);
    procedure cbxAnosExit(Sender: TObject);
    procedure cbxAnosKeyPress(Sender: TObject; var Key: Char);
    procedure cbxMesSelect(Sender: TObject);
    procedure cbxAnosSelect(Sender: TObject);
    procedure calCalendarioDblClick(Sender: TObject);
    procedure calCalendarioKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FormularioSelecionar;
    procedure CalendarioAtualizar(argCalendario: Boolean);
  public
    pubData        : TDateTime;
    pubClicouFechar: Boolean;
  end;

var
  PlataformaERPVCLDataSelecao: TPlataformaERPVCLDataSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLDataSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar := True;
  pubData         := 0;

  //
  // Carrega comboboxes de datas.
  //
  VCLComboBoxMesesPopular(cbxMes);
  VCLComboBoxAnosPopular(cbxAnos);
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLDataSelecao.FormShow(Sender: TObject);
var
  locData: TDateTime;
begin
  //
  // Determina a data apropriada.
  //
  if pubData = 0 then
  begin
    locData := Date;
  end
  else
  begin
    locData := pubData;
  end;

  //
  // Seleciona a data apropriada no calendário.
  //
  calCalendario.CalendarDate := locData;
  CalendarioAtualizar(True);

  //
  // Seleciona data no label.
  //
  lblHoje.Caption := 'Hoje: ' + FormatDateTime('dd/mm/yyyy', locData);

  //
  // Foco.
  //
  calCalendario.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLDataSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "mês".
//
procedure TPlataformaERPVCLDataSelecao.cbxMesEnter(Sender: TObject);
begin
  VCLComboBoxEntrar(cbxMes);
end;

procedure TPlataformaERPVCLDataSelecao.cbxMesKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFABETICA);
end;

procedure TPlataformaERPVCLDataSelecao.cbxMesExit(Sender: TObject);
begin
  VCLComboBoxSair(cbxMes);
  if not VCLComboBoxValidar(cbxMes) then
  begin
    CalendarioAtualizar(True);
    Exit;
  end;
  CalendarioAtualizar(False);
end;

procedure TPlataformaERPVCLDataSelecao.cbxMesSelect(Sender: TObject);
begin
  CalendarioAtualizar(False);
end;

//
// Evento do componente "ano".
//
procedure TPlataformaERPVCLDataSelecao.cbxAnosEnter(Sender: TObject);
begin
  VCLComboBoxEntrar(cbxAnos);
end;

procedure TPlataformaERPVCLDataSelecao.cbxAnosKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLDataSelecao.cbxAnosExit(Sender: TObject);
begin
  VCLComboBoxSair(cbxAnos);
  if not VCLComboBoxValidar(cbxAnos) then
  begin
    CalendarioAtualizar(True);
    Exit;
  end;
  CalendarioAtualizar(False);
end;

procedure TPlataformaERPVCLDataSelecao.cbxAnosSelect(Sender: TObject);
begin
  CalendarioAtualizar(False);
end;

//
// Decrementa mês.
//
procedure TPlataformaERPVCLDataSelecao.imgMesDecrementarClick(Sender: TObject);
begin
  calCalendario.CalendarDate := IncMonth(calCalendario.CalendarDate, -1);
  CalendarioAtualizar(True);
end;

//
// Incrementa mês.
//
procedure TPlataformaERPVCLDataSelecao.imgMesIncrementarClick(Sender: TObject);
begin
  calCalendario.CalendarDate := IncMonth(calCalendario.CalendarDate, +1);
  CalendarioAtualizar(True);
end;

//
// Eventos do componente "calendário".
//
procedure TPlataformaERPVCLDataSelecao.calCalendarioDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLDataSelecao.calCalendarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then calCalendarioDblClick(Sender);
end;

//
// Data de hoje.
//
procedure TPlataformaERPVCLDataSelecao.lblHojeClick(Sender: TObject);
begin
  calCalendario.CalendarDate := Date;
  CalendarioAtualizar(True);
end;

//
// Evento de click no botão "selecionar".
//
procedure TPlataformaERPVCLDataSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLDataSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLDataSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para selecionar os dados do formulário.
//
procedure TPlataformaERPVCLDataSelecao.FormularioSelecionar;
begin
  pubClicouFechar := False;
  pubData         := calCalendario.CalendarDate;
  Close;
end;

//
// Procedimento para atualizar o componente calendário.
//
procedure TPlataformaERPVCLDataSelecao.CalendarioAtualizar(argCalendario: Boolean);
var
  locStrMes: string;
  locStrAno: string;

  locDia: Integer;
  locMes: Integer;
  locAno: Integer;
begin
  if argCalendario then
  begin
    locStrMes := NomeMesDeterminar(calCalendario.CalendarDate);
    locStrAno := IntToStr(YearOf(calCalendario.CalendarDate));
    
    VCLComboBoxSelecionar(cbxMes,  locStrMes);
    VCLComboBoxSelecionar(cbxAnos, locStrAno);  
  end
  else
  begin
    locDia := DayOf(calCalendario.CalendarDate);
    locMes := (cbxMes.ItemIndex + 1);
    locAno := StrToIntDef(cbxAnos.Text, 0);

    try
      calCalendario.CalendarDate := EncodeDate(locAno, locMes, locDia);
    except
      calCalendario.CalendarDate := Date;
    end;
  end;
end;

end.
