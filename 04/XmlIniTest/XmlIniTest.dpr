program XmlIniTest;

uses
  Forms,
  XmlIniTest_MainForm in 'XmlIniTest_MainForm.pas' {Form13};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
