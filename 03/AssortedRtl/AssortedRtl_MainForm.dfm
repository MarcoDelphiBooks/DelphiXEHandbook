object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'AssortedRtl'
  ClientHeight = 484
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnNoCores: TButton
    Left = 32
    Top = 22
    Width = 137
    Height = 25
    Caption = 'No of Cores'
    TabOrder = 0
    OnClick = btnNoCoresClick
  end
  object Memo1: TMemo
    Left = 216
    Top = 24
    Width = 489
    Height = 433
    TabOrder = 1
  end
  object Button2: TButton
    Left = 32
    Top = 64
    Width = 137
    Height = 25
    Caption = 'timezone'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 112
    Width = 137
    Height = 25
    Caption = 'home path'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 32
    Top = 168
    Width = 137
    Height = 25
    Caption = 'split'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 32
    Top = 224
    Width = 137
    Height = 25
    Caption = 'split tstrlist'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button1: TButton
    Left = 32
    Top = 272
    Width = 137
    Height = 25
    Caption = 'interlocked'
    TabOrder = 6
    OnClick = Button1Click
  end
end
