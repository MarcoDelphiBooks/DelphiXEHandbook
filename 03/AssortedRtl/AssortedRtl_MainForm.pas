unit AssortedRtl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm9 = class(TForm)
    btnNoCores: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button1: TButton;
    procedure btnNoCoresClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    aValue: Integer;
  public
    { Public declarations }
    procedure Log (const strMsg: string);
  end;

var
  Form9: TForm9;

implementation

uses
  DateUtils, IOUtils, StrUtils, Diagnostics, Types, SyncObjs;

{$R *.dfm}

procedure TForm9.btnNoCoresClick(Sender: TObject);
begin
  Log ('TThread.ProcessorCount: ' + IntToStr (TThread.ProcessorCount));
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
  // classic (Windows only)
  InterlockedIncrement(aValue);
  // new and cross platform
  TInterlocked.Increment(aValue);

  Button1.Caption := IntToStr (aValue);
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  Log (TTimeZone.Local.Abbreviation + ' - ' +
    TTimeZone.Local.DisplayName);
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
  Log (TPath.GetHomePath);
end;

procedure TForm9.Button4Click(Sender: TObject);
var
  str: string;
  i, j: Integer;
  tt: TStopwatch;
  res: TStringDynArray;
begin
  str := '1';

  tt := TStopwatch.StartNew;
  for i := 2 to 1000 do
  begin
    str := str + '|' + IntTOStr (i);
    res := SplitString (str, '|');
  end;
  tt.Stop;

  Log (IntToStr (length(res)));
  Log (IntToStr (tt.ElapsedMilliseconds));
end;

procedure TForm9.Button5Click(Sender: TObject);
var
  str: string;
  i, j: Integer;
  tt: TStopwatch;
  sl: TStringList;
begin
  sl:= TStringList.Create;
  sl.LineBreak := '|';
  str := '1';

  tt := TStopwatch.StartNew;
  for i := 2 to 1000 do
  begin
    str := str + '|' + IntTOStr (i);
    sl.Text := str;
  end;
  tt.Stop;

  Log (IntToStr (sl.Count));
  Log (IntToStr (tt.ElapsedMilliseconds));
  sl.Free;
end;

procedure TForm9.FormCreate(Sender: TObject);
var
  pValue: string;
begin
  if FindCmdLineSwitch ('p', pValue) then
    Log ('-p ' + pValue);
end;

procedure TForm9.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
