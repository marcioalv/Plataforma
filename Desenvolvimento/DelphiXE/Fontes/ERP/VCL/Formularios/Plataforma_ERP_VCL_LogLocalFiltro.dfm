object PlataformaERPVCLLogLocalFiltro: TPlataformaERPVCLLogLocalFiltro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filtrar informa'#231#245'es do arquivo de log local'
  ClientHeight = 241
  ClientWidth = 497
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
  DesignSize = (
    497
    241)
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
  object btnFechar: TBitBtn
    Left = 416
    Top = 200
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object panFormulario: TPanel
    Left = 48
    Top = 8
    Width = 441
    Height = 185
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblDtOcorrenciaIni: TLabel
      Left = 16
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object lblOcorrenciaAte: TLabel
      Left = 184
      Top = 36
      Width = 16
      Height = 13
      Caption = 'at'#233
    end
    object lblMensagem: TLabel
      Left = 16
      Top = 72
      Width = 55
      Height = 13
      Caption = 'Mensagem:'
    end
    object lblHrOcorrenciaIni: TLabel
      Left = 112
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Hor'#225'rio:'
    end
    object lblDtOcorrenciaFim: TLabel
      Left = 216
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object lblHrOcorrenciaFim: TLabel
      Left = 312
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Hor'#225'rio:'
    end
    object lblHashCode: TLabel
      Left = 16
      Top = 120
      Width = 107
      Height = 13
      Caption = 'HashCode (num'#233'rico):'
    end
    object txtMensagem: TEdit
      Left = 16
      Top = 88
      Width = 401
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'txtMensagem'
      OnEnter = txtMensagemEnter
      OnExit = txtMensagemExit
      OnKeyPress = txtMensagemKeyPress
    end
    object txtDtOcorrenciaIni: TMaskEdit
      Left = 16
      Top = 32
      Width = 89
      Height = 22
      Alignment = taCenter
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = txtDtOcorrenciaIniEnter
      OnExit = txtDtOcorrenciaIniExit
      OnKeyDown = txtDtOcorrenciaIniKeyDown
      OnKeyPress = txtDtOcorrenciaIniKeyPress
    end
    object txtDtOcorrenciaFim: TMaskEdit
      Left = 216
      Top = 32
      Width = 89
      Height = 22
      Alignment = taCenter
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
      OnEnter = txtDtOcorrenciaFimEnter
      OnExit = txtDtOcorrenciaFimExit
      OnKeyDown = txtDtOcorrenciaFimKeyDown
      OnKeyPress = txtDtOcorrenciaFimKeyPress
    end
    object txtHrOcorrenciaIni: TMaskEdit
      Left = 112
      Top = 32
      Width = 57
      Height = 22
      Alignment = taCenter
      EditMask = '99:99'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      Text = '  :  '
      OnEnter = txtHrOcorrenciaIniEnter
      OnExit = txtHrOcorrenciaIniExit
      OnKeyDown = txtHrOcorrenciaIniKeyDown
      OnKeyPress = txtHrOcorrenciaIniKeyPress
    end
    object txtHrOcorrenciaFim: TMaskEdit
      Left = 312
      Top = 32
      Width = 57
      Height = 22
      Alignment = taCenter
      EditMask = '99:99'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 3
      Text = '  :  '
      OnEnter = txtHrOcorrenciaFimEnter
      OnExit = txtHrOcorrenciaFimExit
      OnKeyDown = txtHrOcorrenciaFimKeyDown
      OnKeyPress = txtHrOcorrenciaFimKeyPress
    end
    object txtHashCode: TEdit
      Left = 16
      Top = 136
      Width = 401
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = 'txtHashCode'
      OnEnter = txtHashCodeEnter
      OnExit = txtHashCodeExit
      OnKeyPress = txtHashCodeKeyPress
    end
  end
  object btnLimpar: TBitBtn
    Left = 48
    Top = 200
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = btnLimparClick
  end
  object btnConfirmar: TBitBtn
    Left = 248
    Top = 200
    Width = 81
    Height = 33
    Cursor = crHandPoint
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object btnMinimizar: TBitBtn
    Left = 336
    Top = 200
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'Minimizar'
    TabOrder = 2
    OnClick = btnMinimizarClick
  end
end
