object FormRegExp: TFormRegExp
  Left = 0
  Top = 0
  Caption = 'RegExp'
  ClientHeight = 290
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 304
    Top = 16
    Width = 26
    Height = 13
    Caption = 'Input'
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 36
    Height = 13
    Caption = 'Pattern'
  end
  object btnMatches: TButton
    Left = 160
    Top = 70
    Width = 121
    Height = 25
    Caption = 'btnMatches'
    TabOrder = 0
    OnClick = btnMatchesClick
  end
  object Memo1: TMemo
    Left = 304
    Top = 59
    Width = 369
    Height = 206
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object edInput: TEdit
    Left = 304
    Top = 32
    Width = 369
    Height = 21
    TabOrder = 2
    Text = 'My name is Marco or Mark'
  end
  object edPattern: TEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Marco|Mark'
  end
  object btnIsMatch: TButton
    Left = 160
    Top = 30
    Width = 121
    Height = 25
    Caption = 'btnIsMatch'
    TabOrder = 4
    OnClick = btnIsMatchClick
  end
  object btnMatchPlusNext: TButton
    Left = 160
    Top = 112
    Width = 121
    Height = 25
    Caption = 'btnMatchPlusNext'
    TabOrder = 5
    OnClick = btnMatchPlusNextClick
  end
  object cbIgnoreCase: TCheckBox
    Left = 24
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Ignore Case'
    TabOrder = 6
  end
  object btnReplace: TButton
    Left = 160
    Top = 151
    Width = 121
    Height = 25
    Caption = 'btnReplace'
    TabOrder = 7
    OnClick = btnReplaceClick
  end
  object btnSplit: TButton
    Left = 160
    Top = 192
    Width = 121
    Height = 25
    Caption = 'btnSplit'
    TabOrder = 8
    OnClick = btnSplitClick
  end
  object btnCompiled: TButton
    Left = 160
    Top = 230
    Width = 121
    Height = 25
    Caption = 'btnCompiled'
    TabOrder = 9
    OnClick = btnCompiledClick
  end
end
