object FormCalc: TFormCalc
  Left = 0
  Top = 0
  Caption = 'FormCalc'
  ClientHeight = 332
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 446
    Height = 25
    Caption = #1057#1102#1076#1072' '#1079#1072#1085#1086#1089#1080#1084' '#1084#1072#1090#1088#1080#1094#1091', '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1087#1088#1086#1073#1077#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 191
    Width = 522
    Height = 25
    Caption = #1057#1102#1076#1072' '#1074#1087#1080#1089#1099#1074#1072#1077#1084' '#1084#1072#1089#1089#1080#1074' '#1087#1088#1072#1074#1086#1081' '#1095#1072#1089#1090#1080' '#1095#1077#1088#1077#1079' '#1087#1088#1086#1073#1077#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 239
    Width = 184
    Height = 25
    Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1086#1090#1074#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 0
    Top = 48
    Width = 553
    Height = 121
    Lines.Strings = (
      '2 3 -1 4 -5'
      '-1 1 2 -3 4'
      '3 2 -1 1 -2'
      '4 5 -2 3 -1'
      '5 6 -3 4 -2')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 297
    Width = 75
    Height = 25
    Caption = #1056#1077#1096#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 222
    Width = 545
    Height = 21
    TabOrder = 2
    Text = '1 2 3 4 5'
  end
  object Edit2: TEdit
    Left = 8
    Top = 270
    Width = 545
    Height = 21
    TabOrder = 3
  end
end
