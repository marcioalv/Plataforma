object PlataformaERPVCLRotinaAplicacaoLista: TPlataformaERPVCLRotinaAplicacaoLista
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de rotinas da aplica'#231#227'o'
  ClientHeight = 537
  ClientWidth = 825
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
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    825
    537)
  PixelsPerInch = 96
  TextHeight = 13
  object imgBackground: TImage
    Left = 0
    Top = 376
    Width = 105
    Height = 105
    Center = True
    Stretch = True
  end
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
      424944415478DAED97316814411486DF9BCB2568E31536DA1814148B4B401B0B
      D3480A315606314B406D0DA2A285B7627368CC9D289E2004ACC5443C14C14002
      5A28164110CC295759D8A5914341CD79BB3BCF7F2F5788CCDE85BDDD15E15E31
      FB6667DE7BDFCEFC3BEC328532E1AC75739A44CEA0F38D155DAC3CCC3D099389
      8306864FDDC968A76E1E17358EE2B7E19D438A5DC862A7941AF6C45D354DF79C
      BA537D9CFFBE21807D93D7B7B93AFD12EEDEB66B2034FB61FEF294EF0F59C56A
      A7F9B07265F7CF1394CFEBB600D989E25566BA1650B4404A977D7FADB6F9E3A7
      C5F3BF7C7FBF756B6B839D1DCD495A95107F30007BA432977BD30960060972E6
      047AAA3267CFB67BCCAC557C8EA463C6E5167D7465DE5E080D20440BC45C0A2A
      AEB437A059DD43D2C15800BAB51E400F203480902C42FD4FD73B5262E24DC902
      E000C2A96737C7ADE257046D01D5EB46DA3B96F6589B8A798D7E4EF539F79979
      3C160011F981F02526F1CC8FCB8C39A3B864BA0688CAFE6300A16534AF5A1117
      D00C240A1020C265C574121A346AC053A2FA5C75175A38120F00490D10FE5790
      F12D688A90640CAFECF628B6A08E76AD9525E3674F740BA2B22EB640DE63E2DB
      D6D29E46DB9F30805184EF24256731E8988AA55C515AA91B001E8D0500F75671
      0A3EA02011AEA73F8E0A3BA3D80214E55AAB3B882895E81644653D800D010C4D
      14A6A1DC2B7100404D87F163B2D40160E610005E843DED024B8B7CF1DCF49E6A
      F952EDCFFBC622D9C9C201D23C821F91506AFFDB50A4AEB47EB6F2C8FE6C18FB
      B7F61B50CD8830F97E19340000000049454E44AE426082}
  end
  object btnFechar: TBitBtn
    Left = 760
    Top = 472
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Fechar'
    Anchors = [akRight, akBottom]
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
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object panFormulario: TPanel
    AlignWithMargins = True
    Left = 48
    Top = 16
    Width = 761
    Height = 441
    Margins.Left = 48
    Margins.Top = 16
    Margins.Right = 16
    Margins.Bottom = 64
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      757
      437)
    object lblListaQtde: TLabel
      Left = 8
      Top = 412
      Width = 142
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Foram localizados 9 registros!'
      ExplicitTop = 464
    end
    object lblListaFiltros: TLabel
      Left = 536
      Top = 404
      Width = 80
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Filtros aplicados!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitLeft = 540
      ExplicitTop = 456
    end
    object lvwLista: TListView
      AlignWithMargins = True
      Left = 8
      Top = 33
      Width = 741
      Height = 374
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 30
      Align = alClient
      BorderStyle = bsNone
      Columns = <
        item
          Width = 0
        end
        item
          Alignment = taRightJustify
          Caption = 'ID'
          Width = 0
        end
        item
          Caption = 'C'#243'digo'
          Width = 175
        end
        item
          Caption = 'Descri'#231#227'o'
          Width = 400
        end
        item
          Caption = 'Chave'
          Width = 0
        end
        item
          Alignment = taCenter
          Caption = 'Bloqueado'
          Tag = 100
          Width = 90
        end
        item
          Alignment = taCenter
          Caption = 'Ativo'
          Tag = 100
          Width = 60
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lvwListaColumnClick
      OnCompare = lvwListaCompare
      OnCustomDrawItem = lvwListaCustomDrawItem
      OnCustomDrawSubItem = lvwListaCustomDrawSubItem
      OnDblClick = lvwListaDblClick
      OnKeyPress = lvwListaKeyPress
    end
    object pbaProgresso: TProgressBar
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 741
      Height = 17
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      TabOrder = 1
      Visible = False
    end
  end
  object btnMinimizar: TBitBtn
    Left = 704
    Top = 472
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Minimizar'
    Anchors = [akRight, akBottom]
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
    TabOrder = 2
    OnClick = btnMinimizarClick
  end
  object btnNovo: TBitBtn
    Left = 648
    Top = 472
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Novo'
    Anchors = [akRight, akBottom]
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
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object btnLocalizar: TBitBtn
    Left = 592
    Top = 472
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Hint = 'Localizar'
    Anchors = [akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Glyph.Data = {
      3E070000424D3E07000000000000360000002800000018000000190000000100
      1800000000000807000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4
      D4DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFCECECE292929555555DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFCECECE292929000000292929D3D3D3FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFCECECE292929000000292929CECECEFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECECE292929000000292929CECE
      CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9
      C9C9A9A9A9969696A7A7A7D1D1D1FFFFFFFFFFFFFFFFFFCECECE282828000000
      282828CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
      E09494942E2E2E1414143C3C3C4B4B4B3737370D0D0D3B3B3BA5A5A5CECECE28
      2828000000272727CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFD2D2D23F3F3F313131A6A6A6DEDEDEFFFFFFFFFFFFFFFFFFDBDBDB9494
      94202020101010000000272727CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFD8D8D8292929696969DFDFDFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFD7D7D7494949090909CDCDCDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5454545C5C5CFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC3939397B7B7BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B61A1A1AD9D9D9FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3
      C3C3131313D3D3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF616161
      797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF515151848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF232323BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9292924A4A4AFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF080808DADADAFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B32F2F2F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF060606DCDCDCFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB6B6B62D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1D
      C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9C9C9C444444FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF555555858585FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5E7C7C7CFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFA6A6A6272727DFDFDFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D0131313C7C7C7
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3D3D7B7B7BFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52
      5252656565FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C8C8C81B1B1B8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFE0E0E06A6A6A313131D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC0C0C0222222565656C9C9C9FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBABABA3D3D3D393939D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D66E6E6E11111137
      37376161616E6E6E5E5E5E2A2A2A1A1A1A838383DDDDDDFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFDCDCDCA5A5A5828282747474858585B0B0B0DFDFDFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF}
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnLocalizarClick
  end
  object mnuFormulario: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 352
    Top = 240
    object mniLocalizar: TMenuItem
      Caption = 'Localizar'
      OnClick = mniLocalizarClick
    end
    object mniAtualizar: TMenuItem
      Caption = 'Atualizar'
      OnClick = mniAtualizarClick
    end
    object mniNovo: TMenuItem
      Caption = 'Novo'
      OnClick = mniNovoClick
    end
    object mniSelecionar: TMenuItem
      Caption = 'Selecionar'
      OnClick = mniSelecionarClick
    end
    object mniMinimizar: TMenuItem
      Caption = 'Minimizar'
      OnClick = mniMinimizarClick
    end
    object mniFechar: TMenuItem
      Caption = 'Fechar'
      OnClick = mniFecharClick
    end
  end
end
