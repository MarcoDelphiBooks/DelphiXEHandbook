object UmlDialogForm: TUmlDialogForm
  Left = 0
  Top = 0
  Caption = 'UmlDialogForm'
  ClientHeight = 290
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object btnPick: TButton
    Left = 464
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnPick'
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 16
    Width = 297
    Height = 257
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    Left = 376
    Top = 200
  end
end
