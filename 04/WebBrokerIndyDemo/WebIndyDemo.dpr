program WebIndyDemo;
{$APPTYPE GUI}

uses
  Forms,
  WebReq,
  IdHTTPWebBrokerBridge,
  WebIndyDemo_MainForm in 'WebIndyDemo_MainForm.pas' {Form15},
  WebIndyDemo_WebModule in 'WebIndyDemo_WebModule.pas' {WebModule16: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm15, Form15);
  Application.Run;
end.
