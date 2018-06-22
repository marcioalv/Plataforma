object PlataformaERPVCLLogLocalArquivoSelecao: TPlataformaERPVCLLogLocalArquivoSelecao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sele'#231#227'o do arquivo de log local'
  ClientHeight = 458
  ClientWidth = 746
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
    Width = 729
    Height = 401
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblDtLog: TLabel
      Left = 526
      Top = 114
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object lblArquivo: TLabel
      Left = 32
      Top = 40
      Width = 41
      Height = 13
      Caption = 'Arquivo:'
    end
    object rbtArquivo: TRadioButton
      Left = 16
      Top = 16
      Width = 321
      Height = 17
      Cursor = crHandPoint
      Caption = 'Indicar um arquivo de log gravado em algum lugar.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = rbtArquivoClick
    end
    object rbtHistorico: TRadioButton
      Left = 16
      Top = 112
      Width = 299
      Height = 17
      Cursor = crHandPoint
      Caption = 'Selecionar uma das datas do hist'#243'rico de log da aplica'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = rbtHistoricoClick
    end
    object lbxHistorico: TListBox
      Left = 32
      Top = 144
      Width = 681
      Height = 233
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 2
      OnDblClick = lbxHistoricoDblClick
      OnKeyPress = lbxHistoricoKeyPress
    end
    object txtArquivo: TEdit
      Left = 32
      Top = 56
      Width = 601
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'txtArquivo'
    end
    object btnDtLogLocalizar: TBitBtn
      Left = 638
      Top = 108
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Localizar'
      TabOrder = 4
    end
    object txtDtLog: TMaskEdit
      Left = 558
      Top = 110
      Width = 73
      Height = 21
      Alignment = taCenter
      EditMask = '99/99/9999'
      MaxLength = 10
      TabOrder = 5
      Text = '99/99/9999'
    end
    object btnArquivoSelecionar: TBitBtn
      Left = 640
      Top = 55
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Selecionar'
      TabOrder = 6
      OnClick = btnArquivoSelecionarClick
    end
  end
  object btnFechar: TBitBtn
    Left = 664
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object btnConfirmar: TBitBtn
    Left = 504
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnMinimizar: TBitBtn
    Left = 584
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Minimizar'
    TabOrder = 3
    OnClick = btnMinimizarClick
  end
  object dlgArquivo: TOpenDialog
    Left = 560
    Top = 232
  end
end
