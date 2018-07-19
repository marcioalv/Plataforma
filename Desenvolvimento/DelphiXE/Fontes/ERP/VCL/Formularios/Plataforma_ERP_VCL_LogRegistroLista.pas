//
// Arquivo..: Plataforma_ERP_VCL_LogRegistroLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de logs de um registro.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogRegistroLista;

interface

uses
  Plataforma_ERP_Generico,
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
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TPlataformaERPVCLLogRegistroLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    btnFechar: TButton;
    lvwLista: TListView;
    btnSelecionar: TButton;
    btnMinimizar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FormularioAtualizar;
    procedure FormularioSelecionar;
  public
    pubLogRegistroLista: TPlataforma_ERP_LogRegistroLista;
  end;

var
  PlataformaERPVCLLogRegistroLista: TPlataformaERPVCLLogRegistroLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_LogRegistroExibir;

const
  LVW_LISTA_SEQUENCIAL: Byte = 0;
  
//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormActivate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "lista".
//
procedure TPlataformaERPVCLLogRegistroLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogRegistroLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogRegistroLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLLogRegistroLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "Selecionar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// FormularioAtualizar.
//
procedure TPlataformaERPVCLLogRegistroLista.FormularioAtualizar;
var
  locContador   : Integer;
  locLogRegistro: TPlataforma_ERP_LogRegistro;
  locListItem   : TListItem;
begin
  for locContador := 0 to (Length(pubLogRegistroLista) - 1) do
  begin
    locLogRegistro := pubLogRegistroLista[locContador];
  
    locListItem         := lvwLista.Items.Add;
    locListItem.Caption := '';
    locListItem.SubItems.Add(IntegerStringConverter(locLogRegistro.Sequencial));
    locListItem.SubItems.Add(DateTimeStringConverter(locLogRegistro.LogLocalDtHr,  'dd/mm/yyyy hh:nn:ss'));
    locListItem.SubItems.Add(DateTimeStringConverter(locLogRegistro.LogServerDtHr, 'dd/mm/yyyy hh:nn:ss'));
    locListItem.SubItems.Add(locLogRegistro.RegistroAcaoTitulo);    
    locListItem.SubItems.Add(locLogRegistro.HostName);    
    locListItem.SubItems.Add(locLogRegistro.UserName);
    locListItem.SubItems.Add(locLogRegistro.UsuarioNome);
    locListItem.SubItems.Add(locLogRegistro.Mensagem);
  end;
end;

//
// Procedimento para selecionar uma das linhas do listview e exibir seus detalhes.
//
procedure TPlataformaERPVCLLogRegistroLista.FormularioSelecionar;
var
  locIndice    : Integer;
  locSequencial: Integer;
  locFormulario: TPlataformaERPVCLLogRegistroExibir;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  locSequencial := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_SEQUENCIAL]);

  locFormulario := TPlataformaERPVCLLogRegistroExibir.Create(Self);

  locFormulario.pubLogRegistro := pubLogRegistroLista[locSequencial - 1];
  
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
