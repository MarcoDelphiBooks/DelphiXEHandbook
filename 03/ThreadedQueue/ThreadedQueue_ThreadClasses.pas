unit ThreadedQueue_ThreadClasses;

interface

uses
  Classes, Generics.Collections, SyncObjs;

const
  MaxQueueElements = 10000;

var
  ThreadedQueue: TThreadedQueue<Integer>;
  nPushThreads: Integer;
  nPopThreads: Integer;

type
  TPushThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

  TPopThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;


implementation

{ TPushTread }

procedure TPushThread.Execute;
begin
  TInterlocked.Increment(nPushThreads);
  try
    while not Terminated do
    begin
      if ThreadedQueue.QueueSize < MaxQueueElements then
      begin
        ThreadedQueue.PushItem (Random (100000));
        Sleep(random (10));
      end
      else
        Terminate;
    end;
  finally
    TInterlocked.Decrement(nPushThreads);
  end;
end;

{ TPopTread }

procedure TPopThread.Execute;
begin
  TInterlocked.Increment(nPopThreads);
  try
    while not Terminated do
    begin
      if ThreadedQueue.QueueSize > 0 then
      begin
        ThreadedQueue.PopItem;
        Sleep(random (10));
      end
      else
        Terminate;
    end;
  finally
    TInterlocked.Decrement(nPopThreads);
  end;
end;

initialization
  ThreadedQueue := TThreadedQueue<Integer>.Create (MaxQueueElements);

end.
