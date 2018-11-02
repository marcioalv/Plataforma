object PlataformaERPVCLFilialCadastro: TPlataformaERPVCLFilialCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filial'
  ClientHeight = 462
  ClientWidth = 578
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
      994944415478DAED974D48545114C7EF79F39C3E149A2449108C601632A41545
      B528265A889BA085924E422E840AB282C2F950B4E9438D826A16D1D24DF6625A
      1581B433A64D14D88C0C15811812DAC20864A469E69EFE23F8DE9B4A7B0E8ECF
      A0BB98E1DC77CEFFFCEEB967EE7D43C2E64185067A9A06AA1DAAB80489A96C26
      154946C3B3AB02B0A3F9FA56223584C0D3309DB93966FE2288FAE6BEAEBFFF71
      F8FCF7A200EC3C79DB25D3E94E0474C02C5BC4ED130B71B5FC736A7064249C59
      11004F536F99EAD8D001E14E2272591185EF0792A2275E938A8A7058160480C4
      4ED5517A4A900CC1AD723965D541984715C1DD6FB5E033CB005E6FAF3A5355DA
      2AA4BC8C156F2B24F11F405E0A854389A1E08B2500986A7D371B49F215CCD6AC
      44E2DF40043F67A6AE31CDFF3A0FC0DD7077DDC6CD7331987B8B91F8D77A8024
      12D702177480DC6F5A5569A2F8C9F55224E29ABF6E51805CF390A0AC6E1357C2
      AE323D1F873D93A749A21A6215A685BE87FCAC9193CBD153DB2D019464D8F526
      1AF8B660D7B50C04E0DAAF8B497922F128386406A86DBE718F489C31211D8A3F
      0CC4F4E7C7FB7DA4280FFE03580228FAF81700EEA08BCDB7DA01DC765E3D9EC5
      53129CCCD324AA87D86E638273E59E347292075B74D41280ED3D603B000E9A36
      A128A9059B988FE1CB67945344B025313300A8DA7138D59B267A989477A62D39
      8864E7ACF64071C79A07C02BCC6122A99FE3249536789E35E2B91BFB326CD624
      56D027A2D134D10EBF51232935608BAE5902B0BD096D0740C70EE2336D949C76
      417CDF32019E2070CAD8017223D9116B007FEB214B004B09AC35803D2DB7B6FC
      E0EC342C6535007097BC4A68FEFD3AC07C155AFBDC0E499BAC0864D3CEF1E4E3
      8B79AF64F3FF154BB8C24A3C163039A6754DE701D8356C07F8094D91EA303315
      50CE0000000049454E44AE426082}
  end
  object imgBackground: TImage
    Left = 0
    Top = 353
    Width = 105
    Height = 105
    Center = True
    Stretch = True
  end
  object pagFormulario: TPageControl
    Left = 48
    Top = 16
    Width = 514
    Height = 369
    Cursor = crHandPoint
    Margins.Left = 48
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 48
    ActivePage = tabDados
    TabOrder = 0
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
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
        Width = 55
        Height = 14
        Caption = 'Descri'#231#227'o:'
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
      object lblRazaoSocial: TLabel
        Left = 16
        Top = 128
        Width = 67
        Height = 14
        Caption = 'Raz'#227'o social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFantasia: TLabel
        Left = 16
        Top = 184
        Width = 81
        Height = 14
        Caption = 'Nome fantasia:'
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
      object edtDescricao: TEdit
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
        TabOrder = 2
        Text = 'Xxxxxxxxxx Wwwwwwwwww'
        OnEnter = edtDescricaoEnter
        OnExit = edtDescricaoExit
        OnKeyPress = edtDescricaoKeyPress
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
        TabOrder = 1
        Text = '999.999'
        OnClick = edtCodigoCadastradoClick
      end
      object gbxOpcoes: TGroupBox
        Left = 376
        Top = 248
        Width = 113
        Height = 73
        TabOrder = 7
        object chkBloqueado: TCheckBox
          Left = 16
          Top = 16
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
          TabOrder = 0
          OnEnter = chkBloqueadoEnter
          OnExit = chkBloqueadoExit
          OnKeyPress = chkBloqueadoKeyPress
        end
        object chkAtivo: TCheckBox
          Left = 16
          Top = 36
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
          TabOrder = 1
          OnEnter = chkAtivoEnter
          OnExit = chkAtivoExit
          OnKeyPress = chkAtivoKeyPress
        end
      end
      object edtCodigoCadastradoBaseID: TEdit
        Left = 361
        Top = 32
        Width = 49
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
        TabOrder = 5
        Text = 'Base'
        Visible = False
      end
      object edtCodigoCadastradoID: TEdit
        Left = 425
        Top = 32
        Width = 41
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
        TabOrder = 6
        Text = 'ID'
        Visible = False
      end
      object edtRazaoSocial: TEdit
        Left = 16
        Top = 144
        Width = 473
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 3
        Text = 'Xxxxxxxxxx Wwwwwwwwww'
        OnEnter = edtRazaoSocialEnter
        OnExit = edtRazaoSocialExit
        OnKeyPress = edtRazaoSocialKeyPress
      end
      object edtFantasia: TEdit
        Left = 16
        Top = 200
        Width = 473
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 4
        Text = 'Xxxxxxxxxx Wwwwwwwwww'
        OnEnter = edtFantasiaEnter
        OnExit = edtFantasiaExit
        OnKeyPress = edtFantasiaKeyPress
      end
    end
    object tabDados: TTabSheet
      Caption = 'Dados'
      object lblRegimeTributario: TLabel
        Left = 16
        Top = 128
        Width = 97
        Height = 14
        Caption = 'Regime tribut'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object imgRegimeTributarioSelecionar: TImage
        Left = 472
        Top = 148
        Width = 20
        Height = 20
        Cursor = crHandPoint
        AutoSize = True
        Picture.Data = {
          07544269746D6170E6040000424DE60400000000000036000000280000001400
          0000140000000100180000000000B00400000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C9BCB57B45CAAB8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D6C9BCB57B45B3763CB57B45DBD5CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C9BCB57B45B3
          763CB57B45D6C9BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C9BCB57B45B3763CB57B45D6C9
          BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DFDED6CABDD2
          C0AED6CABDE0DFDEFFFFFFD9CEC4B57B45B3763CB57B45D6C9BCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DFDFCBAF93B57E48B3763CB3763CB376
          3CB77E48CCB095CEB7A1B3763CB57B45D6C9BCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0DFDFC19871B3763CBA8656CBAD92D1BAA5CBAD92B98554
          B3763CB47840CFB8A3D9CFC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFCBAF93B3763CC49E7AE1DFDEFFFFFFFFFFFFFFFFFFE1DFDEC39D79B3
          763CCCB095FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DFDE
          B57C46BA8655E0DFDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DFDDB98653B77E
          48E1DFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C9BCB3763CCB
          AE92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAAD91B3763CD6CABD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C0AEB3763CD0BBA6FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BBA6B3763CD3C0AEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7C9BCB3763CCBAF93FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAAD91B3763CD7C9BDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE1DFDEB57C46BA8656E0DFDEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0DFDDB98554B57C46E1DFDEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFCBAD92B3763CC49E7AE0DFDEFFFFFFFFFFFFFFFF
          FFE1DFDEC49E7AB3763CCBAF93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0DFDFC19870B3763CBA8656CBAE92D0BBA7CBAE92BA8656
          B3763CC19871E0DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE0DFDFCBAD92B67D45B3763CB3763CB3763CB57E48CBAE92E0
          DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE0DFDDD6C9BCD2C0AED6C9BCE1DFDEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = imgRegimeTributarioSelecionarClick
      end
      object lblCPF_CNPJ: TLabel
        Left = 16
        Top = 16
        Width = 56
        Height = 14
        Caption = 'CPF/CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblEmpresa: TLabel
        Left = 16
        Top = 72
        Width = 50
        Height = 14
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object imgEmpresaSelecionar: TImage
        Left = 472
        Top = 92
        Width = 20
        Height = 20
        Cursor = crHandPoint
        AutoSize = True
        Picture.Data = {
          07544269746D6170E6040000424DE60400000000000036000000280000001400
          0000140000000100180000000000B00400000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C9BCB57B45CAAB8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D6C9BCB57B45B3763CB57B45DBD5CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C9BCB57B45B3
          763CB57B45D6C9BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C9BCB57B45B3763CB57B45D6C9
          BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DFDED6CABDD2
          C0AED6CABDE0DFDEFFFFFFD9CEC4B57B45B3763CB57B45D6C9BCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DFDFCBAF93B57E48B3763CB3763CB376
          3CB77E48CCB095CEB7A1B3763CB57B45D6C9BCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0DFDFC19871B3763CBA8656CBAD92D1BAA5CBAD92B98554
          B3763CB47840CFB8A3D9CFC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFCBAF93B3763CC49E7AE1DFDEFFFFFFFFFFFFFFFFFFE1DFDEC39D79B3
          763CCCB095FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DFDE
          B57C46BA8655E0DFDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DFDDB98653B77E
          48E1DFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C9BCB3763CCB
          AE92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAAD91B3763CD6CABD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C0AEB3763CD0BBA6FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BBA6B3763CD3C0AEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7C9BCB3763CCBAF93FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAAD91B3763CD7C9BDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE1DFDEB57C46BA8656E0DFDEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0DFDDB98554B57C46E1DFDEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFCBAD92B3763CC49E7AE0DFDEFFFFFFFFFFFFFFFF
          FFE1DFDEC49E7AB3763CCBAF93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0DFDFC19870B3763CBA8656CBAE92D0BBA7CBAE92BA8656
          B3763CC19871E0DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE0DFDFCBAD92B67D45B3763CB3763CB3763CB57E48CBAE92E0
          DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE0DFDDD6C9BCD2C0AED6C9BCE1DFDEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = imgEmpresaSelecionarClick
      end
      object edtRegimeTributarioCodigo: TEdit
        Left = 16
        Top = 144
        Width = 113
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
        OnEnter = edtRegimeTributarioCodigoEnter
        OnExit = edtRegimeTributarioCodigoExit
        OnKeyDown = edtRegimeTributarioCodigoKeyDown
        OnKeyPress = edtRegimeTributarioCodigoKeyPress
      end
      object edtRegimeTributarioDescricao: TEdit
        Left = 136
        Top = 144
        Width = 329
        Height = 26
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
        ShowHint = False
        TabOrder = 6
        Text = 'Xxxxxxxxxx Dddddddddd Ssssssssss'
        OnClick = edtRegimeTributarioDescricaoClick
      end
      object edtRegimeTributarioID: TEdit
        Left = 360
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
      object edtRegimeTributarioBaseID: TEdit
        Left = 264
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
        TabOrder = 8
        Text = '999.999'
        Visible = False
      end
      object edtCPF_CNPJ: TEdit
        Left = 16
        Top = 32
        Width = 161
        Height = 26
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 0
        Text = '99.999.9999/9999-99'
        OnEnter = edtCPF_CNPJEnter
        OnExit = edtCPF_CNPJExit
        OnKeyPress = edtCPF_CNPJKeyPress
      end
      object edtEmpresaCodigo: TEdit
        Left = 16
        Top = 88
        Width = 113
        Height = 26
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 1
        Text = '999.999'
        OnEnter = edtEmpresaCodigoEnter
        OnExit = edtEmpresaCodigoExit
        OnKeyDown = edtEmpresaCodigoKeyDown
        OnKeyPress = edtEmpresaCodigoKeyPress
      end
      object edtEmpresaDescricao: TEdit
        Left = 136
        Top = 88
        Width = 329
        Height = 26
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
        ShowHint = False
        TabOrder = 2
        Text = 'Xxxxxxxxxx Dddddddddd Ssssssssss'
        OnClick = edtEmpresaDescricaoClick
      end
      object edtEmpresaBaseID: TEdit
        Left = 264
        Top = 88
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
        TabOrder = 3
        Text = '999.999'
        Visible = False
      end
      object edtEmpresaID: TEdit
        Left = 360
        Top = 88
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
        TabOrder = 4
        Text = '999.999'
        Visible = False
      end
    end
    object tabAuditoria: TTabSheet
      Caption = 'Auditoria'
      ImageIndex = 1
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
      object lblFilialID: TLabel
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
      object lblFilialBase: TLabel
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
        ShowHint = False
        TabOrder = 5
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtInsLocalDtHrClick
      end
      object edtUpdLocalDtHr: TEdit
        Left = 216
        Top = 144
        Width = 185
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
      object edtFilialID: TEdit
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
      object edtFilialBaseDescricao: TEdit
        Left = 16
        Top = 88
        Width = 385
        Height = 26
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
        ShowHint = False
        TabOrder = 2
        Text = 'Xxxxxxxxxx Dddddddddd Ssssssssss'
        OnClick = edtFilialBaseDescricaoClick
      end
      object edtFilialBaseID: TEdit
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
        ShowHint = False
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
      object btnLog: TBitBtn
        Left = 16
        Top = 208
        Width = 169
        Height = 45
        Cursor = crHandPoint
        Caption = 'Log altera'#231#245'es'
        Glyph.Data = {
          3A080000424D3A080000000000003600000028000000190000001B0000000100
          1800000000000408000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFABABAB898989FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7B7B7B7A2
          A2A2B7B7B7DEDEDEFFFFFFFFFFFFFFFFFFABABAB131313ABABABFFFFFF00FFFF
          FFCBCBCB96969696969696969696969696969696969696969696969696969695
          95955656561010102C2C2C4141412929291212126B6B6BD6D6D6AAAAAA131313
          ABABABFFFFFFFFFFFF00FFFFFF6C6C6C2828284B4B4B4B4B4B4B4B4B4B4B4B4B
          4B4B4B4B4B4B4B4B1C1C1C0A0A0A7A7A7AD5D5D5FFFFFFFFFFFFFFFFFFC7C7C7
          5A5A5A1F1F1F131313AAAAAAFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABA171717B5B5B5FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A202020D6D6D6FFFFFFFFFFFFFFFF
          FF00FFFFFF6A6A6A777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0292929
          949494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5858
          586A6A6AFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFADADAD222222CDCDCD1F1F1F1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E404040FFFFFFFFFFFFC7C7C7121212DEDEDEFFFFFFFFFFFF00FFFFFF6A6A6A
          777777FFFFFFFFFFFFD6D6D61E1E1E1E1E1E121212626262A8A8A84B4B4B4B4B
          4B4B4B4B4B4B4B4B4B4B4B4B4B656565FFFFFFFFFFFFFFFFFF292929B6B6B6FF
          FFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFFFFDFDFDFC3C3C3C3C3C35353
          537C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF414141A1A1A1FFFFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF7676766F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FB4B4B4FFFFFFFFFFFF00FFFF
          FF6A6A6A777777FFFFFFFFFFFFD6D6D61E1E1E1E1E1E1212123A3A3ABFBFBF1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E404040FFFFFFFFFFFFD4D4D4101010
          D6D6D6FFFFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFFFFDFDFDFC3C3C3C3
          C3C3C1C1C1181818B8B8B87676765A5A5A5A5A5A5A5A5A5A5A5A5A5A5A727272
          FFFFFFFFFFFF7B7B7B4F4F4FFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E282828D4D4D4FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7141414C5C5C5FFFFFFFFFFFFFFFF
          FF00FFFFFF6A6A6A777777FFFFFFFFFFFFD5D5D50F0F0F0F0F0F0F0F0F0F0F0F
          000000282828B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFDFDFDF949494171717A1A1
          A1FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFFFFE0E0E0
          D2D2D2D2D2D2D2D2D2D2D2D2D2D2D28D8D8D1717173B3B3B6F6F6F7B7B7B5F5F
          5F222222040404868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A
          777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDB
          DB9E9E9E7070706767677E7E7EB6B6B64F4F4F929292FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFFFFD5D5D50F0F0F0F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F979797FFFFFFFFFFFF4F4F4F92
          9292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFF
          FFE0E0E0D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2DC
          DCDCFFFFFFFFFFFF4F4F4F929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FF6A6A6A777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F929292FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFFFFD5D5D50F0F0F0F
          0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F979797FFFFFFFFFFFF
          4F4F4F929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FF
          FFFFFFFFFFE0E0E0D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
          D2D2D2DCDCDCFFFFFFFFFFFF4F4F4F929292FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFF6A6A6A777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F929292FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A777777FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF4F4F4F929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF6A6A6A
          777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F929292FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFF7979790000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000010101A3
          A3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        TabOrder = 8
        OnClick = btnLogClick
      end
    end
  end
  object btnGravar: TBitBtn
    Left = 400
    Top = 400
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C07000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFF8F8F8F3131312D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
      2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
      2D2D2D2D2D2D2D2D373737AEAEAEFFFFFF00FFFFFF0A0A0AA8A8A8B4B4B4A9A9
      A90B0B0BB4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4
      B4B4B4B4B4B4B4B4949494202020B4B4B4B4B4B4868686353535FFFFFF00FFFF
      FF000000FFFFFF9A9A9AD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828D4D4D4A3A3A3
      B9B9B9282828FFFFFF00FFFFFF000000FFFFFF545454D4D4D40D0D0DFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      B9B9B9282828C7C7C7656565B9B9B9282828FFFFFF00FFFFFF000000FFFFFFFF
      FFFFD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFFFFFFFFB9B9B9282828FFFF
      FF00FFFFFF000000FFFFFFFFFFFFD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFF
      FFFFFFFFB9B9B9282828FFFFFF00FFFFFF000000FFFFFFFFFFFFD4D4D40D0D0D
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFB9B9B9282828FFFFFFFFFFFFB9B9B9282828FFFFFF00FFFFFF000000
      FFFFFFFFFFFFD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFFFFFFFFB9B9B928
      2828FFFFFF00FFFFFF000000FFFFFFFFFFFFD4D4D40D0D0DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B928
      2828FFFFFFFFFFFFB9B9B9282828FFFFFF00FFFFFF000000FFFFFFFFFFFFD7D7
      D70A0A0AE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFB8B8B8292929FFFFFFFFFFFFB9B9B9282828FFFFFF00FFFF
      FF000000FFFFFFFFFFFFFFFFFF4343431616161E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E111111707070FFFFFFFFFFFF
      B9B9B9282828FFFFFF00FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFC8C8C8C3
      C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
      CECECEFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00FFFFFF000000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFF
      FF00FFFFFF000000FFFFFFFFFFFFFFFFFFAAAAAA878787878787878787878787
      878787878787878787878787878787878787878787929292DEDEDEFFFFFFFFFF
      FFFFFFFFB9B9B9282828FFFFFF00FFFFFF000000FFFFFFFFFFFFDBDBDB0A0A0A
      5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A
      5A2020209C9C9CFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00FFFFFF000000
      FFFFFFFFFFFFD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFDFDFDF8383837A7A7ACDCDCD4F4F4F929292FFFFFFFFFFFFFFFFFFB9B9B928
      2828FFFFFF00FFFFFF000000FFFFFFFFFFFFD4D4D40D0D0DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C70C0C0C2525259292924F4F4F929292FF
      FFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00FFFFFF000000FFFFFFFFFFFFD4D4
      D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C71A1A1A4F
      4F4F9292924F4F4F929292FFFFFFFFFFFFFFFFFFB7B7B7282828FFFFFF00FFFF
      FF000000FFFFFFFFFFFFD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFC7C7C71A1A1A4F4F4F9292924F4F4F929292FFFFFFFFFFFFD4D4D4
      2F2F2F6B6B6BFFFFFF00FFFFFF000000FFFFFFFFFFFFD4D4D40D0D0DFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C71A1A1A4F4F4F9292924F4F4F
      929292FFFFFFD4D4D42F2F2F616161E0E0E0FFFFFF00FFFFFF000000FFFFFFFF
      FFFFD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE
      0404040000009E9E9E4F4F4F929292D4D4D42F2F2F616161E0E0E0FFFFFFFFFF
      FF00FFFFFF040404D6D6D6FFFFFFD4D4D40D0D0DFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F8484842F2F2F6161
      61E0E0E0FFFFFFFFFFFFFFFFFF00FFFFFF666666040404000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000010101646464E0E0E0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object btnCancelar: TBitBtn
    Left = 512
    Top = 400
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C07000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFC9C9C9AFAFAFA1A1A1B4B4B4CECECEFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFC7C7C76464641E1E1E1919193434344242423030301111112C
      2C2C747474D3D3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC6868681313136E6E6EBDBDBDFFFFFFFF
      FFFFFFFFFFFFFFFFDFDFDFAFAFAF5B5B5B151515878787FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFCECECE3535354C4C4CCF
      CFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF
      2E2E2E565656DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFD8
      D8D83131316D6D6DE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFD9D9D9474747565656FFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFF585858555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D82F2F
      2F858585FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFB4B4B41A1A1AD9D9D9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFBFBFBF151515D4D4D4FFFFFFFFFFFF00FFFFFFFFFFFF
      474747898989FFFFFFFFFFFFFFFFFFDFDFDF404040C5C5C5FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFAAAAAA5A5A5AFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B747474FF
      FFFFFFFFFF00FFFFFFD6D6D60E0E0ED6D6D6FFFFFFFFFFFFFFFFFFFFFFFF8686
      861C1C1CC5C5C5FFFFFFFFFFFFFFFFFFAAAAAA131313AAAAAAFFFFFFFFFFFFFF
      FFFFFFFFFFAFAFAF2C2C2CFFFFFFFFFFFF00FFFFFFA1A1A1404040FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF8686861C1C1CC5C5C5FFFFFFAAAAAA131313AA
      AAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF121212CECECEFFFFFF00FFFF
      FF8787875D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686861C
      1C1C909090131313AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      2F2F2FB3B3B3FFFFFF00FFFFFF7474746F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF636363000000909090FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF414141A1A1A1FFFFFF00FFFFFF818181626262FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA1212126363631C1C1C
      C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333B0B0B0FFFF
      FF00FFFFFF9A9A9A474747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA
      121212AAAAAAFFFFFF8686861C1C1CC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF191919C7C7C7FFFFFF00FFFFFFCECECE101010DDDDDDFFFFFFFFFFFF
      FFFFFFFFFFFFAAAAAA121212AAAAAAFFFFFFFFFFFFFFFFFF8686861C1C1CC5C5
      C5FFFFFFFFFFFFFFFFFFFFFFFFBEBEBE1E1E1EFFFFFFFFFFFF00FFFFFFFFFFFF
      3636369F9F9FFFFFFFFFFFFFFFFFFFDDDDDD171717AAAAAAFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF8686863B3B3BFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F646464FF
      FFFFFFFFFF00FFFFFFFFFFFF9C9C9C2C2C2CE0E0E0FFFFFFFFFFFFFFFFFFDDDD
      DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEFFFFFFFFFFFFFF
      FFFFCFCFCF131313C6C6C6FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF3939397B7B
      7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFE0E0E04E4E4E666666FFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFC9C9C91B1B1B999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6D6D363636DCDCDC
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFB8B8B81A1A1A7C7C7CE0
      E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9
      5555552F2F2FCECECEFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFCACACA3838382B2B2B9F9F9FDDDDDDFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFD6D6D68888881A1A1A565656DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C363636121212
      4747476161616F6F6F5E5E5E3D3D3D0E0E0E464646B5B5B5FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFCECECE9A9A9A818181747474868686A1A1A1D7D7D7FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object btnMinimizar: TBitBtn
    Left = 456
    Top = 400
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Minimizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      AE060000424DAE06000000000000360000002800000017000000170000000100
      1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFD4D4D46262623131312D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
      2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3535357A7A
      7ADEDEDEFFFFFF000000FFFFFF4C4C4C595959B1B1B1B4B4B4B4B4B4B4B4B4B4
      B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4
      B4B4B4ADADAD3838387A7A7AFFFFFF000000FFFFFF080808DBDBDBFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE323232FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFF4E4E4E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1F1F1F747474FFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFD5D5D50B0B0BC3C3C3C3
      C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3ACACAC282828
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFDEDE
      DE1919191E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1A1A1A434343FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFD7D7D7C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
      C3C3C3C3C3C3C3C3C3C3C3C3C3DDDDDDFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF040404DEDEDEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B42D2D2DFFFFFF000000FFFFFF353535
      838383DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB585858636363FFFFFF00
      0000FFFFFFC1C1C1343434040404000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000707074B4B
      4BD5D5D5FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnMinimizarClick
  end
  object btnAlterar: TBitBtn
    Left = 400
    Top = 400
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C07000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFF484848646464A0A0A0D6D6D6FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF2A2A2A0000000000000505
      05515151DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FF6767670000000000006161614B4B4B464646DCDCDCFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFA3A3A3000000616161E0E0E0DDDDDD4B4B4B45
      4545DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD9D9D91313139A
      9A9AFFFFFFFFFFFFDDDDDD4B4B4B454545DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFB8B8B81717179B9B9BFFFFFFFFFFFFDDDDDD4B4B4B454545
      DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFB8B8B81717179B9B9B
      FFFFFFFFFFFFDDDDDD4B4B4B444444DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFB8B8B81717179B9B9BFFFFFFFFFFFFDDDDDD4B4B4B444444DCDC
      DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B71717179B9B9BFFFF
      FFFFFFFFDDDDDD4B4B4B444444DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFB7B7B71717179B9B9BFFFFFFFFFFFFDDDDDD4B4B4B444444DCDCDCFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B71717179B9B9BFFFFFFFF
      FFFFDDDDDD4B4B4B444444DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB7B7B71616169B9B9BFFFFFFFFFFFFDDDDDD4B4B4B434343DCDCDCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B71616169B9B9BFFFFFFFFFFFF
      DDDDDD4B4B4B434343DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      B7B7B71616169B9B9BFFFFFFFFFFFFDDDDDD4B4B4B434343DCDCDCFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B71616169B9B9BFFFFFFFFFFFFDDDD
      DD4B4B4B424242DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7
      B71616169B9B9BFFFFFFFFFFFFDDDDDD4B4B4B424242DCDCDCFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B61616169B9B9BFFFFFFFFFFFFDDDDDD4B
      4B4B424242DCDCDCFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B616
      16169B9B9BFFFFFFFFFFFFDDDDDD4B4B4B565656FFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFB6B6B61616169B9B9BFFFFFFFFFFFFDDDDDDBFBFBF
      A9A9A9DCDCDCFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6151515
      9B9B9BFFFFFFFFFFFF959595030303747474FFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFB6B6B61E1E1EDCDCDC959595030303000000383838FFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9797970303
      03000000000000616161FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFBCBCBC3131310A0A0A494949D4D4D4FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnAlterarClick
  end
  object btnFechar: TBitBtn
    Left = 512
    Top = 400
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      76050000424D7605000000000000360000002800000015000000150000000100
      1800000000004005000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF959595
      C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8B0B0B0FFFFFF00FFFFFF838383
      1B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8121212A8A8A8FFFFFF00FFFFFFFFFFFF
      8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA8A8A8121212A8A8A8FFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFF8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFA9A9A9121212A9A9A9FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFF8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFA9A9A9121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFA9A9A9121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFA9A9
      A9121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383831B1B1BC3C3C3FFFFFFA9A9A91212
      12A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383831B1B1B8D8D8D121212A9A9
      A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060600000008C8C8CFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A81212126060601B1B1BC3C3
      C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8121212A8A8A8FFFFFF8383831B1B
      1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFA9A9A9121212A8A8A8FFFFFFFFFFFFFFFFFF8383
      831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFA9A9A9121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFA9A9A9121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFA9A9A9121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF8383831B1B1BC3C3C3FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      A9A9A9121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF8383831B1B1BC3C3C3FFFFFFFFFFFF00FFFFFFA9A9A9
      121212A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF8383831B1B1BC3C3C3FFFFFF00FFFFFF707070
      A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838383959595FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnFecharClick
  end
  object btnNovo: TBitBtn
    Left = 344
    Top = 400
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      AE060000424DAE06000000000000360000002800000017000000170000000100
      1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFD4D4D46262623131312D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
      2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D3535357A7A
      7ADEDEDEFFFFFF000000FFFFFF4C4C4C595959B1B1B1B4B4B4B4B4B4B4B4B4B4
      B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4
      B4B4B4ADADAD3838387A7A7AFFFFFF000000FFFFFF080808DBDBDBFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE323232FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C81B1B1BFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C7C7C71A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFC7C7C71A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF959595878787878787777777101010878787878787878787A5
      A5A5FFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6565655A5A5A5A5A5A4F4F4F0B0B0B5A5A
      5A5A5A5A5A5A5A808080FFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C7C7C71A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFC7C7C71A1A1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C71A1A1AFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD838383FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9282828FFFFFF00
      0000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9
      B9282828FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9B9B9282828FFFFFF000000FFFFFF040404DEDEDEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B42D2D2DFFFFFF000000FFFFFF353535
      838383DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB585858636363FFFFFF00
      0000FFFFFFC1C1C1343434040404000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000707074B4B
      4BD5D5D5FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnNovoClick
  end
  object mnuFormulario: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 32
    Top = 400
    object mniAdicional: TMenuItem
      Caption = 'Adicional'
      object mniLog: TMenuItem
        Caption = 'Log altera'#231#245'es'
        OnClick = mniLogClick
      end
      object mniCadastroRegimeTributario: TMenuItem
        Caption = 'Regimes tribut'#225'rios'
      end
    end
    object mniAtualizar: TMenuItem
      Caption = 'Atualizar'
      OnClick = mniAtualizarClick
    end
    object mniNovo: TMenuItem
      Caption = 'Novo'
      OnClick = mniNovoClick
    end
    object mniAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mniAlterarClick
    end
    object mniExcluir: TMenuItem
      Caption = 'Excluir'
      OnClick = mniExcluirClick
    end
    object mniGravar: TMenuItem
      Caption = 'Gravar'
      OnClick = mniGravarClick
    end
    object mniMinimizar: TMenuItem
      Caption = 'Minimizar'
      OnClick = mniMinimizarClick
    end
    object mniCancelar: TMenuItem
      Caption = 'Cancelar'
      OnClick = mniCancelarClick
    end
    object mniFechar: TMenuItem
      Caption = 'Fechar'
      OnClick = mniFecharClick
    end
  end
end
