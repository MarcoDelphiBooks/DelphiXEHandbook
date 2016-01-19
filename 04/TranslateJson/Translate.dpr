program Translate;

uses
  Forms,
  TranslateMainForm in 'TranslateMainForm.pas' {TranslateForm},
  BabelGoogle in 'BabelGoogle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTranslateForm, TranslateForm);
  Application.Run;
end.
