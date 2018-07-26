object PlataformaERPVCLLogRegistroLista: TPlataformaERPVCLLogRegistroLista
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de logs do registro'
  ClientHeight = 621
  ClientWidth = 994
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
    994
    621)
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
  object panFormulario: TPanel
    AlignWithMargins = True
    Left = 48
    Top = 16
    Width = 930
    Height = 541
    Margins.Left = 48
    Margins.Top = 16
    Margins.Right = 16
    Margins.Bottom = 64
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'panFormulario'
    Color = clWindow
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lvwLista: TListView
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 910
      Height = 521
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      Columns = <
        item
          Width = 0
        end
        item
          Alignment = taRightJustify
          Caption = 'Sequencial'
          Width = 0
        end
        item
          Alignment = taCenter
          Caption = 'Local'
          Width = 165
        end
        item
          Alignment = taCenter
          Caption = 'Servidor'
          Width = 165
        end
        item
          Caption = 'Base ID'
          Width = 0
        end
        item
          Caption = 'Base'
          Width = 0
        end
        item
          Caption = 'A'#231#227'o ID'
          Width = 0
        end
        item
          Caption = 'A'#231#227'o'
          Width = 0
        end
        item
          Caption = 'HostName'
          Width = 0
        end
        item
          Caption = 'UserName'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio Base ID'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio ID'
          Width = 0
        end
        item
          Caption = 'Usu'#225'rio'
          Width = 0
        end
        item
          Caption = 'Mensagem'
          Width = 350
        end
        item
          Caption = 'Dados'
          Width = 0
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
      OnCustomDrawItem = lvwListaCustomDrawItem
      OnCustomDrawSubItem = lvwListaCustomDrawSubItem
      OnDblClick = lvwListaDblClick
      OnKeyPress = lvwListaKeyPress
    end
  end
  object btnFechar: TButton
    Left = 905
    Top = 572
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnFecharClick
  end
  object btnSelecionar: TButton
    Left = 728
    Top = 572
    Width = 90
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Selecionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSelecionarClick
  end
  object btnMinimizar: TButton
    Left = 825
    Top = 572
    Width = 73
    Height = 33
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Minimizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnMinimizarClick
  end
end
