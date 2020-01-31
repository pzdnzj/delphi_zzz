program menu;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  UFrame1 in 'UFrame1.pas' {UniFrame1: TUniFrame},
  UFrame2 in 'UFrame2.pas' {UniFrame2: TUniFrame},
  uMenu in 'entity\uMenu.pas',
  uPubModule in 'uPubModule.pas' {datamod_pub: TDataModule},
  uMenu_entity in 'entity\uMenu_entity.pas',
  uframe3 in 'uframe3.pas' {UniFrame3: TUniFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
