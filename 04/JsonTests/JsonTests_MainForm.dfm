object FormJson: TFormJson
  Left = 0
  Top = 0
  Caption = 'JsonTests'
  ClientHeight = 345
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnParseObj: TButton
    Left = 8
    Top = 135
    Width = 113
    Height = 25
    Caption = 'btnParseObj'
    TabOrder = 0
    OnClick = btnParseObjClick
  end
  object btnParseRESTResult: TButton
    Left = 8
    Top = 174
    Width = 113
    Height = 25
    Caption = 'btnParseRESTResult'
    TabOrder = 1
    OnClick = btnParseRESTResultClick
  end
  object Memo1: TMemo
    Left = 144
    Top = 8
    Width = 541
    Height = 329
    TabOrder = 2
  end
  object btnValues: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'btnValues'
    TabOrder = 3
    OnClick = btnValuesClick
  end
  object btnSimpleArray: TButton
    Left = 8
    Top = 40
    Width = 113
    Height = 25
    Caption = 'btnSimpleArray'
    TabOrder = 4
    OnClick = btnSimpleArrayClick
  end
  object btnSimpleObject: TButton
    Left = 8
    Top = 71
    Width = 113
    Height = 25
    Caption = 'btnSimpleObject'
    TabOrder = 5
    OnClick = btnSimpleObjectClick
  end
  object btnDbxDataset: TButton
    Left = 8
    Top = 231
    Width = 113
    Height = 25
    Caption = 'btnDbxDataset'
    TabOrder = 6
    OnClick = btnDbxDatasetClick
  end
  object FBCONNECTION: TSQLConnection
    ConnectionName = 'FBCONNECTION'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=Firebird'
      
        'Database=C:\Program Files\Firebird\Firebird2.1\examples\empbuild' +
        '\EMPLOYEE.FDB'
      'rolename=RoleName'
      'user_name=sysdba'
      'password=masterkey'
      'sqldialect=3'
      'localecode=0000'
      'blobsize=-1'
      'commitretain=False'
      'waitonlocks=True'
      'isolationlevel=ReadCommitted'
      'trim char=False')
    VendorLib = 'fbclient.DLL'
    Left = 610
    Top = 26
  end
end
