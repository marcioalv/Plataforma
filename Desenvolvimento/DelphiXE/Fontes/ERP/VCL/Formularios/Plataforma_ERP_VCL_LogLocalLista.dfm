object PlataformaERPVCLLogLocalLista: TPlataformaERPVCLLogLocalLista
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de mensagens de log local da aplica'#231#227'o'
  ClientHeight = 666
  ClientWidth = 1273
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panFormulario: TPanel
    Left = 8
    Top = 8
    Width = 1257
    Height = 609
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
    object lblArquivoLog: TLabel
      Left = 8
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Arquivo log:'
    end
    object imgArquivoLogSelecionar: TImage
      Left = 1226
      Top = 27
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
      OnClick = imgArquivoLogSelecionarClick
    end
    object lblInformacoes: TLabel
      Left = 8
      Top = 56
      Width = 64
      Height = 13
      Caption = 'Informa'#231#245'es:'
    end
    object txtArquivoLog: TEdit
      Left = 8
      Top = 24
      Width = 1209
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
      Text = 'txtArquivoLog'
    end
    object lvwInformacoes: TListView
      Left = 8
      Top = 72
      Width = 1233
      Height = 521
      Cursor = crHandPoint
      Columns = <
        item
          Caption = 'Icone'
          Width = 0
        end
        item
          Caption = 'Aplicativo'
          Width = 0
        end
        item
          Caption = 'HashCode'
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
          Alignment = taRightJustify
          Caption = 'Usu'#225'rio ID'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio'
          Width = 0
        end
        item
          Alignment = taCenter
          Caption = 'Critico'
          Width = 0
        end
        item
          Alignment = taCenter
          Caption = 'Data/Hora'
          Width = 150
        end
        item
          Caption = 'Mensagem'
          Width = 1050
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
      OnCustomDrawItem = lvwInformacoesCustomDrawItem
      OnCustomDrawSubItem = lvwInformacoesCustomDrawSubItem
      OnDblClick = lvwInformacoesDblClick
      OnKeyPress = lvwInformacoesKeyPress
    end
  end
  object btnFiltrar: TBitBtn
    Left = 8
    Top = 624
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Filtrar'
    TabOrder = 1
    OnClick = btnFiltrarClick
  end
  object btnLocalizar: TBitBtn
    Left = 88
    Top = 624
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Localizar'
    TabOrder = 2
    OnClick = btnLocalizarClick
  end
  object btnAtualizar: TBitBtn
    Left = 168
    Top = 624
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Atualizar'
    TabOrder = 3
    OnClick = btnAtualizarClick
  end
  object btnFechar: TBitBtn
    Left = 1192
    Top = 624
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object btnDetalhes: TBitBtn
    Left = 248
    Top = 624
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Detalhes'
    TabOrder = 5
    OnClick = btnDetalhesClick
  end
end
