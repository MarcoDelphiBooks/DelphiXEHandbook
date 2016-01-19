unit ThreadedQueue_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormThQueue = class(TForm)
    btnPushThread: TButton;
    btnPopThread: TButton;
    lblInfo: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure btnPushThreadClick(Sender: TObject);
    procedure btnPopThreadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormThQueue: TFormThQueue;

implementation

{$R *.dfm}

uses
  ThreadedQueue_ThreadClasses;

procedure TFormThQueue.btnPushThreadClick(Sender: TObject);
begin
  TPushThread.Create;
end;

procedure TFormThQueue.btnPopThreadClick(Sender: TObject);
begin
  TPopThread.Create;
end;

procedure TFormThQueue.Timer1Timer(Sender: TObject);
begin
  lblInfo.Caption := Format ('%d in=%d out=%d', [
    ThreadedQueue.QueueSize, ThreadedQueue.TotalItemsPushed,
    ThreadedQueue.TotalItemsPopped]);
  btnPushThread.Caption := IntToStr (nPushThreads);
  btnPopThread.Caption := IntToStr (nPopThreads);
end;

end.
