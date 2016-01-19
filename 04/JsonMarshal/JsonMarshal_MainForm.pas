unit JsonMarshal_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  DBXJSONReflect; // needed or you'll get an "unsupported language feature custom attribute" warning

type
  TMyData = class
  private
    theName: String;
    theValue: Integer;
  public
    constructor Create (const aName: string);
    function ToString: string; override;
    property Value: Integer read theValue write theValue;
  end;

  TDataWithList = class
  private
    theName: String;
    [JSONReflect(ctTypeObject, rtTypeObject, TStringListInterceptor, nil, true)]
    theList: TStringList;
  public
    constructor Create (const aName: string); overload;
    constructor Create; overload;
    function ToString: string; override;
    destructor Destroy; override;
  end;

  TFormJson = class(TForm)
    btnMarshal: TButton;
    Memo1: TMemo;
    btnUnmarshal: TButton;
    btnMarshalList: TButton;
    btnUnmarshalList: TButton;
    procedure btnMarshalClick(Sender: TObject);
    procedure btnUnmarshalClick(Sender: TObject);
    procedure btnMarshalListClick(Sender: TObject);
    procedure btnUnmarshalListClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;


var
  FormJson: TFormJson;

implementation

{$R *.dfm}

uses
  DBXJSON;

constructor TMyData.Create(const aName: string);
begin
  theName := aName;
end;

procedure TFormJson.btnMarshalClick(Sender: TObject);
var
  theData: TMyData;
  jMarshal: TJSONMarshal;
  jValue: TJSONValue;
  jtfield: TTransientField;
begin
  theData := TMyData.Create('john');
  try
    theData.Value := 99;
    jMarshal := TJSONMarshal.Create(
      TJSONConverter.Create); // converted is owned
    try
      jValue := jMarshal.Marshal(theData);
      try
        Memo1.Lines.Text := jValue.ToString;
      finally
        jValue.Free;
      end;
      if jMarshal.HasWarnings then
      begin
        Memo1.Lines.Add(sLineBreak + 'TJSONMarshal warnings: ');
        for jtfield in jMarshal.Warnings do
          Memo1.Lines.Add (jtfield.FieldName + ': ' + jtfield.TypeName);
      end;
    finally
      jMarshal.Free;
    end;
  finally
    theData.Free;
  end;
end;

procedure TFormJson.btnMarshalListClick(Sender: TObject);
var
  theData: TDataWithList;
  jMarshal: TJSONMarshal;
  jValue: TJSONValue;
begin
  theData := TDataWithList.Create('john');
  try
    jMarshal := TJSONMarshal.Create(
      TJSONConverter.Create); // converter is owned
    try
      jValue := jMarshal.Marshal(theData);
      try
        Memo1.Lines.Text := jValue.ToString;
      finally
        jValue.Free;
      end;
    finally
      jMarshal.Free;
    end;
  finally
    theData.Free;
  end;
end;

procedure TFormJson.btnUnmarshalClick(Sender: TObject);
var
  jUnmarshal: TJSONUnMarshal;
  jValue: TJSONValue;
  anObject: TObject;
begin
  jValue := TJSONObject.ParseJSONValue(Memo1.Lines.Text);
  try
    jUnmarshal := TJSONUnMarshal.Create;
    try
      anObject := jUnmarshal.Unmarshal(jValue);
      try
        ShowMessage ('Class: ' + anObject.ClassName +
          sLineBreak + anObject.ToString);
      finally
        anObject.Free;
      end;
    finally
      jUnmarshal.Free;
    end;
  finally
    jValue.Free;
  end;
end;

procedure TFormJson.btnUnmarshalListClick(Sender: TObject);
var
  jUnmarshal: TJSONUnMarshal;
  jValue: TJSONValue;
  anObject: TObject;
begin
  jValue := TJSONObject.ParseJSONValue(Memo1.Lines.Text);
  try
    jUnmarshal := TJSONUnMarshal.Create;
    try
      anObject := jUnmarshal.Unmarshal(jValue);
      try
        ShowMessage ('Class: ' + anObject.ClassName +
          sLineBreak + anObject.ToString);
      finally
        anObject.Free;
      end;
    finally
      jUnmarshal.Free;
    end;
  finally
    jValue.Free;
  end;
end;

function TMyData.ToString: string;
begin
  Result := theName + ':' + IntToStr (theValue);
end;

{ TDataWithList }

constructor TDataWithList.Create(const aName: string);
var
  I: Integer;
begin
  theName := aName;
  theList := TStringList.Create;
  for I := 0 to 9 do
    theList.Add(IntToStr (Random (1000)));
end;

constructor TDataWithList.Create;
begin
  // core initialization, used for default construction
  theList := TStringList.Create;
end;

destructor TDataWithList.Destroy;
begin
  theList.Free;
  inherited;
end;

function TDataWithList.ToString: string;
begin
  Result := theName + sLineBreak + theList.Text;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;
  randomize;

end.
