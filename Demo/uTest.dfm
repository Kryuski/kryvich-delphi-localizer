object Form1: TForm1
  Left = 237
  Top = 276
  Caption = #1058#1101#1089#1090#1072#1074#1072#1077' '#1087#1088#1099#1082#1083#1072#1076#1072#1085#1085#1077
  ClientHeight = 426
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial Unicode MS'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 281
    Height = 73
    TabStop = False
    Lines.Strings = (
      #1043#1101#1090#1099' '#1090#1101#1082#1089#1090' '#1085#1072#1087#1110#1089#1072#1085#1099' '#1085#1072' '#1073#1077#1083#1072#1088#1091#1089#1082#1072#1081' '#1084#1086#1074#1077'.'
      ''
      #1044#1101#1083#1100#1092#1110#1081#1089#1082#1110' '#1083#1072#1082#1072#1083#1110#1079#1072#1090#1072#1088' '#1050#1088#1099#1074#1110#1095#1072'.')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnStrings: TButton
    Left = 303
    Top = 8
    Width = 159
    Height = 25
    Caption = #1056#1101#1089#1091#1088#1089#1085#1099#1103' '#1088#1072#1076#1082#1110
    TabOrder = 1
    OnClick = btnStringsClick
  end
  object btnNewForm: TButton
    Left = 303
    Top = 39
    Width = 159
    Height = 25
    Action = actOpen
    Caption = #1040#1076#1095#1099#1085#1110#1094#1100' ('#1082#1085#1086#1087#1082#1072')'
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 127
    Top = 95
    Width = 335
    Height = 115
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial Unicode MS'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OrderNo'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 137
        Visible = True
      end>
  end
  object cbAutoTranslation: TCheckBox
    Left = 305
    Top = 72
    Width = 159
    Height = 17
    Caption = #1040#1118#1090#1072#1087#1077#1088#1072#1082#1083#1072#1076
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = cbAutoTranslationClick
  end
  object ListView1: TListView
    Left = 127
    Top = 225
    Width = 335
    Height = 56
    Columns = <
      item
        Caption = #8470
        MinWidth = 50
        Width = 55
      end
      item
        Caption = #1053#1072#1079#1074#1072
        Width = 150
      end
      item
        Caption = #1050#1086#1096#1090
        Width = 55
      end
      item
        Caption = #1042#1072#1083#1102#1090#1072
        Width = 60
      end>
    TabOrder = 6
    ViewStyle = vsReport
  end
  object pnlLanguage: TPanel
    Left = 8
    Top = 87
    Width = 113
    Height = 194
    TabOrder = 4
    object btnLoad: TButton
      Left = 6
      Top = 98
      Width = 100
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1110#1094#1100
      TabOrder = 1
      OnClick = btnLoadClick
    end
    object rgLanguage: TRadioGroup
      Left = 6
      Top = 8
      Width = 100
      Height = 81
      Caption = #1040#1073#1103#1088#1099#1094#1077' '#1084#1086#1074#1091':'
      ItemIndex = 0
      Items.Strings = (
        #1040#1085#1075#1077#1083#1100#1089#1082#1072#1103
        #1041#1077#1083#1072#1088#1091#1089#1082#1072#1103
        #1056#1091#1089#1082#1072#1103)
      TabOrder = 0
    end
    object btnTranslate: TButton
      Left = 6
      Top = 129
      Width = 100
      Height = 24
      Caption = #1055#1077#1088#1072#1082#1083#1072#1089#1094#1110
      TabOrder = 2
      OnClick = btnTranslateClick
    end
    object btnTranslateAll: TButton
      Left = 6
      Top = 159
      Width = 100
      Height = 24
      Caption = #1055#1077#1088#1072#1082#1083#1072#1089#1094#1110' '#1118#1089#1077' !!!'
      TabOrder = 3
      OnClick = btnTranslateAllClick
    end
  end
  object btnQuit: TButton
    Left = 368
    Top = 363
    Width = 94
    Height = 31
    Action = actQuit
    TabOrder = 7
  end
  inline Frame11: TFrame1
    Left = 8
    Top = 287
    Width = 450
    Height = 73
    TabOrder = 8
    TabStop = True
    ExplicitLeft = 8
    ExplicitTop = 287
    ExplicitWidth = 450
    ExplicitHeight = 73
    inherited gbInFrame: TGroupBox
      Left = 0
      Top = 4
      Width = 393
      Height = 66
      ExplicitLeft = 0
      ExplicitTop = 4
      ExplicitWidth = 393
      ExplicitHeight = 66
      inherited lbInFrame: TListBox
        Left = 10
        ItemHeight = 14
        ExplicitLeft = 10
      end
      inherited mmInFrame: TMemo
        Lines.Strings = (
          #1053#1086#1074#1099' '#1090#1101#1082#1089#1090' '#1076#1083#1103' '#1101#1083#1077#1084#1077#1085#1090#1072' '#1118' '
          #1092#1088#1101#1081#1084#1077)
      end
    end
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 363
    Width = 354
    Height = 54
    AutoSize = False
    Caption = 
      #1055#1072#1089#1087#1088#1072#1073#1091#1081#1094#1077' '#1079#1084#1103#1085#1110#1094#1100' '#1085#1072#1076#1087#1110#1089#1099' '#1085#1072' '#1092#1086#1088#1084#1077', '#1087#1072#1074#1099#1076#1072#1083#1103#1094#1100' '#1110' '#1087#1072#1087#1077#1088#1072#1085#1072#1079#1099#1074#1072#1094 +
      #1100' '#1101#1083#1077#1084#1077#1085#1090#1099' '#1082#1110#1088#1072#1074#1072#1085#1085#1103' '#1110' '#1088#1101#1089#1091#1088#1089#1085#1099#1103' '#1088#1072#1076#1082#1110', '#1082#1072#1073' '#1087#1072#1073#1072#1095#1099#1094#1100' '#1103#1082' '#1087#1088#1072#1094#1091#1077' '#1089 +
      #1110#1089#1090#1101#1084#1072' '#1082#1110#1088#1072#1074#1072#1085#1085#1103' '#1074#1077#1088#1089#1110#1103#1084#1110' '#1088#1072#1076#1082#1086#1118' (SVCS)'
    TabOrder = 9
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 136
    Top = 176
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 176
    object ClientDataSet1ID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
    end
    object ClientDataSet1OrderNo: TStringField
      DisplayLabel = #1040#1088#1090#1099#1082#1091#1083
      FieldName = 'OrderNo'
      Size = 15
    end
    object ClientDataSet1Name: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'Name'
    end
    object ClientDataSet1Description: TStringField
      DisplayLabel = #1040#1087#1110#1089#1072#1085#1085#1077
      FieldName = 'Description'
      Size = 100
    end
  end
  object MainMenu1: TMainMenu
    Left = 384
    Top = 176
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Action = actOpen
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Action = actQuit
      end
    end
    object N2: TMenuItem
      Caption = #1055#1088#1072#1118#1082#1072
    end
    object N3: TMenuItem
      Caption = #1040#1082#1085#1086
    end
    object N8: TMenuItem
      Caption = #1041#1110#1073#1083#1110#1103#1090#1101#1082#1110
      object DLL1: TMenuItem
        Action = actCallImplicitlyLinkedDLL
      end
      object DLL2: TMenuItem
        Action = actCallExplicitlyLinkedDLL
      end
      object N9: TMenuItem
        Action = actShowFormFromPackage
      end
    end
    object N4: TMenuItem
      Caption = #1044#1072#1074#1077#1076#1082#1072
    end
  end
  object ActionList1: TActionList
    Left = 424
    Top = 176
    object actOpen: TAction
      Caption = #1040#1076#1095#1099#1085#1110#1094#1100
      OnExecute = actOpenExecute
    end
    object actQuit: TAction
      Caption = #1042#1099#1081#1089#1094#1110
      OnExecute = actQuitExecute
    end
    object actCallImplicitlyLinkedDLL: TAction
      Caption = #1055#1072#1074#1077#1076#1072#1084#1083#1077#1085#1085#1077' '#1079' '#1085#1077#1074#1099#1103#1118#1085#1072' '#1079#1083#1091#1095#1072#1085#1072#1081' DLL'
      OnExecute = actCallImplicitlyLinkedDLLExecute
    end
    object actShowFormFromPackage: TAction
      Caption = #1058#1101#1089#1090#1072#1074#1072#1103' '#1092#1086#1088#1084#1072' '#1079' '#1087#1072#1082#1077#1090#1072
      OnExecute = actShowFormFromPackageExecute
    end
    object actCallExplicitlyLinkedDLL: TAction
      Caption = #1055#1072#1074#1077#1076#1072#1084#1083#1077#1085#1085#1077' '#1079' '#1074#1099#1103#1118#1085#1072' '#1079#1083#1091#1095#1072#1085#1072#1081' DLL'
      OnExecute = actCallExplicitlyLinkedDLLExecute
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.pas'
    Filter = 
      #1052#1086#1076#1091#1083#1110' '#1044#1101#1083#1100#1092#1110' (*.pas)|*.pas|'#1042#1101#1073'-'#1092#1072#1081#1083#1099' (*.htm;*.html)|*.htm;*.htm' +
      'l|'#1055#1088#1072#1077#1082#1090#1099' '#1044#1101#1083#1100#1092#1110' (*.dpr)|*.dpr'
    Title = #1040#1076#1095#1099#1085#1110#1094#1100' '#1092#1072#1081#1083
    Left = 416
    Top = 304
  end
end
