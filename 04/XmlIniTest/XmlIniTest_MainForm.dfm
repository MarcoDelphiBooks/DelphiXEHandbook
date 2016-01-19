object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'XmlIniTest'
  ClientHeight = 290
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnRead: TButton
    Left = 48
    Top = 32
    Width = 75
    Height = 25
    Caption = 'btnRead'
    TabOrder = 0
    OnClick = btnReadClick
  end
  object Memo1: TMemo
    Left = 168
    Top = 16
    Width = 345
    Height = 241
    TabOrder = 1
  end
  object btnWrite: TButton
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Caption = 'btnWrite'
    TabOrder = 2
    OnClick = btnWriteClick
  end
  object XMLDocument1: TXMLDocument
    Left = 72
    Top = 96
    DOMVendorDesc = 'MSXML'
  end
end
