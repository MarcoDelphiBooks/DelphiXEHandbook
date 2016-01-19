program StringConvert;

uses
  Forms,
  StringConvertForm in 'StringConvertForm.pas' {FormStringConvert};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormStringConvert, FormStringConvert);
  Application.Run;
end.
