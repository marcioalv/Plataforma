object PlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao: TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Plataforma ERP - Localizar configura'#231#227'o de conex'#227'o'
  ClientHeight = 201
  ClientWidth = 474
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
  object panFormulario: TPanel
    Left = 8
    Top = 8
    Width = 457
    Height = 145
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 80
      Width = 30
      Height = 13
      Caption = 'T'#237'tulo:'
    end
    object lblModo: TLabel
      Left = 16
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Modo:'
    end
    object edtTitulo: TEdit
      Left = 16
      Top = 96
      Width = 417
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '9999'
      OnEnter = edtTituloEnter
      OnExit = edtTituloExit
      OnKeyPress = edtTituloKeyPress
    end
    object rbtModoPrimeiro: TRadioButton
      Left = 24
      Top = 32
      Width = 281
      Height = 17
      Caption = 'Iniciar a busca pelo primeiro item da lista.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = rbtModoPrimeiroKeyPress
    end
    object rbtModoProximo: TRadioButton
      Left = 24
      Top = 48
      Width = 417
      Height = 17
      Caption = 
        'Localizar a pr'#243'xima ocorr'#234'ncia a partir do item atual selecionad' +
        'o da lista.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = rbtModoProximoKeyPress
    end
  end
  object btnSair: TButton
    Left = 392
    Top = 160
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnSairClick
  end
  object btnLimpar: TButton
    Left = 312
    Top = 160
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Limpar'
    TabOrder = 2
    OnClick = btnLimparClick
  end
  object btnLocalizar: TButton
    Left = 232
    Top = 160
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Localizar'
    TabOrder = 1
    OnClick = btnLocalizarClick
  end
end
