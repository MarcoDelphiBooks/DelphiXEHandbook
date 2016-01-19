program ThreadedQueue;

uses
  Forms,
  ThreadedQueue_MainForm in 'ThreadedQueue_MainForm.pas' {FormThQueue},
  ThreadedQueue_ThreadClasses in 'ThreadedQueue_ThreadClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormThQueue, FormThQueue);
  Application.Run;
end.
