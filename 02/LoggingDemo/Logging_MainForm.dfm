object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'LoggingDemo'
  ClientHeight = 203
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnSimpleLogs: TButton
    Left = 40
    Top = 48
    Width = 137
    Height = 25
    Caption = 'Simple Logs'
    TabOrder = 0
    OnClick = btnSimpleLogsClick
  end
  object BtnMethodsTracing: TButton
    Left = 40
    Top = 104
    Width = 137
    Height = 25
    Caption = 'Methods Tracing'
    TabOrder = 1
    OnClick = BtnMethodsTracingClick
  end
end
