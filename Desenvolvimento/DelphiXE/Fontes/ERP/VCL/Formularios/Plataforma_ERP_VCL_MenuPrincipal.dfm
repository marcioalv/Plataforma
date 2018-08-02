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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 727
    Height = 425
    Align = alClient
    Center = True
    Stretch = True
    ExplicitLeft = 440
    ExplicitTop = 224
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object mnuFormulario: TMainMenu
    Left = 280
    Top = 80
    object mniAplicacao: TMenuItem
      Caption = '&Aplica'#231#227'o'
      object mnuConfiguracoes: TMenuItem
        Caption = 'Configura'#231#245'es'
        object Resoluodetela1: TMenuItem
          Caption = 'Resolu'#231#227'o de tela'
        end
      end
      object mniLogUsoAplicacao: TMenuItem
        Caption = 'Log de uso'
        object mniLogUsoLocal: TMenuItem
          Caption = 'Log detalhado local do computador'
          OnClick = mniLogUsoLocalClick
        end
      end
      object Controledeacesso1: TMenuItem
        Caption = 'Controle de acesso'
        object mniUsuarios: TMenuItem
          Caption = 'Usu'#225'rios'
          OnClick = mniUsuariosClick
        end
        object mniTiposUsuarios: TMenuItem
          Caption = 'Tipos de usu'#225'rios'
          OnClick = mniTiposUsuariosClick
        end
      end
    end
  end
end
