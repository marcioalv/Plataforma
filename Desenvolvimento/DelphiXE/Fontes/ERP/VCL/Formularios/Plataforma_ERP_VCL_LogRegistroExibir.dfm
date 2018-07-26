object PlataformaERPVCLLogRegistroExibir: TPlataformaERPVCLLogRegistroExibir
  Left = 0
  Top = 0
  ActiveControl = btnFechar
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Log de registro'
  ClientHeight = 562
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
      7F4944415478DAED574D681351109E79D95AAD2245AAE6A4140F42658388070F
      1E8A2741948206D22620E45050500F2A9B5EC42A358956F120067F4010D224DA
      6B3D78F0622F5E54362204156DF152F1908A3622D91DBF4D52E9215B1B9BB514
      F20E8FF786D9F77D6FBE99D95DA6151EBC7013885CEBA6B275D743B81F66D6E8
      7325A00FC47516657A052F44B3F98CD1D922D022D028816933636C6F14AC2798
      D8A6693CB57C02423F314D367E5B5ECB4CFB9B1181A68D16811681D5494044BE
      9052E1CAC696D328ADC338284ECCCF1645B3AC2DAC54BA19048AC29C70D64AA8
      0F4FEC13A1AC30BD5E0C9F853A4136B6FA25587902429F45D981EA9A4799380A
      5906A1C7785D145B8D20F4275C2808CE282E30A4FF9E0344732C3251A3BB07D3
      0E9CF2021A4FD7C560EAC6B41724BF22794FD675B1E512FC5E2AA28B5E4AE0FA
      16D543C9E7CC3261666289A544A03C7F5BDCBC8B99373AA50929BEBB42B37420
      D4EDE6CEB92EBDB0EE017C77D5CE9ACA678DA381FEC47B88712B9F8DDD6CE87B
      00CC6F3BFA8A6D87F3B9A13137FC9EE055BFA6C93B489E82FFB84D9C03FC1A65
      4B58D8A70BD9D7C9C77A3E6D14BC8940D5772B7CD783C4FDD9F6D2A9B6994DD2
      D159BA8C0676C6268ABEC9189526F55FCA10808734A53E59B665B2F043FC1B44
      FFA8E5250144C1C274CED1BA26E11158C7108514FAC179CF09E0E691F9503B4D
      C4C9CE40287E00ADFD2936BDA882492F09CC2079FDC1E0235FC1F7F11E086C28
      5BA5C8DBC7C3BFF450E215F22A6DE662A39EF781407FF202D6C3951808DD4019
      9E75ED03BB8F8D6C2EB769D17F82AB0D26E945851C44A57CC3E129188EC3EAAF
      1290226C77B0C7EB5D3EE0B257783960F5863E901C44AB0D2EC5179FEE4F7E03
      BE489FDEF026F30C0000000049454E44AE426082}
  end
  object btnFechar: TButton
    Left = 488
    Top = 512
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object pagFormulario: TPageControl
    Left = 48
    Top = 16
    Width = 513
    Height = 481
    Cursor = crHandPoint
    ActivePage = tabRegistro
    TabOrder = 1
    object tabRegistro: TTabSheet
      Caption = 'Registro'
      object lblSequencial: TLabel
        Left = 16
        Top = 16
        Width = 62
        Height = 14
        Caption = 'Sequencial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblLogLocalDtHr: TLabel
        Left = 104
        Top = 16
        Width = 95
        Height = 14
        Caption = 'Data e hora local:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblLogServerDtHr: TLabel
        Left = 304
        Top = 16
        Width = 114
        Height = 14
        Caption = 'Data e hora servidor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblRegistroAcaoTitulo: TLabel
        Left = 16
        Top = 112
        Width = 31
        Height = 14
        Caption = 'A'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblHostName: TLabel
        Left = 16
        Top = 160
        Width = 60
        Height = 14
        Caption = 'HostName:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUserName: TLabel
        Left = 16
        Top = 208
        Width = 59
        Height = 14
        Caption = 'UserName:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUsuarioNome: TLabel
        Left = 16
        Top = 256
        Width = 43
        Height = 14
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMensagem: TLabel
        Left = 16
        Top = 304
        Width = 62
        Height = 14
        Caption = 'Mensagem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblLogBase: TLabel
        Left = 16
        Top = 64
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
      object edtSequencial: TEdit
        Left = 16
        Top = 32
        Width = 73
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
        TabOrder = 0
        Text = '999.999'
      end
      object edtLogLocalDtHr: TEdit
        Left = 104
        Top = 32
        Width = 185
        Height = 26
        Hint = 'Clique para exibir informa'#231#245'es sobre a data local!'
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
        TabOrder = 1
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtLogLocalDtHrClick
      end
      object edtLogServerDtHr: TEdit
        Left = 304
        Top = 32
        Width = 185
        Height = 26
        Hint = 'Clique para exibir informa'#231#245'es sobre a data no servidor!'
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
        TabOrder = 2
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtLogServerDtHrClick
      end
      object edtRegistroAcaoDescricao: TEdit
        Left = 16
        Top = 128
        Width = 473
        Height = 26
        TabStop = False
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
      end
      object edtHostName: TEdit
        Left = 16
        Top = 176
        Width = 473
        Height = 26
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '999.999'
      end
      object edtUserName: TEdit
        Left = 16
        Top = 224
        Width = 473
        Height = 26
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '999.999'
      end
      object edtUsuarioNome: TEdit
        Left = 16
        Top = 272
        Width = 473
        Height = 26
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '999.999'
      end
      object memMensagem: TMemo
        Left = 16
        Top = 320
        Width = 473
        Height = 113
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'memMensagem')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object edtLogBaseDescricao: TEdit
        Left = 16
        Top = 80
        Width = 473
        Height = 26
        Hint = 'Clique para informa'#231#245'es sobre a base de dados do log!'
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '999.999'
        OnClick = edtLogBaseDescricaoClick
      end
      object edtLogBaseID: TEdit
        Left = 336
        Top = 80
        Width = 73
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = 'edtLogBaseID'
        Visible = False
      end
      object edtRegistroAcaoID: TEdit
        Left = 288
        Top = 128
        Width = 121
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = 'edtRegistroAcaoID'
        Visible = False
      end
      object edtUsuarioID: TEdit
        Left = 320
        Top = 272
        Width = 89
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = 'edtUsuarioID'
        Visible = False
      end
      object edtUsuarioBaseID: TEdit
        Left = 192
        Top = 272
        Width = 113
        Height = 26
        TabStop = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = 'edtUsuarioBaseID'
        Visible = False
      end
    end
    object tabDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object memDados: TMemo
        Left = 8
        Top = 8
        Width = 489
        Height = 433
        TabStop = False
        Color = clInactiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'memDados')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object btnMinimizar: TButton
    Left = 408
    Top = 512
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Minimizar'
    TabOrder = 2
    OnClick = btnMinimizarClick
  end
end
