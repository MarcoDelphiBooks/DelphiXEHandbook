program AlignTest;

uses
  Forms,
  AlignTest_MainForm in 'AlignTest_MainForm.pas' {Form10};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm10, Form10);
  Application.Run;
end.
