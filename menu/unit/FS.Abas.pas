{*******************************************************************************
                                 Falcon Sistemas

                          www.falconsistemas.com.br
                         suporte@falconsistemas.com.br
                 Written by Marlon Nardi - ALL RIGHTS RESERVED.
*******************************************************************************}

unit FS.Abas;

interface

uses
  uniGUIFrame, uniPageControl, uniPanel, uniGUIForm;

type
  TAbas = class
  public
    class function Nova(NameFrame: string; Panel: TuniPanel; PanelVisible: Boolean): TUniFrame; overload;
    class procedure Nova(NameFrame: string; PageControl: TuniPageControl; NameAction: string; ImageIndex: Integer; Fechar, AbaVisivel: Boolean); overload;
    class procedure Nova(FormFrame: TUniFrame; PageControl: TuniPageControl; Nome_Action: string; Fechar: Boolean); overload;
    class procedure Nova(NameFrame: string; Panel: TuniPanel); overload;
    class procedure Nova(NameFrame: string; Form: TuniForm); overload;
    class procedure FecharTodas(PageControl: TUniPageControl);
    class procedure FecharTodasWithNotClosable(PageControl: TUniPageControl);
    class procedure VerificaAba(Sender: TObject; var AllowClose: Boolean);
  end;

implementation

uses
  Vcl.Controls, Main, System.Classes;

{ TAbas }

class procedure TAbas.FecharTodas(PageControl: TUniPageControl);
var
  I : Integer;
begin
  for I := PageControl.PageCount - 1 downto 0 do
  begin
    if PageControl.Pages[I].Closable then
      PageControl.Pages[I].Close;
  end;
end;

class procedure TAbas.Nova(NameFrame: string; PageControl: TuniPageControl;
  NameAction: string; ImageIndex : Integer; Fechar, AbaVisivel: Boolean);
var
  TabSheet: TUniTabSheet;
  FCurrentFrame: TUniFrameClass;
  Fr: TUniFrame;
  I: Integer;
begin
  if GetClass(NameFrame) = nil then
    Exit;

  PageControl.Visible := True;

  {Verificando se a tela já está aberto e redireciona a ela}
  for I := 0 to PageControl.PageCount - 1 do
	if PageControl.Pages[I].Caption = NameAction then
	begin
	  PageControl.ActivePageIndex := I;
	  Exit;
	end;

  TabSheet := TUniTabSheet.Create(PageControl);

  TabSheet.PageControl := PageControl;
  TabSheet.Caption := NameAction;
  TabSheet.ImageIndex := ImageIndex;
  TabSheet.Closable := Fechar;
  TabSheet.OnClose := VerificaAba;
  TabSheet.TabVisible := AbaVisivel;

  FCurrentFrame := TUniFrameClass(FindClass(NameFrame));

  Fr := FCurrentFrame.Create(TabSheet);
  Fr.Align := alClient;
  Fr.Parent := TabSheet;

  PageControl.ActivePage := TabSheet;
end;

class procedure TAbas.Nova(NameFrame: string; Panel: TuniPanel);
var
  FCurrentFrame :TUniFrameClass;
  Fr : TUniFrame;
begin
  if GetClass(NameFrame) = nil then
    Exit;

  Panel.Visible := True;

  FCurrentFrame := TUniFrameClass(FindClass(NameFrame));

  Fr := FCurrentFrame.Create(Panel);
  Fr.Align := alClient;
  Fr.Parent := Panel;
end;

class function TAbas.Nova(NameFrame: string; Panel: TuniPanel;
  PanelVisible: Boolean): TUniFrame;
var
  FCurrentFrame :TUniFrameClass;
  Fr : TUniFrame;
begin
  Result := nil;

  if GetClass(NameFrame) = nil then
    Exit;

  Panel.Visible := PanelVisible;

  FCurrentFrame := TUniFrameClass(FindClass(NameFrame));

  Fr := FCurrentFrame.Create(Panel);
  Fr.Align := alClient;
  Fr.Parent := Panel;

  Result := Fr;
end;

class procedure TAbas.VerificaAba(Sender: TObject; var AllowClose: Boolean);
begin
  if TUniTabSheet(Sender).Parent is TUniPageControl then
    if TUniPageControl(TUniTabSheet(Sender).Parent).PageCount = 1 then
      TUniPageControl(TUniTabSheet(Sender).Parent).Visible := False;
end;

class procedure TAbas.FecharTodasWithNotClosable(PageControl: TUniPageControl);
var
  I : Integer;
begin
  for I := PageControl.PageCount - 1 downto 0 do
  begin
    if not PageControl.Pages[I].Closable then
      PageControl.Pages[I].Close;
  end;
end;

class procedure TAbas.Nova(NameFrame: string; Form: TuniForm);
var
  FCurrentFrame :TUniFrameClass;
  Fr : TUniFrame;
begin
  if GetClass(NameFrame) = nil then
    Exit;

  FCurrentFrame := TUniFrameClass(FindClass(NameFrame));

  Fr := FCurrentFrame.Create(Form);
  Fr.Align := alClient;
  Fr.Parent := Form;
end;

class procedure TAbas.Nova(FormFrame: TUniFrame; PageControl: TuniPageControl;
  Nome_Action: string; Fechar: Boolean);
var
  TabSheet      :TUniTabSheet;
  FCurrentFrame :TUniFrame;
  I             :Integer;
begin

  PageControl.Visible:= True;
  PageControl.TabBarVisible := True;

  {Verificando se a tela já está aberto e redireciona a ela}
  for I := 0 to PageControl.PageCount - 1 do
  with PageControl do
  if Pages[I].Caption = Nome_Action  then
  begin
    PageControl.ActivePageIndex := I;
    Exit;
  end;

  TabSheet              := TUniTabSheet.Create(MainForm);
  TabSheet.PageControl  := PageControl;
  TabSheet.Caption      := Nome_Action;
  TabSheet.Closable     := Fechar;
  TabSheet.OnClose      := VerificaAba;

  FCurrentFrame:= TUniFrameClass(FormFrame).Create(MainForm);

  with FCurrentFrame do
  begin
    Align := alClient;
    Parent := TabSheet;
  end;

  PageControl.ActivePage := TabSheet;
end;

end.
