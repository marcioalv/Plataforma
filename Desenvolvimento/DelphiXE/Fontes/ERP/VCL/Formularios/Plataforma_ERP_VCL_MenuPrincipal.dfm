object PlataformaERPVCLMenuPrincipal: TPlataformaERPVCLMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'PlataformaERPVCLMenuPrincipal'
  ClientHeight = 425
  ClientWidth = 727
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mnuFormulario
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mnuFormulario: TMainMenu
    Left = 280
    Top = 80
    object mniAplicacao: TMenuItem
      Caption = '&Aplica'#231#227'o'
      object mniLogUsoAplicacao: TMenuItem
        Caption = 'Log de uso da aplica'#231#227'o'
        object mniLogUsoLocal: TMenuItem
          Caption = 'Log detalhado local do computador'
          OnClick = mniLogUsoLocalClick
        end
      end
    end
  end
end
