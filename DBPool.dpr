program DBPool;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form5},
  uDBPool in 'uDBPool.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
