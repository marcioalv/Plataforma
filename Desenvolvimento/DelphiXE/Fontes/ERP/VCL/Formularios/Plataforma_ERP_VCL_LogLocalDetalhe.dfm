object PlataformaERPVCLLogLocalDetalhe: TPlataformaERPVCLLogLocalDetalhe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Detalhes do log local da aplica'#231#227'o'
  ClientHeight = 482
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    545
    482)
  PixelsPerInch = 96
  TextHeight = 13
  object panFormulario: TPanel
    Left = 8
    Top = 8
    Width = 529
    Height = 425
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 48
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblAplicativo: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Aplicativo:'
    end
    object lblHashCode: TLabel
      Left = 264
      Top = 8
      Width = 53
      Height = 13
      Caption = 'HashCode:'
    end
    object lblHostName: TLabel
      Left = 8
      Top = 56
      Width = 53
      Height = 13
      Caption = 'HostName:'
    end
    object lblUserName: TLabel
      Left = 264
      Top = 56
      Width = 53
      Height = 13
      Caption = 'UserName:'
    end
    object lblUsuario: TLabel
      Left = 8
      Top = 104
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object lblDataHora: TLabel
      Left = 88
      Top = 152
      Width = 54
      Height = 13
      Caption = 'Data/Hora:'
    end
    object lblCritico: TLabel
      Left = 8
      Top = 152
      Width = 34
      Height = 13
      Caption = 'Cr'#237'tico:'
    end
    object lblMensagem: TLabel
      Left = 8
      Top = 200
      Width = 55
      Height = 13
      Caption = 'Mensagem:'
    end
    object txtAplicativo: TEdit
      Left = 8
      Top = 24
      Width = 249
      Height = 22
      TabStop = False
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'txtAplicativo'
    end
    object txtHashCode: TEdit
      Left = 264
      Top = 24
      Width = 249
      Height = 22
      TabStop = False
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'txtHashCode'
    end
    object txtHostName: TEdit
      Left = 8
      Top = 72
      Width = 249
      Height = 22
      TabStop = False
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'txtHostName'
    end
    object txtUserName: TEdit
      Left = 264
      Top = 72
      Width = 249
      Height = 22
      TabStop = False
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = 'txtUserName'
    end
    object txtUsuarioID: TEdit
      Left = 8
      Top = 120
      Width = 73
      Height = 22
      TabStop = False
      Alignment = taRightJustify
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '999.999'
    end
    object txtUsuarioNome: TEdit
      Left = 88
      Top = 120
      Width = 425
      Height = 22
      TabStop = False
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = 'txtUsuarioNome'
    end
    object txtDataHora: TEdit
      Left = 88
      Top = 168
      Width = 169
      Height = 22
      TabStop = False
      Alignment = taCenter
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '99/99/9999 99:99:99.999'
    end
    object txtCritico: TEdit
      Left = 8
      Top = 168
      Width = 73
      Height = 22
      TabStop = False
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = 'Sim'
    end
    object txtMensagem: TMemo
      Left = 8
      Top = 216
      Width = 505
      Height = 193
      TabStop = False
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'txtMensagem')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 8
    end
  end
  object btnFechar: TBitBtn
    Left = 464
    Top = 440
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object btnMinimizar: TBitBtn
    Left = 384
    Top = 440
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Minimizar'
    TabOrder = 2
    OnClick = btnMinimizarClick
  end
end
