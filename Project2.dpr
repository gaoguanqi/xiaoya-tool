program Project2;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {Form1},
  Utils in 'Utils.pas',
  MainThread in 'MainThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
