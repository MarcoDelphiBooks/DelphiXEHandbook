program RegExPrimer;

uses
  Forms,
  RegExPrimer_MainForm in 'RegExPrimer_MainForm.pas' {FormRegExp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormRegExp, FormRegExp);
  Application.Run;
end.
