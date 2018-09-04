object PlataformaERPVCLConexaoTeste: TPlataformaERPVCLConexaoTeste
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Plataforma ERP - Testando conex'#227'o...'
  ClientHeight = 75
  ClientWidth = 273
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
    Width = 257
    Height = 57
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblMensagem: TLabel
      Left = 16
      Top = 19
      Width = 116
      Height = 16
      Caption = 'Testando conex'#227'o...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object timInicializacao: TTimer
    Enabled = False
    Interval = 250
    OnTimer = timInicializacaoTimer
    Left = 208
    Top = 24
  end
end
