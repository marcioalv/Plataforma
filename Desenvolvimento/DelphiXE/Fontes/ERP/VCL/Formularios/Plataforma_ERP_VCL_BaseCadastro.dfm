object PlataformaERPVCLBaseCadastro: TPlataformaERPVCLBaseCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Base de dados da aplica'#231#227'o'
  ClientHeight = 281
  ClientWidth = 449
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
      644944415478DAB5975B6C544518C7CF5EDAEE425B40B905545C96185C6DD36E
      B71716B4864443A084076DC0FA62C427A33C181312CA35216A628C114220C083
      11B062830F424362A45CAD76BBBDA42485286DF11A899AB87461DBED5EF87DD9
      69DCF49CBD74D99DE4CB7F66CECC7CFFF92E33734C5A16C5EBF5968D8F8FAFA2
      EA429C269369513C1E9F0B96806130447F00194186A3D1A87F6060E006F578A6
      B54DA93E5456562E2C2A2A7A0D055B68D6A0C4920DD9A4F237D2118BC54EF6F7
      F777A622A323505757571E89445AA9BE8352FB0C951A1636D10FBCD7D7D7D799
      9600CA1D98EF9C3275BE0B3CE23B21F1BE21819A9A9A22E007A91640F9FF0A4D
      A657FC7EFF191D018FC7E385E1F78554AECCF01D5678D1C8022F00170B4D8072
      B5B7B7F7791D0197CB556AB7DB25585614D8026F6381433A02D5D5D51EABD51A
      216D3A682E2990F2C366B3F92431D0A523E076BB5BF86883C0799A1F132C5BB4
      34E7C40C15FFC6DAADA004DFD7B8609D2101E033146F63C091AAAA2A1793DEA4
      BD39178BA02C025C424E1517179F9E989898C77A67E85F820B96191240D929D5
      BC82257671825D910601BA92896BA83E8D2C67DC63E06CFA4AD4F8007D41F016
      324C7F0F4777D7D0D050B0A2A2621E04DEA26F3B63CAC05F531158CB800BD336
      F233134E839D2CF2232594CDEE59CB093C876C60CD8DE01451B14C170456EB08
      C8858399AE535D66B428132759EC17B5C3DF4121738F3E333847847E07B882BE
      47D2F07B17177FA223505B5B5BC51D6067F259E4D199FA3CCB222E3E00019F91
      0B5AD841D462B1F4E0FF8390589F2FADACFB0FEBED0B0402C7CACBCBBFC2059B
      0C0900C719B815866D9C0BABA84B16BCAC4C9C4BF1A3FC0417DCE71C72E67038
      2CF1F4543659709689AD0CBCDED8D8680D06836EDA12545359F0382857F52CB9
      E2C0FFE81B0387B5448CF8794B5CEEEEEEBED3D0D06047F11B7CDFC3B70529B3
      8054930BE2DBE93B40DA987CD1E1700CB6B7B747B3D9366BCD07D6A0AC496EBF
      640BD2E78340BD110189E29B4C589CC28F77F9F693DAE11FE07D95FB56DA65E0
      5CB18EB2D0722DC529CAD81D10F84047802C78065F2D64F237344B73F479A672
      0E027B20D06718037C1CE3421A81C8518878F3A8582CF5612814FA88603C4190
      6F3624001C465A20D8814BD6434882A7494B3AC966586E491680C7389AC76C36
      9BD4DD99B220867CC179B0DBE7F38DCA3B8189620DC982955AE2A45BAA25B2A0
      54CE0EDA77B5A467B9DC05F4C9C3E3667373B3657474B485B3653F7D4FA4CC02
      F27E1DB7D5F924F631067732E94BF0129386B3DDB64A3DF98F6832B84DE1D5EB
      D11150593092E61CFF13B9A17628F5FB5AE21614F7CC42E6D3FFA496C88267C1
      62A34518B397CDECD311506E107FB7B3802D479FA72D28BF4C2CBCC4351D3624
      A048C821715CED225F45147E4A16EC4C566E48401533445E055F87C85A69E7B8
      E3BF8036E450AA18CAF8E6ABAFAF5F343939D948555E445359204155324DD9BF
      F4DFD6541680D79C4E674FA6E3FB611E9D669E5B73501A1E1C1CBC97EB227979
      F53E4C7900E3FE2C3FC303DEB00000000049454E44AE426082}
  end
  object pagFormulario: TPageControl
    Left = 48
    Top = 8
    Width = 385
    Height = 225
    Cursor = crHandPoint
    Margins.Left = 48
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 48
    ActivePage = tabAuditoria
    TabOrder = 0
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 60
      ExplicitTop = -40
      ExplicitHeight = 189
      object lblCodigo: TLabel
        Left = 96
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
      object edtCodigo: TEdit
        Left = 96
        Top = 32
        Width = 73
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
      end
      object edtDescricao: TEdit
        Left = 16
        Top = 88
        Width = 345
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
      end
      object chkBloqueado: TCheckBox
        Left = 16
        Top = 136
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
        TabOrder = 2
      end
      object chkAtivo: TCheckBox
        Left = 16
        Top = 160
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
        TabOrder = 3
      end
      object edtBaseID: TEdit
        Left = 16
        Top = 32
        Width = 65
        Height = 26
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = '9.999'
      end
    end
    object tabAuditoria: TTabSheet
      Caption = 'Auditoria'
      ImageIndex = 1
      ExplicitHeight = 181
      object lblInsDtHt: TLabel
        Left = 16
        Top = 16
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
        Left = 16
        Top = 72
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
        Left = 216
        Top = 72
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
      object edtInsLocalDtHr: TEdit
        Left = 16
        Top = 32
        Width = 185
        Height = 26
        Hint = 'Clique para informa'#231#245'es sobre a data de cria'#231#227'o!'
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
        TabOrder = 0
        Text = '99/99/9999 99:99:99.999'
        OnClick = edtInsLocalDtHrClick
      end
      object edtUpdLocalDtHr: TEdit
        Left = 16
        Top = 88
        Width = 185
        Height = 26
        Hint = 'Clique para informa'#231#245'es sobre a data da '#250'ltima altera'#231#227'o!'
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
        OnClick = edtUpdLocalDtHrClick
      end
      object edtUpdContador: TEdit
        Left = 216
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
        TabOrder = 2
        Text = '999.999'
      end
    end
  end
  object btnMinimizar: TBitBtn
    Left = 280
    Top = 240
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
    TabOrder = 1
    OnClick = btnMinimizarClick
  end
  object btnFechar: TBitBtn
    Left = 360
    Top = 240
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnFecharClick
  end
end
