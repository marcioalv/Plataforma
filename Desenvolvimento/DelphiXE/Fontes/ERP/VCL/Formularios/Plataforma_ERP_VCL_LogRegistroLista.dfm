object PlataformaERPVCLLogRegistroLista: TPlataformaERPVCLLogRegistroLista
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de logs do registro'
  ClientHeight = 385
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    793
    385)
  PixelsPerInch = 96
  TextHeight = 13
  object imgFormulario: TImage
    Left = 8
    Top = 8
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF4000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000001
      D34944415478DA633432325AC3C8C818C4C0C0C0C88004FEFFFF7F838585C5FC
      D4A9539F407C6363633920F590818A0068470723D0E07FE89623019BB367CF1E
      A5B503FEE351630B74C01110434B4B8B878383238A9A0E0086FC05A21D402B40
      B403ECEDED59BE7EFD2A470D4BB9B9B91F1D3C78F00F490EA0721A90079AFB08
      E680DB405A058BA25FC038523973E6CC639A3AC0D4D45418981A0DD155FCFBF7
      EFFEB973E7EEC2F8C028E00046810D356C0746C1116014FC003B804A3E221B8C
      3A60E01D00AC0BFA80B43F860423E32D5656D6A013274E7C07F10D0D0DA58062
      87A96CFF0C9003FE000D66C6260BCC0956E7CF9F3F0E620F785DA0AFAF2FC0CC
      CC5C4165071C183A75C1803B806645313011BE002642712C8AFEFDFDFB57E3C2
      850BB769EA00605DA006B4C89E01B34CB80EAC0BE0D98E9A0D921F3F7E2CBB76
      EDDA170686C150108D3A60C01D004CDD85C012C90B8BDC1D5E5EDE5C58DB4D4F
      4F4F0CD84F584A55CB19195780B2E16F2083059B02A0C32C8039E124883DE075
      01509D08909A4665076C183A45F1803BC0CCCC4C0658625EA286A5C06A5D0FD8
      E97D0273C00720CD8F4D21308EF48089F032884DCB8E09A8ADEF05B48C094DD1
      25A0E5CB601C6A36488021D971F1E24590C71900E1D0004546D3F79F00000000
      49454E44AE426082}
  end
  object panFormulario: TPanel
    AlignWithMargins = True
    Left = 48
    Top = 8
    Width = 729
    Height = 329
    Margins.Left = 48
    Margins.Top = 8
    Margins.Right = 16
    Margins.Bottom = 48
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 665
    object lvwLista: TListView
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 709
      Height = 309
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      Columns = <
        item
          Width = 0
        end
        item
          Alignment = taRightJustify
          Caption = 'Sequencial'
          Width = 0
        end
        item
          Alignment = taCenter
          Caption = 'Local'
          Width = 165
        end
        item
          Alignment = taCenter
          Caption = 'Servidor'
          Width = 165
        end
        item
          Caption = 'Base ID'
          Width = 0
        end
        item
          Caption = 'Base'
          Width = 0
        end
        item
          Caption = 'A'#231#227'o ID'
          Width = 0
        end
        item
          Caption = 'A'#231#227'o'
          Width = 0
        end
        item
          Caption = 'HostName'
          Width = 0
        end
        item
          Caption = 'UserName'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio Base ID'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio ID'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio'
          Width = 0
        end
        item
          Caption = 'Mensagem'
          Width = 350
        end
        item
          Caption = 'Dados'
          Width = 0
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnCustomDrawItem = lvwListaCustomDrawItem
      OnCustomDrawSubItem = lvwListaCustomDrawSubItem
      OnDblClick = lvwListaDblClick
      OnKeyPress = lvwListaKeyPress
      ExplicitWidth = 645
    end
  end
  object btnFechar: TButton
    Left = 704
    Top = 344
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object btnSelecionar: TButton
    Left = 544
    Top = 344
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Selecionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSelecionarClick
  end
  object btnMinimizar: TButton
    Left = 624
    Top = 344
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Minimizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnMinimizarClick
  end
end
