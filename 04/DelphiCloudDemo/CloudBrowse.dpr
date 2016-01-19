program CloudBrowse;

uses
  Forms,
  CloudBrowse_MainForm in 'CloudBrowse_MainForm.pas' {Form13},
  AzureTableXmlInterfaces in 'AzureTableXmlInterfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
