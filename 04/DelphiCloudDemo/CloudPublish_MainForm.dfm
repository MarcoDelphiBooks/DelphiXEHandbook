object FormCloudPublish: TFormCloudPublish
  Left = 0
  Top = 0
  Caption = 'CloudPublish'
  ClientHeight = 318
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 352
    Top = 144
    Width = 209
    Height = 129
    Stretch = True
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 32
    Width = 313
    Height = 241
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnPostOne: TButton
    Left = 352
    Top = 72
    Width = 98
    Height = 25
    Caption = 'btnPostOne'
    TabOrder = 1
    OnClick = btnPostOneClick
  end
  object btnPostAll: TButton
    Left = 464
    Top = 72
    Width = 97
    Height = 25
    Caption = 'btnPostAll'
    TabOrder = 2
    OnClick = btnPostAllClick
  end
  object btnCreateTable: TButton
    Left = 352
    Top = 30
    Width = 98
    Height = 25
    Caption = 'btnCreateTable'
    TabOrder = 3
    OnClick = btnCreateTableClick
  end
  object btnDeleteTable: TButton
    Left = 464
    Top = 30
    Width = 97
    Height = 25
    Caption = 'btnDeleteTable'
    TabOrder = 4
    OnClick = btnDeleteTableClick
  end
  object cdsBio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 24
    object cdsBioSpeciesNo: TFloatField
      FieldName = 'Species No'
    end
    object cdsBioCategory: TStringField
      FieldName = 'Category'
      Size = 15
    end
    object cdsBioCommon_Name: TStringField
      FieldName = 'Common_Name'
      Size = 30
    end
    object cdsBioSpeciesName: TStringField
      FieldName = 'Species Name'
      Size = 40
    end
    object cdsBioLengthcm: TFloatField
      FieldName = 'Length (cm)'
    end
    object cdsBioLength_In: TFloatField
      FieldName = 'Length_In'
    end
    object cdsBioNotes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 50
    end
    object cdsBioGraphic: TGraphicField
      FieldName = 'Graphic'
      BlobType = ftGraphic
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsBio
    Left = 56
    Top = 80
  end
  object AzureConnectionString1: TAzureConnectionString
    UseDevelopmentStorage = False
    UseDefaultEndpoints = True
    Protocol = 'http'
    Left = 496
    Top = 112
  end
end
