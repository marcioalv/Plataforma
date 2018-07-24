object PlataformaERPVCLLogRegistroExibir: TPlataformaERPVCLLogRegistroExibir
  Left = 0
  Top = 0
  ActiveControl = btnFechar
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Log de registro'
  ClientHeight = 537
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
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
  object btnFechar: TButton
    Left = 488
    Top = 496
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object pagFormulario: TPageControl
    Left = 48
    Top = 8
    Width = 513
    Height = 481
    Cursor = crHandPoint
    ActivePage = tabRegistro
    TabOrder = 1
    object tabRegistro: TTabSheet
      Caption = 'Registro'
      object lblSequencial: TLabel
        Left = 16
        Top = 16
        Width = 62
        Height = 14
        Caption = 'Sequencial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblLogLocalDtHr: TLabel
        Left = 104
        Top = 16
        Width = 95
        Height = 14
        Caption = 'Data e hora local:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblLogServerDtHr: TLabel
        Left = 304
        Top = 16
        Width = 114
        Height = 14
        Caption = 'Data e hora servidor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblRegistroAcaoTitulo: TLabel
        Left = 16
        Top = 112
        Width = 31
        Height = 14
        Caption = 'A'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblHostName: TLabel
        Left = 16
        Top = 160
        Width = 60
        Height = 14
        Caption = 'HostName:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUserName: TLabel
        Left = 16
        Top = 208
        Width = 59
        Height = 14
        Caption = 'UserName:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUsuarioNome: TLabel
        Left = 16
        Top = 256
        Width = 43
        Height = 14
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMensagem: TLabel
        Left = 16
        Top = 304
        Width = 62
        Height = 14
        Caption = 'Mensagem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblLogBase: TLabel
        Left = 16
        Top = 64
        Width = 29
        Height = 14
        Caption = 'Base:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtSequencial: TEdit
        Left = 16
        Top = 32
        Width = 73
        Height = 26
        TabStop = False
        Alignment = taRightJustify
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '999.999'
      end
      object edtLogLocalDtHr: TEdit
        Left = 104
        Top = 32
        Width = 185
        Height = 26
        Hint = 'Clique para exibir informa'#231#245'es sobre a data local!'
        TabStop = False
        Alignment = taCenter
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtLogLocalDtHrClick
      end
      object edtLogServerDtHr: TEdit
        Left = 304
        Top = 32
        Width = 185
        Height = 26
        Hint = 'Clique para exibir informa'#231#245'es sobre a data no servidor!'
        TabStop = False
        Alignment = taCenter
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtLogServerDtHrClick
      end
      object edtRegistroAcaoDescricao: TEdit
        Left = 16
        Top = 128
        Width = 473
        Height = 26
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '999.999'
      end
      object edtHostName: TEdit
        Left = 16
        Top = 176
        Width = 473
        Height = 26
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '999.999'
      end
      object edtUserName: TEdit
        Left = 16
        Top = 224
        Width = 473
        Height = 26
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '999.999'
      end
      object edtUsuarioNome: TEdit
        Left = 16
        Top = 272
        Width = 473
        Height = 26
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '999.999'
      end
      object memMensagem: TMemo
        Left = 16
        Top = 320
        Width = 473
        Height = 113
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'memMensagem')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object edtLogBaseDescricao: TEdit
        Left = 16
        Top = 80
        Width = 473
        Height = 26
        Hint = 'Clique para informa'#231#245'es sobre a base de dados do log!'
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '999.999'
        OnClick = edtLogBaseDescricaoClick
      end
      object edtLogBaseID: TEdit
        Left = 336
        Top = 80
        Width = 73
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = 'edtLogBaseID'
        Visible = False
      end
      object edtRegistroAcaoID: TEdit
        Left = 288
        Top = 128
        Width = 121
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = 'edtRegistroAcaoID'
        Visible = False
      end
      object edtUsuarioID: TEdit
        Left = 320
        Top = 272
        Width = 89
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = 'edtUsuarioID'
        Visible = False
      end
      object edtUsuarioBaseID: TEdit
        Left = 192
        Top = 272
        Width = 113
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = 'edtUsuarioBaseID'
        Visible = False
      end
    end
    object tabDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object memDados: TMemo
        Left = 8
        Top = 8
        Width = 489
        Height = 433
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'memDados')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
end
