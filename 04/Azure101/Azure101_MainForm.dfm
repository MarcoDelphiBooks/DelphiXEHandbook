object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Azure 101'
  ClientHeight = 501
  ClientWidth = 710
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
  object btnConnect: TButton
    Left = 56
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 0
    OnClick = btnConnectClick
  end
  object AzureTableManagement1: TAzureTableManagement
    Left = 160
    Top = 32
    Width = 401
    Height = 154
    ConnectionInfo = AzureConnectionString1
    AdvancedFilterPrefix = '~'
    Active = False
  end
  object AzureBlobManagement1: TAzureBlobManagement
    Left = 160
    Top = 208
    Width = 401
    Height = 153
    RightClickSelect = True
    ConnectionInfo = AzureConnectionString1
    Active = False
  end
  object btnEntities: TButton
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Entities'
    TabOrder = 3
    OnClick = btnEntitiesClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 392
    Width = 697
    Height = 105
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object btnAddRow: TButton
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    Caption = 'AddRow'
    TabOrder = 5
    OnClick = btnAddRowClick
  end
  object btnBlobUrl: TButton
    Left = 56
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Blob Url'
    TabOrder = 6
    OnClick = btnBlobUrlClick
  end
  object CheckBox1: TCheckBox
    Left = 64
    Top = 152
    Width = 67
    Height = 17
    Caption = 'tweet'
    TabOrder = 7
  end
  object AzureConnectionString1: TAzureConnectionString
    UseDevelopmentStorage = False
    AccountName = 'marcocantu'
    UseDefaultEndpoints = True
    Protocol = 'http'
    Left = 72
    Top = 208
  end
end
