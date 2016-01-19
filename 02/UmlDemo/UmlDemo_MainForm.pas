unit UmlDemo_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TUmlMainForm = class(TForm)
    btnDialog: TButton;
    procedure btnDialogClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UmlMainForm: TUmlMainForm;

implementation

uses UmlDemo_Dialog;

{$R *.dfm}

procedure TUmlMainForm.btnDialogClick(Sender: TObject);
begin
  UmlDialogForm := TUmlDialogForm.Create(self);
  UmlDialogForm.Show;
end;

end.
