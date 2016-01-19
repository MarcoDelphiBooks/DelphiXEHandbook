program EverythingXEDemo;

uses
  Forms,
  EverythingXE_MainForm in 'EverythingXE_MainForm.pas' {FormMain},
  EverythingXE_PaintForm in 'EverythingXE_PaintForm.pas' {FormPaint};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
