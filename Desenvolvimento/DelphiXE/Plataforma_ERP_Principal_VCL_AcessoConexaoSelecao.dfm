object PlataformaERPPrincipalVCLAcessoConexaoSelecao: TPlataformaERPPrincipalVCLAcessoConexaoSelecao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Plataforma ERP - Sele'#231#227'o da conex'#227'o de acesso '#224' aplica'#231#227'o'
  ClientHeight = 353
  ClientWidth = 545
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
    Width = 529
    Height = 297
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblQtdeLinhas: TLabel
      Left = 10
      Top = 272
      Width = 132
      Height = 13
      Caption = 'Quantidade de linhas: 9999'
    end
    object lblFiltrosAplicados: TLabel
      Left = 432
      Top = 272
      Width = 80
      Height = 13
      Caption = 'Filtros aplicados!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lvwLista: TListView
      Left = 8
      Top = 8
      Width = 505
      Height = 257
      Cursor = crHandPoint
      Columns = <
        item
          Width = 0
        end
        item
          Alignment = taRightJustify
          Caption = 'Item'
          Tag = 1
        end
        item
          Caption = 'T'#237'tulo'
          Width = 425
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lvwListaColumnClick
      OnCompare = lvwListaCompare
      OnCustomDrawItem = lvwListaCustomDrawItem
      OnCustomDrawSubItem = lvwListaCustomDrawSubItem
      OnDblClick = lvwListaDblClick
      OnKeyPress = lvwListaKeyPress
    end
  end
  object btnAtualizar: TButton
    Left = 88
    Top = 312
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Atualizar'
    TabOrder = 3
    OnClick = btnAtualizarClick
  end
  object btnFiltrar: TButton
    Left = 8
    Top = 312
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Filtrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnFiltrarClick
  end
  object btnSair: TButton
    Left = 464
    Top = 312
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
    TabOrder = 5
    OnClick = btnSairClick
  end
  object btnConfigurar: TButton
    Left = 168
    Top = 312
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Configurar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnConfigurarClick
  end
  object btnSelecionar: TButton
    Left = 384
    Top = 312
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Selecionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnSelecionarClick
  end
end
