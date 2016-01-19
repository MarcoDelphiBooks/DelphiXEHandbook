unit UmlDemo_Dialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids;

type
  TUmlDialogForm = class(TForm)
    btnPick: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  UmlDialogForm: TUmlDialogForm;

implementation

uses
  UmlDemo_DataModule;

{$R *.dfm}

{ TUmlDialogForm }

constructor TUmlDialogForm.Create(AOwner: TComponent);
begin
  inherited;
  DataSource1.DataSet := UmlDataModule.ClientDataSet1;
end;

end.
