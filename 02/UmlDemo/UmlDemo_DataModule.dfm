object UmlDataModule: TUmlDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 235
  Width = 357
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 96
  end
end
