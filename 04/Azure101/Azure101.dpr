program Azure101;

uses
  Forms,
  Azure101_MainForm in 'Azure101_MainForm.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
