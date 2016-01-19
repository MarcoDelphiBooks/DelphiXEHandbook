unit RegExPrimer_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RegularExpressions;

type
  TFormRegExp = class(TForm)
    btnMatches: TButton;
    Memo1: TMemo;
    edInput: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edPattern: TEdit;
    btnIsMatch: TButton;
    btnMatchPlusNext: TButton;
    cbIgnoreCase: TCheckBox;
    btnReplace: TButton;
    btnSplit: TButton;
    btnCompiled: TButton;
    procedure btnMatchesClick(Sender: TObject);
    procedure btnIsMatchClick(Sender: TObject);
    procedure btnMatchPlusNextClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure btnSplitClick(Sender: TObject);
    procedure btnCompiledClick(Sender: TObject);
  protected
    function InputText: string;
    function PatternText: UnicodeString;
    function ReplaceEvaluator (const Match: TMatch): string;
  public
    procedure Log (const strMsg: string);
  end;

var
  FormRegExp: TFormRegExp;

implementation

{$R *.dfm}

uses
  Diagnostics;

procedure TFormRegExp.btnCompiledClick(Sender: TObject);
var
  w: TStopwatch;
  regex: TRegEx;
  I: Integer;
begin
  w := TStopWatch.Create;

  w.Start;
  regex := TRegEx.Create(PatternText, [roCompiled]);
  for I := 1 to 100000 do
  begin
    regex.IsMatch(InputText);
  end;
  w.Stop;
  Log ('Compiled: ' + IntToStr (w.ElapsedMilliseconds));

  w.Start;
  for I := 1 to 100000 do
  begin
    TRegEx.IsMatch(InputText, PatternText);
  end;
  w.Stop;
  Log ('Not Compiled: ' + IntToStr (w.ElapsedMilliseconds));
end;

procedure TFormRegExp.btnIsMatchClick(Sender: TObject);
var
  bMatch: Boolean;
  regOpt: TRegExOptions;
begin
  if cbIgnoreCase.Checked then
    regOpt := [roIgnoreCase];
  bMatch := TRegEx.IsMatch(InputText, PatternText, regOpt);
  Log(PatternText + ' matches ' + InputText + ':' +
    BoolToStr (bMatch, True));
end;

procedure TFormRegExp.btnMatchesClick(Sender: TObject);
var
  match : TMatch;
  matches: TMatchCollection;
begin
  matches := TRegEx.Matches (InputText, PatternText);
  for match in matches do
  begin
    Log('Found ' + match.Value + ' at ' + IntToStr (match.Index));
  end;
end;

procedure TFormRegExp.btnMatchPlusNextClick(Sender: TObject);
var
  regex: TRegEx;
  match : TMatch;
begin
  // match := TRegEx.Match (InputText, PatternText); // watch out!
  regex := TRegEx.Create (PatternText);
  match := regex.Match(InputText);
  while match.Success do
  begin
    Log('Found ' + match.Value + ' at ' + IntToStr (match.Index));
    match := match.NextMatch;
  end;
end;

procedure TFormRegExp.btnReplaceClick(Sender: TObject);
var
  strPattern: string;
begin
  strPattern := PatternText;

  // plain replacement
  Log (TRegEx.Replace(InputText, strPattern, 'Joe'));

  // anonymous method replacement
  Log (TRegEx.Replace(InputText, strPattern, ReplaceEvaluator));
end;

procedure TFormRegExp.btnSplitClick(Sender: TObject);
var
  strArray: TArray<string>;
  str1: string;
begin
  strArray := TRegEx.Split(InputText, PatternText);
  for str1 in strArray do
  begin
    Log (str1);
  end;
end;

function TFormRegExp.InputText: string;
begin
  Result := edInput.Text;
end;

procedure TFormRegExp.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

function TFormRegExp.PatternText: string;
begin
  Result := edPattern.Text;
end;

function TFormRegExp.ReplaceEvaluator(const Match: TMatch): string;
begin
  if Match.Value = 'Marco' then
    Result := 'Giovanni'
  else
    Result := 'Joe';
end;

end.
