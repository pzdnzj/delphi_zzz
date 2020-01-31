unit uPubModule;

interface

uses
  SysUtils, Classes;

type
  Tdatamod_pub = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function datamod_pub: Tdatamod_pub;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function datamod_pub: Tdatamod_pub;
begin
  Result := Tdatamod_pub(UniMainModule.GetModuleInstance(Tdatamod_pub));
end;

initialization
  RegisterModuleClass(Tdatamod_pub);

end.
