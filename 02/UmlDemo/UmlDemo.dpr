program UmlDemo;

uses
  Forms,
  UmlDemo_MainForm in 'UmlDemo_MainForm.pas' {UmlMainForm},
  UmlDemo_Dialog in 'UmlDemo_Dialog.pas' {UmlDialogForm},
  UmlDemo_DataModule in 'UmlDemo_DataModule.pas' {UmlDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUmlMainForm, UmlMainForm);
  Application.CreateForm(TUmlDataModule, UmlDataModule);
  Application.Run;
end.
