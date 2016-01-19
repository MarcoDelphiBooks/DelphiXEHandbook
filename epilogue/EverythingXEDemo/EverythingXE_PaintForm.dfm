object FormPaint: TFormPaint
  Left = 0
  Top = 0
  Caption = 'EverythingPaint'
  ClientHeight = 362
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object PopupMenu1: TPopupMenu
    Left = 80
    Top = 72
    object itemToAzure: TMenuItem
      Caption = 'to azure'
      OnClick = itemToAzureClick
    end
    object itemNewFolder: TMenuItem
      Caption = 'new folder'
      OnClick = itemNewFolderClick
    end
  end
  object AzureConnectionString1: TAzureConnectionString
    UseDevelopmentStorage = False
    UseDefaultEndpoints = True
    Protocol = 'http'
    Left = 80
    Top = 136
  end
end
