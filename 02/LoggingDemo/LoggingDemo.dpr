program LoggingDemo;

uses
  Forms,
  Logging_MainForm in 'Logging_MainForm.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
