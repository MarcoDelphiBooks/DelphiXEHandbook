unit JsonTests_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBXJson, DBXFirebird, FMTBcd, DB, SqlExpr;

type
  TFormJson = class(TForm)
    btnParseObj: TButton;
    btnParseRESTResult: TButton;
    Memo1: TMemo;
    btnValues: TButton;
    btnSimpleArray: TButton;
    btnSimpleObject: TButton;
    btnDbxDataset: TButton;
    FBCONNECTION: TSQLConnection;
    procedure btnParseObjClick(Sender: TObject);
    procedure btnParseRESTResultClick(Sender: TObject);
    procedure btnValuesClick(Sender: TObject);
    procedure btnSimpleArrayClick(Sender: TObject);
    procedure btnSimpleObjectClick(Sender: TObject);
    procedure btnDbxDatasetClick(Sender: TObject);
  private
    procedure LogAndFree(jValue: TJSONValue);
    { Private declarations }
  public
    /// <summary>Output to the Memo</summary>
    procedure Log (const strMsg: string);
  end;

var
  FormJson: TFormJson;

implementation

uses
  DBXCommon, DBXJSONCommon;

{$R *.dfm}

procedure TFormJson.btnSimpleArrayClick(Sender: TObject);
var
  jList: TJSONArray;
begin
  jList := TJSONArray.Create;
  jList.Add(22);
  jList.Add('foo');

  jList.Add(
    TJSonArray.Create (
      TJSONTrue.Create));
  (jList.Get (2) as TJSonArray).Add (100);

  Log (jList.ToString);
  jList.Free;
end;

procedure TFormJson.LogAndFree (jValue: TJSONValue);
begin
  try
    Log (jValue.ClassName +  ' > ' + jValue.ToString);
  finally
    jvalue.Free;
  end;
end;

procedure TFormJson.btnValuesClick(Sender: TObject);
begin
  LogAndFree (TJSONNumber.Create(22));
  LogAndFree (TJSONString.Create('sample text'));
  LogAndFree (TJSONTrue.Create);
  LogAndFree (TJSONFalse.Create);
  LogAndFree (TJSONNull.Create);
end;

procedure TFormJson.btnDbxDatasetClick(Sender: TObject);
var
  aCommand: TDBXCommand;
  aReader: TDBXReader;
  jObject: TJSONObject;
begin
  FBCONNECTION.Open;
  aCommand := FBCOnnection.DBXConnection.CreateCommand;
  try
    aCommand.Text := 'select * from EMPLOYEE';
    aReader := aCommand.ExecuteQuery; // owned by the command
    // copy from the reader to a JSON object
    jObject := TDBXJSONTools.TableToJSON(aReader, 10, True);
    Log (jObject.ToString);
    jObject.Free;
  finally
    aCommand.Free;
  end;
end;

procedure TFormJson.btnParseObjClick(Sender: TObject);
var
  strParam: string;
  jsonObj: TJSONObject;
begin
  strParam := '{"value": 3}'; // space was an issue in 2010
//  jsonObj := TJSONObject.ParseJSONValue(
//    TEncoding.ASCII.GetBytes(strParam), 0)
//    as TJSONObject;
  jsonObj := TJSONObject.ParseJSONValue(strParam)
    as TJSONObject;
  if Assigned (jsonObj) then
  begin
    // complete object
    Log (jsonObj.ToString);
    // last name/value pair
    Log (jsonObj.Get (jsonObj.Size - 1).ToString);
  end
  else
    Log ('Error in parsing ' + strParam);
  jsonObj.Free;
end;

procedure TFormJson.btnParseRESTResultClick(Sender: TObject);
var
  s: string;
  jsonObj: TJSONObject;
begin
  // sample code to parse the JSON returned by a sample DataSnap REST call
  // s := '{"result":["hello world...ello world...ld"]}';

  // bug test (space in JSON): works in XE, didn't work in 2010
  s := '{"result": ["hello world...ello world...ld"]}';

//  jsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(s), 0) as TJSONObject;
  jsonObj := TJSONObject.ParseJSONValue(s) as TJSONObject;

  if Assigned (jsonObj) then
    Log((jsonObj.Get(0).JsonValue as TJsonArray).Get(0).Value)
  else
    Log ('Error while parsing: ' + s);
  jsonObj.Free;
end;

procedure TFormJson.btnSimpleObjectClick(Sender: TObject);
var
  jsonObj, subObject: TJSONObject;
begin
  jsonObj := TJSONObject.Create;
  jsonObj.AddPair(TJSONPair.Create ('Name', 'Marco'));
  jsonObj.AddPair(TJSONPair.Create ('Value', TJSONNumber.Create(100)));

  subObject := TJSONObject.Create(TJSONPair.Create ('Subvalue', 'one'));
  jsonObj.AddPair(TJSONPair.Create ('Object', subObject));

  Log (jsonObj.ToString);
  jsonObj.Free;
end;

procedure TFormJson.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
