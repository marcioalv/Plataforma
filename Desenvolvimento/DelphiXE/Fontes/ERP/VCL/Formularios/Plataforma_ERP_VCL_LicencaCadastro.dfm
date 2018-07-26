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
      0E4944415478DAED973D48235110C767828A51F4CE4A45E140E410C4A4512B41
      04B11445391215CEE240BD4638C418AE509B23898820822258089AACC446ACB4
      0B168220EA06AED1C2C24210355C1150939DFB7B10F00B6E135EA2425EF17677
      F6CD9BDF7B333B6F96E9951BBF4900BBC3D71967F9ACD290458C6D5D731F9802
      B039BC577853A274A922ABBA36D6670AA0CEE98DE0C507A500447E3DE0EACD02
      6401DE2780902C10CB5432D658780D7DBD1A0091433CEF25B55EA67674654A00
      14B5770C20429EB0E6722763ADCEE1DD61A626350044A72C72920C0074EA99F9
      A31200452D0BA004E008BE0D519C9651614CC2C70D90956608406E728B4A8AF6
      1707EE12129BD3D705F97A4600900DFBC3DAD8F2435973F378CE75B93548CC1D
      E907601A08FB5D8BCFC77AB698B82DFD00443FC301D7AFA7636D4ECF11A6B1A5
      1D0004D7E8265058CE26B6FFAADCAA2110BB4C18570040FFE20001C89BCC528D
      F47C09E32D268DAB01C02E6CA0BB10E608527331D45B314355E600C8F8AE07DC
      F3F7DB1F0A4DC65E3870540178CE10D915CF5D403F98A406B74E8379888506CD
      0240770927EA375300F6EEE90A23EFB6ECD140C3A2E152895A2B826F725D5886
      A01C835B026291B9FF0158B9E0786F75F88F2980971A7ED776910BA2F118F7FE
      0E8E9EDB7BBC2D084A3F56368304E5333B4FEA007D5385FACA48F4BEDC4CC83E
      7D1DCF6F8CD6DE05835FE2A902FC05BDD027307001845E0000000049454E44AE
      426082}
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
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
