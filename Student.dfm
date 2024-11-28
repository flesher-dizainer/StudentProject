object StudentProgram: TStudentProgram
  Left = 0
  Top = 0
  Caption = 'StudentProgram'
  ClientHeight = 363
  ClientWidth = 516
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelMainForm: TLabel
    Left = 148
    Top = 8
    Width = 190
    Height = 33
    Caption = #1043#1083#1072#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GroupBoxStudent: TGroupBox
    Left = 8
    Top = 47
    Width = 233
    Height = 178
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1089#1090#1091#1076#1077#1085#1090#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object LabelStudentFirstName: TLabel
      Left = 16
      Top = 73
      Width = 35
      Height = 19
      Caption = #1048#1084#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelStudentLastName: TLabel
      Left = 14
      Top = 23
      Width = 71
      Height = 19
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object LabelStudentMiddleName: TLabel
      Left = 14
      Top = 123
      Width = 75
      Height = 19
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelSLN: TLabel
      Left = 16
      Top = 48
      Width = 53
      Height = 19
      Caption = #1055#1077#1090#1088#1086#1074
    end
    object LabelSFN: TLabel
      Left = 16
      Top = 98
      Width = 36
      Height = 19
      Caption = #1055#1105#1090#1088
    end
    object LabelSMN: TLabel
      Left = 16
      Top = 148
      Width = 71
      Height = 19
      Caption = #1055#1077#1090#1088#1086#1074#1080#1095
    end
  end
  object GroupBox1: TGroupBox
    Left = 247
    Top = 47
    Width = 265
    Height = 178
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object LabelTeacherLastName: TLabel
      Left = 16
      Top = 23
      Width = 71
      Height = 19
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelTeacherFirstName: TLabel
      Left = 17
      Top = 73
      Width = 35
      Height = 19
      Caption = #1048#1084#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelTeacherMiddleName: TLabel
      Left = 16
      Top = 123
      Width = 75
      Height = 19
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelTLN: TLabel
      Left = 16
      Top = 48
      Width = 73
      Height = 19
      Caption = #1052#1080#1088#1086#1085#1086#1074#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelTFN: TLabel
      Left = 16
      Top = 98
      Width = 46
      Height = 19
      Caption = #1052#1072#1088#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelTMN: TLabel
      Left = 16
      Top = 148
      Width = 70
      Height = 19
      Caption = #1048#1074#1072#1085#1086#1074#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 231
    Width = 504
    Height = 123
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 23
      Width = 74
      Height = 19
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 73
      Width = 50
      Height = 19
      Caption = #1040#1076#1088#1077#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelOrgName: TLabel
      Left = 17
      Top = 48
      Width = 5
      Height = 19
    end
    object LabelOrgAddr: TLabel
      Left = 14
      Top = 98
      Width = 5
      Height = 19
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object inf: TMenuItem
      Caption = 'InfoForm'
      OnClick = infClick
    end
    object editor: TMenuItem
      Caption = 'EditorForm'
      OnClick = editorClick
    end
    object Calc: TMenuItem
      Caption = 'CalcForm'
      OnClick = CalcClick
    end
  end
end
