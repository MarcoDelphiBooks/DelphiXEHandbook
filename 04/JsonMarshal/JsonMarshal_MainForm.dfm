object FormJson: TFormJson
  Left = 0
  Top = 0
  Caption = 'JsonMarshal'
  ClientHeight = 331
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnMarshal: TButton
    Left = 24
    Top = 16
    Width = 122
    Height = 25
    Caption = 'btnMarshal'
    TabOrder = 0
    OnClick = btnMarshalClick
  end
  object Memo1: TMemo
    Left = 168
    Top = 18
    Width = 401
    Height = 287
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnUnmarshal: TButton
    Left = 24
    Top = 64
    Width = 122
    Height = 25
    Caption = 'btnUnmarshal'
    TabOrder = 2
    OnClick = btnUnmarshalClick
  end
  object btnMarshalList: TButton
    Left = 24
    Top = 152
    Width = 122
    Height = 25
    Caption = 'btnMarshalList'
    TabOrder = 3
    OnClick = btnMarshalListClick
  end
  object btnUnmarshalList: TButton
    Left = 24
    Top = 192
    Width = 122
    Height = 25
    Caption = 'btnUnmarshalList'
    TabOrder = 4
    OnClick = btnUnmarshalListClick
  end
end
