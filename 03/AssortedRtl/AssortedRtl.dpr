program AssortedRtl;

uses
  Forms,
  AssortedRtl_MainForm in 'AssortedRtl_MainForm.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
