program JsonMarshal;

uses
  Forms,
  JsonMarshal_MainForm in 'JsonMarshal_MainForm.pas' {FormJson};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormJson, FormJson);
  Application.Run;
end.
