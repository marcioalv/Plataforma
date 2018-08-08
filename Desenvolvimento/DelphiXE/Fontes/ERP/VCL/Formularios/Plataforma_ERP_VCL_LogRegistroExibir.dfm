object PlataformaERPVCLLogRegistroExibir: TPlataformaERPVCLLogRegistroExibir
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Log de registro'
  ClientHeight = 576
  ClientWidth = 577
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
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000003
      4D4944415478DAED965B4814611480CF995D0D1753BB10F5205E200B69AC1424
      1FCCE8A5ABBD84B96A881404590F5DD05DBB2249EE6A0F528108A13DA4BBA814
      04BE642141453DA8396B46423733338840BAACB9B3FFE96859AB6EEBEC3A1181
      07766667E6CC39DF7F6EFF20F8488AD9D60688DB4177A1615575C7F5B5948F4D
      7F825301EC0ADF91F50700085329A6B3C53A320F300F103400117D00492AD6EC
      490813225ED53102F49110CB34031044B0D11A1D01F491FF17808086002953AB
      23A1C24283417AAC67043E73253605B1D8701EE7457A02E8227F17804010C003
      04BACDE7570868E0BB89FCDBCAF6D22654248A75355A07430118501C96B8E92F
      AE2BA84E16C27B879DBF64F387146759B73FB6B5B9959B848497C6A10C286DEB
      6E2A791D1C00C1281FEECDB08C90CAAB6DF7AAEE427FDBACAF24E79C8D341A4D
      D779A8C5A3D1B05EB956F265CE296063F7BD5EF7E6D99C4F4A5A8E2DDA638047
      84D0E172580F060330C65170FD728CB084731DC704699CD824D63F1FC8311743
      66B7D33234910E73E50E017883C01BDBEB3CF95E2BC0941AE0AFA61A024C7339
      4B37CA66FB739EFB0981005495F84BC83A30792D9B6D2FB84D6B5D0E4BB53600
      AE703E8EFCBEA448765AA1384ACFC9F9B698D942EF5A393A02E5E5C2670175BC
      802897D392A73502334400EDEB75581B66D3F327729EFD0412642B4E4B865680
      E99390C9F1081BA80F052025CF769A2390CD2948D70430632F20A9958BB08D90
      1A5048CDB33954BDB8B3AFA574D8C7473DB76F34A76077C82960AA4E65D5D774
      B9DFF4940D240504985284849C82414E815D715A2F860E30614A64855358DF18
      7AA202E92D7E3B3A70F76EB93AFE7F4D9EBD4022B862347812BB1A4FBD9B1B00
      C093B108C878566FF9A4453F39A76AB9C1283A792437735B1F9DBC3FA7CD88EB
      E356B80A7BFCED72BE925A50B14215C69BEC6E99C9635CFDB0F5B85B17809F91
      E897481CEB7196B5F9798AB2B9CACC457C0109794F81784071587194D5FA0590
      732BF379C8640507804BD9CA2E6ED5376CAC9D47F5009F25F69DC09DB2855516
      71D15D1E59E03E13E53115A2805A5F080CC6D99F24656F7502F71BAF14363050
      2C3BFCC6911962800EA14AADBE6D28E7DB0F8C432052718FC35AA70B40B03209
      4112EEFF27003F20AA8A4840D777F104CADD94048CF20000000049454E44AE42
      6082}
  end
  object imgBackground: TImage
    Left = 0
    Top = 473
    Width = 105
    Height = 105
    Center = True
    Stretch = True
  end
  object pagFormulario: TPageControl
    Left = 48
    Top = 16
    Width = 513
    Height = 481
    Cursor = crHandPoint
    ActivePage = tabDados
    TabOrder = 0
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
  object btnFechar: TBitBtn
    Left = 512
    Top = 512
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Fechar'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnFecharClick
  end
  object btnMinimizar: TBitBtn
    Left = 456
    Top = 512
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Minimizar'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnMinimizarClick
  end
  object mnuFormulario: TMainMenu
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    Left = 224
    Top = 504
    object mniFechar: TMenuItem
      Caption = 'Fechar'
      OnClick = mniFecharClick
    end
    object mniMinimizar: TMenuItem
      Caption = 'Minimizar'
      OnClick = mniMinimizarClick
    end
  end
end
