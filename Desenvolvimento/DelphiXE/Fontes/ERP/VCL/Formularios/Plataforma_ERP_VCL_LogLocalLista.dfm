object PlataformaERPVCLLogLocalLista: TPlataformaERPVCLLogLocalLista
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'PlataformaERPVCLLogLocalLista'
  ClientHeight = 360
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 58
    Height = 13
    Caption = 'Arquivo log:'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 64
    Height = 13
    Caption = 'Informa'#231#245'es:'
  end
  object ButtonedEdit1: TButtonedEdit
    AlignWithMargins = True
    Left = 8
    Top = 24
    Width = 681
    Height = 22
    Margins.Left = 8
    Margins.Top = 24
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ListView1: TListView
    AlignWithMargins = True
    Left = 8
    Top = 72
    Width = 681
    Height = 248
    Margins.Left = 8
    Margins.Top = 18
    Margins.Right = 8
    Margins.Bottom = 40
    Align = alClient
    Columns = <
      item
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
        Caption = 'Aplica'#231#227'o'
        Width = 0
      end
      item
        Alignment = taRightJustify
        Caption = 'ID Usu'#225'rio'
        Width = 0
      end
      item
        Caption = 'Usu'#225'rio'
        Width = 0
      end
      item
        Caption = 'Cr'#237'tico'
        Width = 0
      end
      item
        Alignment = taCenter
        Caption = 'Data e hora'
        Width = 100
      end
      item
        Caption = 'Mensagem'
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
end
