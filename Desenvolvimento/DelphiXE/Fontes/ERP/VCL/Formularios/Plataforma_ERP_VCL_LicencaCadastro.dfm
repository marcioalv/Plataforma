object PlataformaERPVCLLicencaCadastro: TPlataformaERPVCLLicencaCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Licen'#231'as de uso da aplica'#231#227'o'
  ClientHeight = 282
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
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000002
      DC4944415478DAED974968535114869BA924A4115B4A414A159262A548E64504
      DB2C44A96817824514A94311DD082A6275214217ED421105418C2B2D8210DCD8
      957663B40892D154522CC9A61B852A58B466367E17529198A9C97B5D79E170E6
      73FE7BEF79EFF1142D25CB66B31D57281493504F8B742B0DBDCCE7F363914864
      F96F87A2A4792F8D1720B584CDFFAC42A1F038140A9DA806E08852A97C5A0CBE
      004B4AD1980D1D820D51330180DE8A00EC76FB31829F14D5CDC16070450A00D4
      9DA2EE55002C0160DB7F00EB02C05C0C637B0069EB6D48A302F133E49F6C1A00
      B6DBD82E36B0F155F237C17F3505C0E5727564B359F1E8B4AEA73BCD5ED1EC5D
      D327D0C0CEFF594D03E8EFEF6F53A9549A6A4D92C9E4CF783C9E961C80C3E118
      437E581A5B66FDE055BB9B57ED7B4901609BC076BD9EA3A6C1100D5E480A80E3
      6FD56AB5FBB0EB6AF4FF44FC9CE45750CFCE6B2DC900300FA33093D1689CF07A
      BDF90D0340E349924F2376E257217F465E30994C7BEB01D21400B3D9AC57ABD5
      F3E83DF8A6E15F21F164B4F3E9EEF3FBFD8BB20260F7CF918749BE42F24DE1E0
      FBB08BE66FB17D31180C5B7C3E5F4E4E00A2E9659207497E231C232323AA4422
      91420C6273C97A02D8CE60F3A07BD0CFC10BC5617C44C1690A8ECA0A80E37662
      7B066DA5C0073103C883F015F4710A7A6405E076BBB5DC719A5D4728B01DFB2A
      A4630676E8F5FA657C295901884710799E8FCD8C4EA7D3C253346ECBE572EDC4
      DEA2E001B96740248F933C8BED3B6440FF867E10997AA101C900B0DBC3306F51
      BD43429A443772D949C73FB706C0E974EE443F0AA94AE3D66AE05B24BEAF2200
      8BC5D2CD4BE723A2BED6AE4A0100FE356CA046FC3DE2CF5704201653BF8701BB
      417077117D87B88E3A009C45BF8458EEAF2A03CD3237D7A2D1E86A550095EEAF
      16804657DD006896854FC1C515DD45EEDC4800FBA1538140202C6C7CA0BA341A
      CD7D0074C90EC06AB55A3299CC422C16CB94FAC45B321C0E079A01F01BAE966B
      3FB8EC54B40000000049454E44AE426082}
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
      ExplicitHeight = 181
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
      object lblLicencaID: TLabel
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
        Width = 265
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
        Text = 'WWWW.9999.WWWW.9999'
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
      object edtLicencaID: TEdit
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
        Text = '999.999'
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
        Width = 65
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
    TabOrder = 2
    OnClick = btnFecharClick
  end
end
