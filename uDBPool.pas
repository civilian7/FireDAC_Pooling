unit uDBPool;

interface

{.$DEFINE USE_UNIDAC}

{$REGION 'USES'}
uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.NetEncoding,

  Data.DB,

  FireDAC.Comp.UI,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Def,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.DApt,
  FireDAC.Phys.MySQL,
  FireDAC.Comp.Client,
  FireDAC.Comp.Script;
{$ENDREGION}

type
  TDatabase = class sealed
  strict private
    const
      CONNECTION_NAME = 'pooled_connection';

    class constructor Create;
    class destructor Destroy;
  public
    class function  GetConnection: TFDConnection; static;
  end;

implementation

{$REGION 'TDatabase'}

class constructor TDatabase.Create;
begin
  var LParams := TStringList.Create;
  try
    LParams.Add('Server=127.0.0.1');
    LParams.Add('Port=3306');
    LParams.Add('Database=pos_db');
    LParams.Add('User_Name=root');
    LParams.Add('Password=1');
    LParams.Add('Pooled=True');
    LParams.Add('CharacterSet=Utf8');

    FDManager.AddConnectionDef(CONNECTION_NAME, 'MySQL', LParams);
  finally
    LParams.Free;
  end;
end;

class destructor TDatabase.Destroy;
begin
  FDManager.CloseConnectionDef(CONNECTION_NAME);
end;

class function TDatabase.GetConnection: TFDConnection;
begin
  Result := TFDConnection.Create(nil);
  Result.ConnectionDefName := CONNECTION_NAME;
  Result.Connected := True;
end;

{$ENDREGION}

end.
