object FormThQueue: TFormThQueue
  Left = 0
  Top = 0
  Caption = 'ThreadedQueue'
  ClientHeight = 184
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 23
  object lblInfo: TLabel
    Left = 264
    Top = 76
    Width = 10
    Height = 23
    Caption = '0'
  end
  object btnPushThread: TButton
    Left = 56
    Top = 48
    Width = 169
    Height = 81
    Caption = 'btnPushThread'
    TabOrder = 0
    OnClick = btnPushThreadClick
  end
  object btnPopThread: TButton
    Left = 592
    Top = 52
    Width = 163
    Height = 73
    Caption = 'btnPopThread'
    TabOrder = 1
    OnClick = btnPopThreadClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 232
    Top = 16
  end
end
