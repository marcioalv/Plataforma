object PlataformaERPPrincipalVCLAcessoConexaoConfiguracao: TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Plataforma ERP - Configura'#231#245'es de conex'#245'es de acesso'
  ClientHeight = 457
  ClientWidth = 939
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
  object btnConfirmar: TButton
    Left = 776
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Confirmar'
    TabOrder = 6
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton
    Left = 856
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Cancelar'
    TabOrder = 7
    OnClick = btnCancelarClick
  end
  object btnGravar: TButton
    Left = 776
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Gravar'
    TabOrder = 8
    OnClick = btnGravarClick
  end
  object btnAtualizar: TButton
    Left = 616
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Atualizar'
    TabOrder = 0
    OnClick = btnAtualizarClick
  end
  object btnSair: TButton
    Left = 856
    Top = 416
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
    TabOrder = 1
    OnClick = btnSairClick
  end
  object btnNovo: TButton
    Left = 8
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Novo'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnEditar: TButton
    Left = 88
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Editar'
    TabOrder = 3
    OnClick = bt
  end
  object btnRemover: TButton
    Left = 168
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Remover'
    TabOrder = 4
    OnClick = btnRemoverClick
  end
  object btnTestar: TButton
    Left = 696
    Top = 416
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Testar'
    TabOrder = 5
    TabStop = False
    OnClick = btnTestarClick
  end
  object panFormulario: TPanel
    Left = 8
    Top = 8
    Width = 921
    Height = 401
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 9
    object lblQtdeLinhas: TLabel
      Left = 10
      Top = 376
      Width = 132
      Height = 13
      Caption = 'Quantidade de linhas: 9999'
    end
    object lblitem: TLabel
      Left = 432
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Item:'
    end
    object lblTitulo: TLabel
      Left = 480
      Top = 8
      Width = 30
      Height = 13
      Caption = 'T'#237'tulo:'
    end
    object lblServidor: TLabel
      Left = 432
      Top = 200
      Width = 44
      Height = 13
      Caption = 'Servidor:'
    end
    object lblPorta: TLabel
      Left = 856
      Top = 200
      Width = 30
      Height = 13
      Caption = 'Porta:'
    end
    object lblInstancia: TLabel
      Left = 432
      Top = 248
      Width = 48
      Height = 13
      Caption = 'Inst'#226'ncia:'
    end
    object lblUsuario: TLabel
      Left = 432
      Top = 296
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object lblSenha: TLabel
      Left = 680
      Top = 296
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object lblBancoDados: TLabel
      Left = 432
      Top = 344
      Width = 65
      Height = 13
      Caption = 'Banco dados:'
    end
    object lblTimeOut: TLabel
      Left = 800
      Top = 344
      Width = 103
      Height = 13
      Caption = 'Time-out (segundos):'
    end
    object lblSGBD: TLabel
      Left = 432
      Top = 152
      Width = 30
      Height = 13
      Caption = 'SGBD:'
    end
    object sbtListaSubirTodos: TSpeedButton
      Left = 392
      Top = 40
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        66030000424D6603000000000000360000002800000010000000110000000100
        1800000000003003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF767676777777E7E7E7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7767676777777FFFFFFFFFFFF767676
        5A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77676
        765A5A5A777777FFFFFFFFFFFFE7E7E77676765A5A5A777777E7E7E7FFFFFFFF
        FFFFFFFFFFFFFFFFE7E7E77676765A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFF
        E7E7E77676765A5A5A777777E7E7E7FFFFFFFFFFFFE7E7E77676765A5A5A7777
        77E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77676765A5A5A777777E7
        E7E7E7E7E77676765A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE7E7E77676765A5A5A5A5A5A5A5A5A5A5A5A777777E7E7E7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77676765A
        5A5A5A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF767676
        777777E7E7E7FFFFFFFFFFFFE7E7E7767676767676E7E7E7FFFFFFFFFFFFE7E7
        E7767676777777FFFFFFFFFFFF7676765A5A5A777777E7E7E7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE7E7E77676765A5A5A777777FFFFFFFFFFFFE7E7E7
        7676765A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFE7E7E77676765A5A
        5A777777E7E7E7FFFFFFFFFFFFFFFFFFE7E7E77676765A5A5A777777E7E7E7FF
        FFFFFFFFFFE7E7E77676765A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE7E7E77676765A5A5A777777E7E7E7E7E7E77676765A5A5A777777E7E7
        E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77676765A5A5A5A
        5A5A5A5A5A5A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE7E7E77676765A5A5A5A5A5A777777E7E7E7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E776
        7676767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      OnClick = sbtListaSubirTodosClick
    end
    object sbtListaSubir: TSpeedButton
      Left = 392
      Top = 72
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76
        7676777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A
        5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A
        5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF767676777777E7E7E7FFFFFFFFFFFFFFFFFF5A
        5A5A5A5A5AFFFFFFFFFFFFFFFFFFE7E7E7767676777777FFFFFFFFFFFF767676
        5A5A5A777777E7E7E7FFFFFFFFFFFF5A5A5A5A5A5AFFFFFFFFFFFFE7E7E77676
        765A5A5A777777FFFFFFFFFFFFE7E7E77676765A5A5A777777E7E7E7FFFFFF5A
        5A5A5A5A5AFFFFFFE7E7E77676765A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFF
        E7E7E77676765A5A5A777777E7E7E75A5A5A5A5A5AE7E7E77676765A5A5A7777
        77E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77676765A5A5A7777775A
        5A5A5A5A5A7676765A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE7E7E77676765A5A5A5A5A5A5A5A5A5A5A5A777777E7E7E7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77676765A
        5A5A5A5A5A777777E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E7E7767676767676E7E7E7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = sbtListaSubirClick
    end
    object sbtListaDescer: TSpeedButton
      Left = 392
      Top = 104
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E776
        7676767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A5A5A5A767676E7E7E7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A5A
        5A5A5A5A5A5A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE7E7E77777775A5A5A7676765A5A5A5A5A5A7777775A5A5A767676E7E7
        E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A767676E7E7E75A
        5A5A5A5A5AE7E7E77777775A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFE7E7E7
        7777775A5A5A767676E7E7E7FFFFFF5A5A5A5A5A5AFFFFFFE7E7E77777775A5A
        5A767676E7E7E7FFFFFFFFFFFF7777775A5A5A767676E7E7E7FFFFFFFFFFFF5A
        5A5A5A5A5AFFFFFFFFFFFFE7E7E77777775A5A5A767676FFFFFFFFFFFF777777
        767676E7E7E7FFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFFFFFFFFFFFFFFE7E7
        E7777777767676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A
        5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A
        5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A
        5A5A5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777767676FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = sbtListaDescerClick
    end
    object sbtListaDescerTodos: TSpeedButton
      Left = 392
      Top = 144
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        66030000424D6603000000000000360000002800000010000000110000000100
        1800000000003003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E776
        7676767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A5A5A5A767676E7E7E7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A5A
        5A5A5A5A5A5A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE7E7E77777775A5A5A767676E7E7E7E7E7E77777775A5A5A767676E7E7
        E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A767676E7E7E7FF
        FFFFFFFFFFE7E7E77777775A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFE7E7E7
        7777775A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A5A
        5A767676E7E7E7FFFFFFFFFFFF7777775A5A5A767676E7E7E7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A767676FFFFFFFFFFFF777777
        767676E7E7E7FFFFFFFFFFFFE7E7E7767676767676E7E7E7FFFFFFFFFFFFE7E7
        E7777777767676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A
        5A5A5A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE7E7E77777775A5A5A5A5A5A5A5A5A5A5A5A767676E7E7E7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A767676E7
        E7E7E7E7E77777775A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E7E7E77777775A5A5A767676E7E7E7FFFFFFFFFFFFE7E7E77777775A5A5A7676
        76E7E7E7FFFFFFFFFFFFFFFFFFE7E7E77777775A5A5A767676E7E7E7FFFFFFFF
        FFFFFFFFFFFFFFFFE7E7E77777775A5A5A767676E7E7E7FFFFFFFFFFFF777777
        5A5A5A767676E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E77777
        775A5A5A767676FFFFFFFFFFFF777777767676E7E7E7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7777777767676FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      OnClick = sbtListaDescerTodosClick
    end
    object sbtListaLocalizar: TSpeedButton
      Left = 392
      Top = 8
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        AA030000424DAA03000000000000360000002800000011000000110000000100
        1800000000007403000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAECCCCCCFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFAEAEAE5A5A5AADADADFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE5A5A5A
        ADADADFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9DADADADA
        DADAF1F1F1FFFFFFFFFFFFAEAEAE5A5A5AADADADFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFFFFFFFE2E2E29F9F9F5A5A5A5A5A5A5A5A5A5A5A5AAEAEAECCCCCC5A
        5A5AADADADFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFE2E2E28989895A5A
        5AADADADC4C4C4BDBDBD9F9F9F5A5A5A5A5A5ACCCCCCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFF9797975A5A5AD3D3D3FFFFFFFFFFFFFFFFFFFFFF
        FFBCBCBC5A5A5AAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFE2E2E2
        5A5A5AAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F5A5A5AF1F1
        F1FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFBCBCBC5A5A5ADADADAFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBCBCBC5A5A5ADADADAFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFBCBCBC5A5A5ADADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C4C4C45A5A5ADADADAFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD3D3D35A5A5ABC
        BCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE5A5A5AE9E9E9FFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF8F8F8F5A5A5AE2E2E2FFFFFFFFFFFFFF
        FFFFFFFFFFD3D3D35A5A5A9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFDADADA8181815A5A5ABCBCBCDADADADADADAAEAEAE5A5A5A888888E2
        E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFDADADA9090
        905A5A5A5A5A5A5A5A5A5A5A5A979797E2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3BDBDBDBDBDBDE2E2
        E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00}
      OnClick = sbtListaLocalizarClick
    end
    object Label1: TLabel
      Left = 432
      Top = 56
      Width = 66
      Height = 13
      Caption = 'Modo acesso:'
    end
    object lblCodigo: TLabel
      Left = 432
      Top = 104
      Width = 105
      Height = 13
      Caption = 'C'#243'digo chave acesso:'
    end
    object lblID: TLabel
      Left = 632
      Top = 104
      Width = 133
      Height = 13
      Caption = 'Identificador chave acesso:'
    end
    object Label2: TLabel
      Left = 784
      Top = 104
      Width = 123
      Height = 13
      Caption = 'Identificador base dados:'
    end
    object lblDriver: TLabel
      Left = 640
      Top = 152
      Width = 33
      Height = 13
      Caption = 'Driver:'
    end
    object lvwLista: TListView
      Left = 8
      Top = 8
      Width = 377
      Height = 361
      Cursor = crHandPoint
      Columns = <
        item
          Width = 0
        end
        item
          Alignment = taRightJustify
          Caption = 'Item'
          Tag = 1
          Width = 35
        end
        item
          Caption = 'T'#237'tulo'
          Width = 300
        end
        item
          Caption = 'Modo'
          Width = 0
        end
        item
          Caption = 'C'#243'digo Chave'
          Width = 0
        end
        item
          Caption = 'ID Chave'
          Width = 0
        end
        item
          Caption = 'ID Base'
          Width = 0
        end
        item
          Caption = 'SGBD'
          Width = 0
        end
        item
          Caption = 'Driver'
          Width = 0
        end
        item
          Caption = 'Servidor'
          Width = 0
        end
        item
          Caption = 'Porta'
          Width = 0
        end
        item
          Caption = 'Inst'#226'ncia'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio'
          Width = 0
        end
        item
          Caption = 'Senha'
          Width = 0
        end
        item
          Caption = 'Banco de dados'
          Width = 0
        end
        item
          Caption = 'Time-out'
          Width = 0
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnChange = lvwListaChange
      OnCustomDrawItem = lvwListaCustomDrawItem
      OnCustomDrawSubItem = lvwListaCustomDrawSubItem
    end
    object edtItem: TEdit
      Left = 432
      Top = 24
      Width = 41
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = '9.999'
    end
    object edtTitulo: TEdit
      Left = 480
      Top = 24
      Width = 425
      Height = 21
      MaxLength = 50
      TabOrder = 2
      Text = 'Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx'
      OnEnter = edtTituloEnter
      OnExit = edtTituloExit
      OnKeyPress = edtTituloKeyPress
    end
    object edtServidor: TEdit
      Left = 432
      Top = 216
      Width = 417
      Height = 21
      MaxLength = 50
      TabOrder = 12
      Text = 'Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx'
      OnEnter = edtServidorEnter
      OnExit = edtServidorExit
      OnKeyPress = edtServidorKeyPress
    end
    object edtPorta: TEdit
      Left = 856
      Top = 216
      Width = 49
      Height = 21
      Alignment = taRightJustify
      MaxLength = 7
      TabOrder = 13
      Text = '999.999'
      OnEnter = edtPortaEnter
      OnExit = edtPortaExit
      OnKeyPress = edtPortaKeyPress
    end
    object edtInstancia: TEdit
      Left = 432
      Top = 264
      Width = 473
      Height = 21
      MaxLength = 50
      TabOrder = 14
      Text = 'Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx'
      OnEnter = edtInstanciaEnter
      OnExit = edtInstanciaExit
      OnKeyPress = edtInstanciaKeyPress
    end
    object edtUsuario: TEdit
      Left = 432
      Top = 312
      Width = 241
      Height = 21
      MaxLength = 30
      TabOrder = 15
      Text = 'Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx '
      OnEnter = edtUsuarioEnter
      OnExit = edtUsuarioExit
      OnKeyPress = edtUsuarioKeyPress
    end
    object edtSenha: TEdit
      Left = 680
      Top = 312
      Width = 225
      Height = 21
      MaxLength = 30
      PasswordChar = '*'
      TabOrder = 16
      Text = 'Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx'
      OnEnter = edtSenhaEnter
      OnExit = edtSenhaExit
      OnKeyPress = edtSenhaKeyPress
    end
    object edtBancoDados: TEdit
      Left = 432
      Top = 360
      Width = 361
      Height = 21
      MaxLength = 50
      TabOrder = 17
      Text = 'Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx'
      OnEnter = edtBancoDadosEnter
      OnExit = edtBancoDadosExit
      OnKeyPress = edtBancoDadosKeyPress
    end
    object edtTimeOut: TEdit
      Left = 800
      Top = 360
      Width = 105
      Height = 21
      Alignment = taRightJustify
      MaxLength = 7
      TabOrder = 18
      Text = '999.999'
      OnEnter = edtTimeOutEnter
      OnExit = edtTimeOutExit
      OnKeyPress = edtTimeOutKeyPress
    end
    object cbxSGBD: TComboBox
      Left = 432
      Top = 168
      Width = 201
      Height = 21
      MaxLength = 30
      TabOrder = 10
      OnChange = cbxSGBDChange
      OnEnter = cbxSGBDEnter
      OnExit = cbxSGBDExit
      OnKeyPress = cbxSGBDKeyPress
    end
    object cbxModo: TComboBox
      Left = 432
      Top = 72
      Width = 473
      Height = 21
      MaxLength = 30
      TabOrder = 3
      OnEnter = cbxModoEnter
      OnExit = cbxModoExit
      OnKeyPress = cbxModoKeyPress
    end
    object edtCodigo1: TEdit
      Left = 432
      Top = 120
      Width = 41
      Height = 21
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 4
      Text = '9999'
      OnEnter = edtCodigo1Enter
      OnExit = edtCodigo1Exit
      OnKeyPress = edtCodigo1KeyPress
    end
    object edtCodigo2: TEdit
      Left = 480
      Top = 120
      Width = 41
      Height = 21
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 5
      Text = '9999'
      OnEnter = edtCodigo2Enter
      OnExit = edtCodigo2Exit
      OnKeyPress = edtCodigo2KeyPress
    end
    object edtCodigo3: TEdit
      Left = 528
      Top = 120
      Width = 41
      Height = 21
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 6
      Text = '9999'
      OnEnter = edtCodigo3Enter
      OnExit = edtCodigo3Exit
      OnKeyPress = edtCodigo3KeyPress
    end
    object edtCodigo4: TEdit
      Left = 576
      Top = 120
      Width = 41
      Height = 21
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 7
      Text = '9999'
      OnEnter = edtCodigo4Enter
      OnExit = edtCodigo4Exit
      OnKeyPress = edtCodigo4KeyPress
    end
    object edtChaveID: TEdit
      Left = 632
      Top = 120
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 8
      Text = '9999'
      OnEnter = edtChaveIDEnter
      OnExit = edtChaveIDExit
      OnKeyPress = edtChaveIDKeyPress
    end
    object edtBaseID: TEdit
      Left = 784
      Top = 120
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 9
      Text = '9999'
      OnEnter = edtBaseIDEnter
      OnExit = edtBaseIDExit
      OnKeyPress = edtBaseIDKeyPress
    end
    object edtDriver: TEdit
      Left = 640
      Top = 168
      Width = 265
      Height = 21
      MaxLength = 50
      TabOrder = 11
      Text = 'Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx Xxxxxxxxxx'
      OnEnter = edtDriverEnter
      OnExit = edtDriverExit
      OnKeyPress = edtDriverKeyPress
    end
  end
end
