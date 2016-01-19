unit WebIndyDemo_WebModule;

interface

uses
  SysUtils, Classes, HTTPApp, HTTPProd;

type
  TWebModule16 = class(TWebModule)
    WebFileDispatcher1: TWebFileDispatcher;
    PageProducer1: TPageProducer;
    procedure WebModule16DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule16;

implementation

{$R *.dfm}

procedure TWebModule16.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
var
  I: Integer;
begin
  if (TagString = 'randomlist') then
  begin
    for I := 1 to 20 do
      ReplaceText := ReplaceText + 'Item ' + IntToStr (Random (100000)) + ' - ';
  end;
end;

procedure TWebModule16.WebModule16DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<html><heading/><body>Web Server Application</body></html>';
end;

initialization
  Randomize;

end.
