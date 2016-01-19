program SpinWaiting;

uses
  Forms,
  SpinWaiting_MainForm in 'SpinWaiting_MainForm.pas' {FormSpin},
  SpinWaiting_Threads in 'SpinWaiting_Threads.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSpin, FormSpin);
  Application.Run;
end.
