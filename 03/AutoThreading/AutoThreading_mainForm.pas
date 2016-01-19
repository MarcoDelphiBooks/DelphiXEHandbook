unit AutoThreading_mainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TThreadingForm = class(TForm)
    btnAutoThread: TButton;
    btnPlain: TButton;
    btnBlockingHttp: TButton;
    btnThreadedHttp: TButton;
    Memo1: TMemo;
    IdHTTP1: TIdHTTP;
    procedure btnAutoThreadClick(Sender: TObject);
    procedure btnPlainClick(Sender: TObject);
    procedure btnBlockingHttpClick(Sender: TObject);
    procedure btnThreadedHttpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ThreadingForm: TThreadingForm;

implementation

{$R *.dfm}

uses
  Math, SyncObjs;

const
  mil20 = 20000000; // 20 million (change it to slow down code)

procedure TThreadingForm.btnAutoThreadClick(Sender: TObject);
begin
  (Sender as TButton).Caption := 'Computing';
  TThread.CreateAnonymousThread(
    procedure()
    var
      X: Extended;
      I: Integer;
    begin
      X := 100;
      for I := 0 to mil20 do
        x := Sqrt (X) * Sqrt (X);
      TThread.Synchronize (TThread.CurrentThread,
        procedure
        begin
          (Sender as TButton).Caption := FloatToStr (X);
        end);
    end).Start;
end;

procedure TThreadingForm.btnBlockingHttpClick(Sender: TObject);
var
  strHtml: string;
begin
  strHtml := IdHttp1.Get('http://www.marcocantu.com');
  memo1.Lines.Add(Copy (strHtml, 1, 200));
end;

procedure TThreadingForm.btnPlainClick(Sender: TObject);
var
  X: Extended;
  I: Integer;
begin
  (Sender as TButton).Caption := 'Computing';
  X := 100;
  for I := 0 to mil20 do
    x := Sqrt (X) * Sqrt (X);
  (Sender as TButton).Caption := FloatToStr (X);
end;

procedure TThreadingForm.btnThreadedHttpClick(Sender: TObject);
var
  aThread: TThread;
begin
  aThread := TThread.CreateAnonymousThread(
    procedure ()
    var
      strHtml: string;
    begin
       strHtml := IdHttp1.Get('http://www.marcocantu.com');
       aThread.Synchronize(aThread,
       procedure ()
       begin
         memo1.Lines.Add(Copy (strHtml, 1, 200));
       end);
    end);
  aThread.Start;
end;

end.
