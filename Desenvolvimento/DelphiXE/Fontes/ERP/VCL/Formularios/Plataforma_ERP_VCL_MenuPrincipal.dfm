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
    Height = 384
    Align = alClient
    Center = True
    Stretch = True
    OnClick = Image1Click
    ExplicitLeft = 440
    ExplicitTop = 224
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object panStatusBar: TPanel
    Left = 0
    Top = 384
    Width = 727
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'panStatusBar'
    Color = clMenuBar
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object lblHostName: TLabel
      Left = 168
      Top = 14
      Width = 96
      Height = 13
      Caption = 'ComputerHostName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAppUserName: TLabel
      Left = 304
      Top = 14
      Width = 101
      Height = 13
      Caption = 'ApplicationUserName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCalendario: TLabel
      Left = 16
      Top = 14
      Width = 51
      Height = 13
      Caption = 'Calendario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblHorario: TLabel
      Left = 96
      Top = 14
      Width = 38
      Height = 14
      Caption = 'Horario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object mnuFormulario: TMainMenu
    Left = 280
    Top = 80
    object mniCompras: TMenuItem
      Caption = 'Compras'
      object mniFornecedores: TMenuItem
        Caption = 'Fornecedores'
        OnClick = mniFornecedoresClick
      end
    end
    object mniFiscal: TMenuItem
      Caption = 'Fiscal'
      object mniFiscalCadastros: TMenuItem
        Caption = 'Cadastros'
        object mniEmpresas: TMenuItem
          Caption = 'Empresas'
          OnClick = mniEmpresasClick
        end
        object mniFiliais: TMenuItem
          Caption = 'Filiais'
          OnClick = mniFiliaisClick
        end
        object mniColigadas: TMenuItem
          Caption = 'Coligadas'
          OnClick = mniColigadasClick
        end
      end
    end
    object mniAplicacao: TMenuItem
      Caption = '&Aplica'#231#227'o'
      object mniLogoff: TMenuItem
        Caption = 'Logoff'
        OnClick = mniLogoffClick
      end
      object mniTrocarUsuario: TMenuItem
        Caption = 'Trocar usu'#225'rio'
        OnClick = mniTrocarUsuarioClick
      end
      object mniTrocarSenhaUsuario: TMenuItem
        Caption = 'Trocar senha usu'#225'rio'
        OnClick = mniTrocarSenhaUsuarioClick
      end
      object mniAplicacaoSeparador1: TMenuItem
        Caption = '-'
      end
      object mniConfiguracoes: TMenuItem
        Caption = 'Configura'#231#245'es'
        object mniResolucaoTela1250x700: TMenuItem
          Caption = 'Resolu'#231#227'o tela: 1.250px x 700px'
          OnClick = mniResolucaoTela1250x700Click
        end
      end
      object mniControleAcesso: TMenuItem
        Caption = 'Controle acesso'
        object mniUsuarios: TMenuItem
          Caption = 'Usu'#225'rios'
          OnClick = mniUsuariosClick
        end
        object mniPerfisUsuario: TMenuItem
          Caption = 'Perfis usu'#225'rio'
          OnClick = mniPerfisUsuarioClick
        end
        object mniTiposUsuarios: TMenuItem
          Caption = 'Tipos usu'#225'rios'
          OnClick = mniTiposUsuariosClick
        end
      end
      object mniInstalacao: TMenuItem
        Caption = 'Instala'#231#227'o'
        object mniConfiguracaoBaseDados: TMenuItem
          Caption = 'Configura'#231#227'o base de dados'
          OnClick = mniConfiguracaoBaseDadosClick
        end
        object mniInstalacaoCadastros: TMenuItem
          Caption = 'Cadastros'
          object mniLicencas: TMenuItem
            Caption = 'Licen'#231'as'
            OnClick = mniLicencasClick
          end
          object mniBases: TMenuItem
            Caption = 'Bases de dados'
            OnClick = mniBasesClick
          end
          object mniRotinasAplicacao: TMenuItem
            Caption = 'Rotinas aplica'#231#227'o'
            OnClick = mniRotinasAplicacaoClick
          end
          object mniRegistroAcao: TMenuItem
            Caption = 'A'#231#245'es com registros'
            OnClick = mniRegistroAcaoClick
          end
          object mniPessoas: TMenuItem
            Caption = 'Pessoas'
            OnClick = mniPessoasClick
          end
          object mniRegimeTributario: TMenuItem
            Caption = 'Regime Tribut'#225'rio'
            OnClick = mniRegimeTributarioClick
          end
          object mniLogradouros: TMenuItem
            Caption = 'Logradouros'
            OnClick = mniLogradourosClick
          end
        end
        object mniInstalacaoNumeradores: TMenuItem
          Caption = 'Numeradores'
          object mniNumeradorBase: TMenuItem
            Caption = 'Base'
            OnClick = mniNumeradorBaseClick
          end
          object mniNumeradorLicenca: TMenuItem
            Caption = 'Licen'#231'a'
            OnClick = mniNumeradorLicencaClick
          end
        end
      end
      object mniLogs: TMenuItem
        Caption = 'Logs'
        object mniLogLocal: TMenuItem
          Caption = 'Log local'
          OnClick = mniLogLocalClick
        end
      end
      object mniAplicacaoSeparador2: TMenuItem
        Caption = '-'
      end
      object mniEncerrar: TMenuItem
        Caption = 'Encerrar'
        OnClick = mniEncerrarClick
      end
    end
  end
  object timInicializacao: TTimer
    Enabled = False
    Interval = 125
    OnTimer = timInicializacaoTimer
    Left = 216
    Top = 200
  end
  object timStatusBar: TTimer
    Interval = 5000
    OnTimer = timStatusBarTimer
    Left = 456
    Top = 112
  end
end
