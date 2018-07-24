object PlataformaERPVCLTiposUsuariosFiltro: TPlataformaERPVCLTiposUsuariosFiltro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filtros para localiza'#231#227'o de tipos de usu'#225'rio'
  ClientHeight = 281
  ClientWidth = 393
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
    Top = 8
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF4000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000004
      2A4944415478DAB5976B48544114C7F7A5AD622E3DB037812B517E309F116588
      BDE86904AD4911061195411141659291956441181145854104855B105124F620
      B22CCB17562A85F5C10F950A156EB9B5A9FD26EFCAEDEEECBAD7D803C3993B33
      E77FFE7366E6CC5CA3611892909010131616964F3585D249B9565757E71C0E96
      51AF416A6AEA94BEBEBE9746A3719CA6AB1812052127909C9C7C12E7BBB4EDFD
      FDFDBF91494D4D4D1DFF4D202D2D6D4C6F6F6F787D7DFD4709812A08A4CBEC88
      CCD28686860A755B7C7C7C786464E46408B613214F4002494949092693A9CC30
      B0B66256AD38DB8CE113158187B465FA21B010020F443D2E2E6E447474F471AA
      798CB780E54697C4C6C61E763A9DBD3E045252526CA8B794184D687F406A7A6D
      6D6DBB42E014403B64FE89DAF8C6C6C64E05AF14B553B2540544B6D88700C01B
      01BE249B19467B303AA1442915422F24CB5741A4968A4A464686C5E5727DA11A
      25C1FA0056AC8CC0010814F9217016A33CD5D8CB8CDDA0EAEFA1CC26FC4DCAEC
      C71A068EA7140EA2261901B15667FC18156174D0FBC1C68AB25AAD5F196F569A
      4AE91F3C192202DDDDDD6E55BF5A3A183B7884070910DA1984B659E65DBDB910
      13B9603D33BEAC8AC07DC6ACF3AEBF32A14710C890C0954360AD0F01C5A812A3
      459AF0BF26FC33050FFA17A34F33669A04F82763CBE8CBC7C13796610D6DB2EC
      984EFF537F04EC00BCA43A4A69FAC5CCE632FB5AFAB6294B3454F27AC769984B
      34BAB029C7668D6A32A799CC3F27C8070CE6B7502B1583460C92C411A5DE0958
      982108F16E5AEC56F17953B594696232520264BFF130DF42752F8E22BC58948B
      7C57A9D73C08798ECD291C1E41DB55C4AA514590AB54B0070810AA5C656D47EA
      70326C81C83D54AE48F5469CAFC6F10D83BE8BA98F22D2F36BCA18CA3CCA449D
      24EAED76FB2C41E0360496EBB0FDC6F865A4E66A6F83C8FB369BED1CD58D7A48
      B044738C816E3799307613CECBB4ED4AFA6D117C744461852E021878DC6EF7E8
      E6E66697AC9F5D7F14B53F6404904E92488CBF4E088853742EA41160E75A0D03
      9BD047C0CA07AB3818ACE146E0EFC621993CF31381BBA825212520121251C8D5
      B67399C581D3225E3F7A09DC11C74A8791784E2D86C4436F9BC3E130B7B5B5DD
      D55E64C144531028C4F0901E43C4C966CCF67E242626C69BCDE6373A315C3D3D
      3D138CE20E808978078C1ACA82D977A14A207C415CB9EA3E26321FB53BD86882
      554214F7FD4DBFE2D6A2E1FA10EB5765B1581C3535359F030183E5405DA18407
      705E4D3EC9249FFC1ACCFFBC72B2941BCF2631780FB964EDACFD095839D85CF5
      E3FC0ECE73BCC94CFB5F30555CA3942C4D9FDEDF2EB1B77E80635539FE842A24
      EC170DCA55EC434045443CBDB763940D48244DE299754C0701B1145F4534C178
      05C6798FC77389DFB6EF3E4C038188D76F4444C40236E91792CF639D04B6A21E
      41BC3560A8F4808642FE006C2D27A9AEBA4EA70000000049454E44AE426082}
  end
  object btnLocalizar: TBitBtn
    Left = 48
    Top = 240
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Localizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnLocalizarClick
  end
  object btnFechar: TBitBtn
    Left = 304
    Top = 240
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object btnLimpar: TBitBtn
    Left = 144
    Top = 240
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Limpar'
    TabOrder = 2
    OnClick = btnLimparClick
  end
  object btnMinimizar: TBitBtn
    Left = 224
    Top = 240
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Minimizar'
    TabOrder = 3
    OnClick = btnMinimizarClick
  end
  object pagFormulario: TPageControl
    Left = 48
    Top = 8
    Width = 330
    Height = 225
    Cursor = crHandPoint
    ActivePage = tabAuditoria
    TabOrder = 0
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      object lblCodigoAte: TLabel
        Left = 153
        Top = 37
        Width = 16
        Height = 13
        Caption = 'at'#233
      end
      object lblDescricao: TLabel
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
      object lblBloqueado: TLabel
        Left = 16
        Top = 128
        Width = 61
        Height = 14
        Caption = 'Bloqueado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblAtivo: TLabel
        Left = 176
        Top = 128
        Width = 32
        Height = 14
        Caption = 'Ativo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigoInicial: TEdit
        Left = 16
        Top = 32
        Width = 129
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
        OnEnter = edtCodigoInicialEnter
        OnExit = edtCodigoInicialExit
        OnKeyPress = edtCodigoInicialKeyPress
      end
      object edtCodigoFinal: TEdit
        Left = 176
        Top = 32
        Width = 129
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
        OnEnter = edtCodigoFinalEnter
        OnExit = edtCodigoFinalExit
        OnKeyPress = edtCodigoFinalKeyPress
      end
      object edtDescricao: TEdit
        Left = 16
        Top = 88
        Width = 289
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 2
        Text = 'Xxxxxxxxxx Wwwwwwwwww'
        OnEnter = edtDescricaoEnter
        OnExit = edtDescricaoExit
        OnKeyPress = edtDescricaoKeyPress
      end
      object cbxBloqueado: TComboBox
        Left = 16
        Top = 144
        Width = 129
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 3
        Text = 'Wwwww'
        OnEnter = cbxBloqueadoEnter
        OnExit = cbxBloqueadoExit
        OnKeyPress = cbxBloqueadoKeyPress
      end
      object cbxAtivo: TComboBox
        Left = 176
        Top = 144
        Width = 129
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 4
        Text = 'Wwwww'
        OnEnter = cbxAtivoEnter
        OnExit = cbxAtivoExit
        OnKeyPress = cbxAtivoKeyPress
      end
    end
    object tabAuditoria: TTabSheet
      Caption = 'Auditoria'
      ImageIndex = 1
      object lblTipoUsuarioID: TLabel
        Left = 16
        Top = 16
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
      object lblTipoUsuarioIDAte: TLabel
        Left = 152
        Top = 37
        Width = 16
        Height = 13
        Caption = 'at'#233
      end
      object lblInsDtHr: TLabel
        Left = 16
        Top = 72
        Width = 70
        Height = 14
        Caption = 'Data cria'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblInsDtHrAte: TLabel
        Left = 152
        Top = 93
        Width = 16
        Height = 13
        Caption = 'at'#233
      end
      object lblUpdDtHr: TLabel
        Left = 16
        Top = 128
        Width = 82
        Height = 14
        Caption = 'Data altera'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblUpdDtHrAte: TLabel
        Left = 152
        Top = 149
        Width = 16
        Height = 13
        Caption = 'at'#233
      end
      object edtTipoUsuarioIDInicial: TEdit
        Left = 16
        Top = 32
        Width = 129
        Height = 26
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 0
        Text = '999.999'
        OnEnter = edtTipoUsuarioIDInicialEnter
        OnExit = edtTipoUsuarioIDInicialExit
        OnKeyPress = edtTipoUsuarioIDInicialKeyPress
      end
      object edtTipoUsuarioIDFinal: TEdit
        Left = 176
        Top = 32
        Width = 129
        Height = 26
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 1
        Text = '999.999'
        OnEnter = edtTipoUsuarioIDFinalEnter
        OnExit = edtTipoUsuarioIDFinalExit
        OnKeyPress = edtTipoUsuarioIDFinalKeyPress
      end
      object medInsDtHrInicial: TMaskEdit
        Left = 16
        Top = 88
        Width = 127
        Height = 26
        Alignment = taCenter
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = medInsDtHrInicialEnter
        OnExit = medInsDtHrInicialExit
        OnKeyDown = medInsDtHrInicialKeyDown
        OnKeyPress = medInsDtHrInicialKeyPress
      end
      object medInsDtHrFinal: TMaskEdit
        Left = 176
        Top = 88
        Width = 127
        Height = 26
        Alignment = taCenter
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 3
        Text = '  /  /    '
        OnEnter = medInsDtHrFinalEnter
        OnExit = medInsDtHrFinalExit
        OnKeyDown = medInsDtHrFinalKeyDown
        OnKeyPress = medInsDtHrFinalKeyPress
      end
      object medUpdDtHrInicial: TMaskEdit
        Left = 16
        Top = 144
        Width = 127
        Height = 26
        Alignment = taCenter
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '  /  /    '
        OnEnter = medUpdDtHrInicialEnter
        OnExit = medUpdDtHrInicialExit
        OnKeyDown = medUpdDtHrInicialKeyDown
        OnKeyPress = medUpdDtHrInicialKeyPress
      end
      object medUpdDtHrFinal: TMaskEdit
        Left = 176
        Top = 144
        Width = 127
        Height = 26
        Alignment = taCenter
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 5
        Text = '  /  /    '
        OnEnter = medUpdDtHrFinalEnter
        OnExit = medUpdDtHrFinalExit
        OnKeyDown = medUpdDtHrFinalKeyDown
        OnKeyPress = medUpdDtHrFinalKeyPress
      end
    end
  end
end
