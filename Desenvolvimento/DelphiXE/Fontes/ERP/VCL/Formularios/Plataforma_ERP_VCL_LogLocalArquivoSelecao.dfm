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
    object imgArquivoSelecionar: TImage
      Left = 684
      Top = 51
      Width = 17
      Height = 17
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        07544269746D6170AA030000424DAA0300000000000036000000280000001100
        0000110000000100180000000000740300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        979797C1C1C1FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9797975A5A5A989898FFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9797975A5A5A989898FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEAEAEAD6D6D6D6D6D6F5F5F5FFFFFFFFFFFF9797975A5A5A989898FFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFFFFFFFFE0E0E08383835A5A5A5A5A5A5A5A5A5A5A
        5A979797C1C1C15A5A5A989898FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        E0E0E06464645A5A5A989898B7B7B7ADADAD8383835A5A5A5A5A5AC2C2C2FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF7878785A5A5ACBCBCBFFFFFF
        FFFFFFFFFFFFFFFFFFACACAC5A5A5A979797FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFE0E0E05A5A5A979797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        8383835A5A5AF5F5F5FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFACACAC5A5A5AD6
        D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC5A5A5AD6D6D6FFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFACACAC5A5A5AD6D6D6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB7B7B75A5A5AD6D6D6FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFCBCBCB5A5A5AACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9797975A
        5A5AEAEAEAFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF6E6E6E646464E0E0
        E0FFFFFFFFFFFFFFFFFFFFFFFFCBCBCB5A5A5A838383FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFFD6D6D65A5A5A646464ACACACD6D6D6D6D6D69797
        975A5A5A646464E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFD6D6D66F6F6F5A5A5A5A5A5A5A5A5A5A5A5A797979E0E0E0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB
        ADADADADADADE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      Transparent = True
      OnClick = imgArquivoSelecionarClick
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
      Top = 104
      Width = 401
      Height = 17
      Cursor = crHandPoint
      Caption = 'Selecionar uma das datas do hist'#243'rico de log da aplica'#231#227'o.'
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
      Top = 136
      Width = 673
      Height = 241
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
      Top = 48
      Width = 649
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
  object btnSelecionar: TBitBtn
    Left = 584
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Selecionar'
    TabOrder = 2
    OnClick = btnSelecionarClick
  end
  object dlgArquivo: TOpenDialog
    Left = 560
    Top = 232
  end
end
