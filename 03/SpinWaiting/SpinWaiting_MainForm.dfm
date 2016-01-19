object FormSpin: TFormSpin
  Left = 0
  Top = 0
  Caption = 'SpinWaiting'
  ClientHeight = 281
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 64
    Top = 72
    Width = 417
    Height = 17
    TabOrder = 0
  end
  object ProgressBar2: TProgressBar
    Left = 64
    Top = 112
    Width = 417
    Height = 17
    TabOrder = 1
  end
  object ProgressBar3: TProgressBar
    Left = 64
    Top = 152
    Width = 417
    Height = 17
    TabOrder = 2
  end
  object ProgressBar4: TProgressBar
    Left = 64
    Top = 192
    Width = 417
    Height = 17
    TabOrder = 3
  end
  object btnSleep: TButton
    Left = 145
    Top = 24
    Width = 75
    Height = 25
    Caption = 'btnSleep'
    TabOrder = 4
    OnClick = btnSleepClick
  end
  object btnNoSync: TButton
    Left = 64
    Top = 24
    Width = 75
    Height = 25
    Caption = 'btnNoSync'
    TabOrder = 5
    OnClick = btnNoSyncClick
  end
  object btnSpin: TButton
    Left = 226
    Top = 24
    Width = 75
    Height = 25
    Caption = 'btnSpin'
    TabOrder = 6
    OnClick = btnSpinClick
  end
  object Memo1: TMemo
    Left = 512
    Top = 26
    Width = 281
    Height = 223
    TabOrder = 7
  end
end
