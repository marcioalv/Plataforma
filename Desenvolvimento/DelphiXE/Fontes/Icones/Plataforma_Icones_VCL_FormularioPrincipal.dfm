object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form3'
  ClientHeight = 315
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object shaBackground: TShape
    Left = 16
    Top = 16
    Width = 233
    Height = 193
    Brush.Color = clBtnFace
  end
  object imgIcone: TImage
    Left = 24
    Top = 24
    Width = 217
    Height = 177
    Center = True
  end
  object btnCorDefinir: TBitBtn
    Left = 16
    Top = 224
    Width = 233
    Height = 33
    Caption = 'Definir cor de fundo'
    TabOrder = 0
    OnClick = btnCorDefinirClick
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 264
    Width = 233
    Height = 33
    Caption = 'Escolher '#237'cone ...'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object dlgArquivo: TOpenDialog
    Left = 136
    Top = 56
  end
end
