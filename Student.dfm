object StudentProgram: TStudentProgram
  Left = 0
  Top = 0
  Caption = 'StudentProgram'
  ClientHeight = 404
  ClientWidth = 557
  Color = clBtnFace
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
    Left = 200
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
    Width = 265
    Height = 210
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1089#1090#1091#1076#1077#1085#1090#1077':'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object LabelStudentFirstName: TLabel
      Left = 16
      Top = 86
      Width = 45
      Height = 25
      Caption = #1048#1084#1103':'
    end
    object LabelStudentLastName: TLabel
      Left = 16
      Top = 31
      Width = 94
      Height = 25
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object LabelStudentMiddleName: TLabel
      Left = 16
      Top = 142
      Width = 96
      Height = 25
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 280
    Width = 265
    Height = 116
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077':'
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object LabelTeacherLastName: TLabel
      Left = 16
      Top = 30
      Width = 94
      Height = 25
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object LabelTeacherFirstName: TLabel
      Left = 65
      Top = 55
      Width = 45
      Height = 25
      Caption = #1048#1084#1103':'
    end
    object LabelTeacherMiddleName: TLabel
      Left = 16
      Top = 78
      Width = 96
      Height = 25
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    end
  end
  object MainMenu1: TMainMenu
    Left = 384
    Top = 168
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
