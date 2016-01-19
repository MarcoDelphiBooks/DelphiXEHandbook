unit UmlDemo_DataModule;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TUmlDataModule = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UmlDataModule: TUmlDataModule;

implementation

{$R *.dfm}

procedure TUmlDataModule.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  ClientDataSet1.CreateDataSet;
  for I := 1 to 10 do
    ClientDataSet1.InsertRecord([I, 'Item ' + IntToStr (I)]);
end;

end.
