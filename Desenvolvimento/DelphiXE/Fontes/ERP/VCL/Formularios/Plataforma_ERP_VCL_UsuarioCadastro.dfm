object PlataformaERPVCLUsuarioCadastro: TPlataformaERPVCLUsuarioCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Usu'#225'rio'
  ClientHeight = 406
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
  object imgBackground: TImage
    Left = 0
    Top = 305
    Width = 105
    Height = 105
    Center = True
    Stretch = True
  end
  object btnGravar: TBitBtn
    Left = 328
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object btnAlterar: TBitBtn
    Left = 328
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnAlterarClick
  end
  object pagFormulario: TPageControl
    Left = 48
    Top = 16
    Width = 514
    Height = 329
    Cursor = crHandPoint
    Margins.Left = 48
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 48
    ActivePage = tabAuditoria
    TabOrder = 0
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ExplicitHeight = 221
      object lblCodigo: TLabel
        Left = 16
        Top = 16
        Width = 41
        Height = 14
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNome: TLabel
        Left = 16
        Top = 72
        Width = 36
        Height = 14
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCodigoCadastrado: TLabel
        Left = 344
        Top = 16
        Width = 141
        Height = 14
        Caption = #218'ltimo c'#243'digo cadastrado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTipoUsuario: TLabel
        Left = 16
        Top = 128
        Width = 28
        Height = 14
        Caption = 'Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 32
        Width = 89
        Height = 26
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 0
        Text = '999.999'
        OnEnter = edtCodigoEnter
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
        OnKeyPress = edtCodigoKeyPress
      end
      object edtNome: TEdit
        Left = 16
        Top = 88
        Width = 473
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 1
        Text = 'Xxxxxxxxxx Wwwwwwwwww'
        OnEnter = edtNomeEnter
        OnExit = edtNomeExit
        OnKeyDown = edtNomeKeyDown
        OnKeyPress = edtNomeKeyPress
      end
      object chkBloqueado: TCheckBox
        Left = 16
        Top = 192
        Width = 73
        Height = 17
        Cursor = crHandPoint
        Caption = 'Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnEnter = chkBloqueadoEnter
        OnExit = chkBloqueadoExit
        OnKeyPress = chkBloqueadoKeyPress
      end
      object chkAtivo: TCheckBox
        Left = 16
        Top = 216
        Width = 49
        Height = 17
        Cursor = crHandPoint
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnEnter = chkAtivoEnter
        OnExit = chkAtivoExit
        OnKeyPress = chkAtivoKeyPress
      end
      object edtCodigoCadastrado: TEdit
        Left = 344
        Top = 32
        Width = 145
        Height = 26
        TabStop = False
        Alignment = taCenter
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '999.999'
        OnEnter = edtCodigoEnter
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
        OnKeyPress = edtCodigoKeyPress
      end
      object edtTipoUsuarioCodigo: TEdit
        Left = 16
        Top = 144
        Width = 89
        Height = 26
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 5
        Text = '999.999'
        OnEnter = edtCodigoEnter
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
        OnKeyPress = edtCodigoKeyPress
      end
      object edtTipoUsuarioDescricao: TEdit
        Left = 112
        Top = 144
        Width = 377
        Height = 26
        Cursor = crHandPoint
        Hint = 'Clique para exibir o cadastro da licen'#231'a!'
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 6
        Text = 'Xxxxxxxxxx Dddddddddd Ssssssssss'
        OnClick = edtLicencaDescricaoClick
      end
      object edtTipoUsuarioID: TEdit
        Left = 392
        Top = 144
        Width = 65
        Height = 26
        TabStop = False
        Alignment = taRightJustify
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = '999.999'
        Visible = False
      end
    end
    object tabAuditoria: TTabSheet
      Caption = 'Auditoria'
      ImageIndex = 1
      ExplicitHeight = 221
      object lblInsDtHt: TLabel
        Left = 16
        Top = 128
        Width = 42
        Height = 14
        Caption = 'Cria'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUpdDtHr: TLabel
        Left = 216
        Top = 128
        Width = 90
        Height = 14
        Caption = #218'ltima altera'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUpdContador: TLabel
        Left = 416
        Top = 128
        Width = 61
        Height = 14
        Caption = 'Altera'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUsuarioID: TLabel
        Left = 416
        Top = 72
        Width = 16
        Height = 14
        Caption = 'ID:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblBase: TLabel
        Left = 16
        Top = 72
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
      object lblLicenca: TLabel
        Left = 16
        Top = 16
        Width = 44
        Height = 14
        Caption = 'Licen'#231'a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtInsLocalDtHr: TEdit
        Left = 16
        Top = 144
        Width = 185
        Height = 26
        Hint = 'Clique para exibir informa'#231#245'es sobre a data de cria'#231#227'o!'
        TabStop = False
        Alignment = taCenter
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtInsLocalDtHrClick
      end
      object edtUpdLocalDtHr: TEdit
        Left = 216
        Top = 144
        Width = 185
        Height = 26
        Hint = 'Clique para exibir informa'#231#245'es sobre a data da '#250'ltima altera'#231#227'o!'
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
        TabOrder = 6
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtUpdLocalDtHrClick
      end
      object edtUpdContador: TEdit
        Left = 416
        Top = 144
        Width = 73
        Height = 26
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
        TabOrder = 7
        Text = '999.999'
      end
      object btnLog: TButton
        Left = 16
        Top = 208
        Width = 113
        Height = 33
        Cursor = crHandPoint
        Caption = 'Log altera'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = btnLogClick
      end
      object edtUsuarioID: TEdit
        Left = 416
        Top = 88
        Width = 73
        Height = 26
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
        TabOrder = 4
        Text = '9.999'
      end
      object edtBaseDescricao: TEdit
        Left = 16
        Top = 88
        Width = 385
        Height = 26
        Cursor = crHandPoint
        Hint = 'Clique para exibir o cadastro da base de dados!'
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        Text = 'Xxxxxxxxxx Dddddddddd Ssssssssss'
        OnClick = edtBaseDescricaoClick
      end
      object edtBaseID: TEdit
        Left = 280
        Top = 88
        Width = 65
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
        TabOrder = 3
        Text = '999.999'
        Visible = False
      end
      object edtLicencaDescricao: TEdit
        Left = 16
        Top = 32
        Width = 473
        Height = 26
        Cursor = crHandPoint
        Hint = 'Clique para exibir o cadastro da licen'#231'a!'
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Text = 'Xxxxxxxxxx Dddddddddd Ssssssssss'
        OnClick = edtLicencaDescricaoClick
      end
      object edtLicencaID: TEdit
        Left = 360
        Top = 32
        Width = 65
        Height = 26
        TabStop = False
        Alignment = taRightJustify
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '999.999'
        Visible = False
      end
    end
  end
  object btnExcluir: TBitBtn
    Left = 248
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object btnMinimizar: TBitBtn
    Left = 408
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Minimizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnMinimizarClick
  end
  object btnFechar: TBitBtn
    Left = 488
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 7
    OnClick = btnFecharClick
  end
  object btnCancelar: TBitBtn
    Left = 488
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object btnNovo: TBitBtn
    Left = 168
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnNovoClick
  end
  object btnAtualizar: TBitBtn
    Left = 48
    Top = 360
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Atualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnAtualizarClick
  end
end
