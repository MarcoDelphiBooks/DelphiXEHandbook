program CloudPublish;

uses
  Forms,
  CloudPublish_MainForm in 'CloudPublish_MainForm.pas' {FormCloudPublish};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCloudPublish, FormCloudPublish);
  Application.Run;
end.
