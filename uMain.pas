unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.Diagnostics,

  Data.DB,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    FDConnection1: TFDConnection;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses
  uDBPool;

procedure TForm5.Button1Click(Sender: TObject);
begin
  var LStopWatch := TStopWatch.StartNew;
  for var i := 1 to 100 do
  begin
    var LConnection := TFDConnection.Create(nil);
    try
      LConnection.DriverName := 'MySQL';
      LConnection.LoginPrompt := False;
      LConnection.Params.Add('Server=127.0.0.1');
      LConnection.Params.Add('Port=3306');
      LConnection.Params.Add('Database=pos_db');
      LConnection.Params.Add('User_Name=root');
      LConnection.Params.Add('Password=1');
      LConnection.Params.Add('CharacterSet=Utf8');

      LConnection.Connected := True;
      LConnection.Connected := False;
    finally
      LConnection.Free;
    end;
  end;

  LStopWatch.Stop;
  Memo1.Lines.Add(LStopWatch.ElapsedMilliseconds.ToString);
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  var LStopWatch := TStopWatch.StartNew;
  for var i := 1 to 100 do
  begin
    var LConnection := TDatabase.GetConnection;
    try
      LConnection.Connected := True;
      LConnection.Connected := False;
    finally
      LConnection.Free;
    end;
  end;

  LStopWatch.Stop;
  Memo1.Lines.Add(LStopWatch.ElapsedMilliseconds.ToString);
end;

end.
