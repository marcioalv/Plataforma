object PlataformaERPVCLUsuarioLista: TPlataformaERPVCLUsuarioLista
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de usu'#225'rios'
  ClientHeight = 549
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mnuFormulario
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    794
    549)
  PixelsPerInch = 96
  TextHeight = 13
  object imgBackground: TImage
    Left = 0
    Top = 472
    Width = 105
    Height = 105
    Center = True
    Stretch = True
  end
  object imgFormulario: TImage
    Left = 8
    Top = 16
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF4000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000002
      7A4944415478DAED96CF6B135110C7E76DD6422A5188DA3F40C1424C524D3DB6
      820711241E02DAEE2A88A8D08B0725D4DD821072EA6E3445F022B909D1A444C1
      4BD583070B7AF25792DAA8A84855F4202D0A5A4BF7C773A2E0CF8D7D2FBE1810
      DF61591E336F3EFB9D7D3343A0CD8BFC8973F70133B0E0CC5B3367D30B7F0D60
      C360669D8FB83ABA26D07BD5E74D0A4FF091B79D8FD95A29FDBE65003D4A26E1
      12F71C01E2F7B6A04F1D17764E8FEB0F84034406CD7E22C1357CEDF89D1DA574
      C6B197C56A17927302012889AA6619CDA34CD614C6A68A5A5218405831374B04
      6EB1AA850873DDF6DAAE5269C01102D0A31A4314C81976000009607DB9A03D16
      0210558DFA5F3FCA034008E9AB9C3F76B36D009886FE6A41BFF11F4008405835
      0E4B404EF3842794862B457D5A9402DBD1F42A47FC45F049C16A7EF8831080D0
      EE54872CFB5FA37990293CA597AA453DC1A414EB2771A46111E58FB1C8CF0500
      A9941479D49923040E36FC70A08E44E9FE4A7124CF7A2C673BC69EA098EFB0CA
      041A185CA916B41D3C2772CF0311D57C8B4E2BBD158089A98216FF37017AE3A9
      4E2BE0AFB7D874BDD27B1A51987509ECBB5FD02E0B0308EDCA0665D9C26E0847
      B0C174B11C8A434959029A955704C7EFE486ACA6007AD593AB2D6A1FC7C08730
      F0721E59BF4379816DDC08BE9ACF4D4EA66D6680B0626CC3A038FBC19AE602FF
      02721B7CBE01AC8CCF960488EE31E398CB8BB0C4ECC7CF002F4196B6FC0CF103
      C017D99D875FC76DC10BD3791D6FC9D6860078C5867123D38AE0DF28DC58B538
      72CF1320AA181378C3B82A591304499C13C61A2970173736B516004E61B93EEA
      09B071EF8990436D3FFF99ECCBB1C89B5A497FEE09D08ED576804FE269EA21A1
      1C13F20000000049454E44AE426082}
  end
  object btnFechar: TBitBtn
    Left = 705
    Top = 500
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
    TabOrder = 2
    OnClick = btnFecharClick
    ExplicitTop = 520
  end
  object panFormulario: TPanel
    AlignWithMargins = True
    Left = 48
    Top = 16
    Width = 730
    Height = 469
    Margins.Left = 48
    Margins.Top = 16
    Margins.Right = 16
    Margins.Bottom = 64
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitHeight = 489
    DesignSize = (
      726
      465)
    object lblListaQtde: TLabel
      Left = 16
      Top = 464
      Width = 142
      Height = 13
      Caption = 'Foram localizados 9 registros!'
    end
    object lblListaFiltros: TLabel
      Left = 581
      Top = 464
      Width = 80
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Filtros aplicados!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitLeft = 617
    end
    object lvwLista: TListView
      AlignWithMargins = True
      Left = 8
      Top = 33
      Width = 710
      Height = 402
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 30
      Align = alClient
      Columns = <
        item
          Width = 0
        end
        item
          Caption = 'Licenca ID'
          Width = 0
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
          Alignment = taRightJustify
          Caption = 'ID'
          Width = 0
        end
        item
          Alignment = taCenter
          Caption = 'C'#243'digo'
          Width = 125
        end
        item
          Caption = 'Nome'
          Width = 400
        end
        item
          Alignment = taCenter
          Caption = 'Bloqueado'
          Tag = 100
          Width = 90
        end
        item
          Alignment = taCenter
          Caption = 'Ativo'
          Tag = 100
          Width = 60
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ExplicitHeight = 422
    end
    object pbaProgresso: TProgressBar
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 710
      Height = 17
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      TabOrder = 1
      Visible = False
    end
  end
  object btnAtualizar: TBitBtn
    Left = 385
    Top = 500
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Atualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAtualizarClick
    ExplicitTop = 520
  end
  object btnMinimizar: TBitBtn
    Left = 625
    Top = 500
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
    ExplicitTop = 520
  end
  object btnSelecionar: TBitBtn
    Left = 545
    Top = 500
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
    TabOrder = 4
    OnClick = btnSelecionarClick
    ExplicitTop = 520
  end
  object btnNovo: TBitBtn
    Left = 465
    Top = 500
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnNovoClick
    ExplicitTop = 520
  end
  object btnLocalizar: TBitBtn
    Left = 305
    Top = 500
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Localizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnLocalizarClick
    ExplicitTop = 520
  end
  object mnuFormulario: TMainMenu
    Left = 300
    Top = 184
    object mniCadastro: TMenuItem
      Caption = 'Cadastro'
      object mniCadastroTipoUsuario: TMenuItem
        Caption = 'Cadastro de tipos de usu'#225'rio'
        OnClick = mniCadastroTipoUsuarioClick
      end
    end
  end
end
