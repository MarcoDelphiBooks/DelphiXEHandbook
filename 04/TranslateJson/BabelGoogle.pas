unit BabelGoogle;

interface

uses
  Classes, idHttp, Controls, Forms;

type
  TBabelGoogleRest = class (TComponent)
  protected
    Http1: TIdHttp;
    FFromLang: string;
    FToLang: string;
    FActiveInForm: Boolean;
    procedure SetFromLang(const Value: string);
    procedure SetToLang(const Value: string);
    function ResultFromJSON (const strJson: string): string;
  public
    function DoTranslate (strIn: string): string; virtual;
    constructor Create(AOwner: TComponent); override;

    class function Translate (const strIn, langIn, langOut: string): string;
  published
    property FromLang: string read FFromLang write SetFromLang;
    property ToLang: string read FToLang write SetToLang;
  end;

implementation

uses
  SysUtils, idUri, StrUtils, DBXJSON, Dialogs;

{ TBabelGoogle }

constructor TBabelGoogleRest.Create(AOwner: TComponent);
begin
  inherited;
  Http1 := TIdHTTP.Create(self);
end;

procedure TBabelGoogleRest.SetFromLang(const Value: string);
begin
  FFromLang := Value;
end;

procedure TBabelGoogleRest.SetToLang(const Value: string);
begin
  FToLang := Value;
end;

class function TBabelGoogleRest.Translate(const strIn, langIn, langOut: string): string;
var
  bg: TBabelGoogleRest;
begin
  bg := self.Create(nil);
  try
    bg.FromLang := langin;
    bg.ToLang := langout;
    Result := bg.DoTranslate(strIn);
  finally
    bg.Free;
  end;
end;

function RemoveWhites(const str1: string): string;
var
  ch: char;
  inQuotes: Boolean;
begin
  Result := '';
  inQuotes := False;
  for ch in str1 do
  begin
    if ch = '"' then
      inQuotes := not inQuotes;
    if InQuotes or (ch <> ' ') then
      Result := Result + ch;
  end;
end;

function TBabelGoogleRest.DoTranslate(strIn: string): string;
var
  strUrl, strResult: string;
begin
  Http1.Request.Referer := ''; // not enforced for now
  strUrl := Format (
    'http://ajax.googleapis.com/ajax/services/language/translate?' +
    'v=1.0&q=%s&langpair=%s',
    [TIdUri.ParamsEncode (strIn),
    FFromLang + '%7C' + FToLang]); // format hates the %7 !!!
  strResult := Http1.Get(strUrl);

  // Use JSON parser: currently fails for Unicode data
  // Result := ResultFromJSON (strResult);

  // Use custom string processing
  Result := ResultFromJSON (strResult);
end;

function TBabelGoogleRest.ResultFromJSON(const strJson: string): string;
var
  jObject, jResponseData: TJSONObject;
begin
  jObject := TJSONObject.ParseJSONValue(strJson) as TJSONObject;
  try
    if not Assigned (jObject) then
      Exit ('Error parsing ' + strJson);

    // read the value of the first pair of the object, as a subobject
    jResponseData := jObject.Get(0).JsonValue as TJSONObject;

    // get the value of the only element of the responseData
    Result := jResponseData.Get(0).JsonValue.Value;
  finally
    jObject.Free;
  end;
end;

end.
