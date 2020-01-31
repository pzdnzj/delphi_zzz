{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniGUIBaseClasses, uniTreeView, uniTreeMenu, uniButton, Data.DB,
  uniBasicGrid, uniDBGrid, Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset,
  uniMemo, Datasnap.DBClient, uniPageControl, uniLabel, uniToolBar, uniPanel,
  uniBitBtn, uniMenuButton, Vcl.Menus, uniMainMenu;

type
  TMainForm = class(TUniForm)
    UniToolBar1: TUniToolBar;
    UniToolButton1: TUniToolButton;
    UniToolButton2: TUniToolButton;
    UniToolButton3: TUniToolButton;
    UniToolButton4: TUniToolButton;
    UniToolButton5: TUniToolButton;
    UniToolButton6: TUniToolButton;
    UniToolButton7: TUniToolButton;
    UniToolButton8: TUniToolButton;
    UniToolButton9: TUniToolButton;
    UniToolButton10: TUniToolButton;
    utm: TUniTreeMenu;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    upg: TUniPageControl;
    UniPanel3: TUniPanel;
    UniButton1: TUniButton;
    UniPanel4: TUniPanel;
    UniMenuButton1: TUniMenuButton;
    UniTabSheet1: TUniTabSheet;
    userPopupMenu: TUniPopupMenu;
    a1: TUniMenuItem;
    b1: TUniMenuItem;
    procedure utmSelectionChange(Sender: TObject);
    procedure upgChange(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniToolButton1Click(Sender: TObject);
    procedure a1Click(Sender: TObject);
  private
    { Private declarations }
    function gettab(apg: TUniPageControl; acaption: string): TUniTabSheet;
    procedure tabsheetclose(Sender: TObject; var AllowClose: Boolean);
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication,uPubModule,
  uMenu, uniGUIFrame; 

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

{ TMainForm }

procedure TMainForm.a1Click(Sender: TObject);
var
  frame:TUniFrame;
  tt:TUniTabSheet;
  I: integer;
begin
  with upg do
  begin
    for I := 0  to upg.PageCount-1 do
    begin
       if upg.Pages[i].Caption = '人员管理' then
         begin
           ActivePageIndex := i;
           exit;
         end;
    end;

  end;
  tt := TUniTabSheet.Create(upg);
  with tt do
  begin
    PageControl := upg;
    Caption :='人员管理';
    Closable := True;
  end;

  frame := tuniframeclass(FindClass('tuniframe_ry')).Create(tt);
  with frame do
  begin
    Parent := tt;
    Align := alClient;
  end;
  upg.ActivePage := tt;
end;

function TMainForm.gettab(apg: TUniPageControl; acaption: string): TUniTabSheet;
begin
  Result := TUniTabSheet.Create(apg);
  with Result do
  begin
    PageControl := apg;
    Caption := acaption;
  end;
end;

procedure TMainForm.tabsheetclose(Sender: TObject; var AllowClose: Boolean);
var
  N :TUniTreeNode;
begin
  if sender is TUniTabSheet then
  begin
    n := (Sender as TUniTabSheet).data;
    if n is TUniTreeNode then
       (n as TUniTreeNode).Data := nil;
  end;

  if upg.PageCount = 1 then
  begin
    utm.Selected := nil;
  end;
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
  utm.Micro := not utm.Micro;
end;

procedure TMainForm.UniToolButton1Click(Sender: TObject);
begin
  utm.Micro := not utm.Micro;
end;

procedure TMainForm.upgChange(Sender: TObject);
var
  t:TUniTabSheet;
  n:TUniTreeNode;
begin
  t := upg.ActivePage;
  if Assigned(t) then
    begin
      n := t.data;
      utm.Selected := n;
    end;
end;

procedure TMainForm.utmSelectionChange(Sender: TObject);
var
  N: TUniTreeNode;
  T: TUniTabSheet;
  frm:tuniframe ;
  frmname:string;
  menu:TMymenu;
begin
 
  N := utm.Selected;

  if Assigned(n) and n.IsLeaf then
  begin
    if n.data = nil then
    begin
      t := gettab(upg,n.text);
      t.ImageIndex := n.ImageIndex;
      t.Closable := True;
      n.Data := t;
      t.Data := n;
      t.OnClose := tabsheetclose;
      try
        menu := TMymenu.Create;
        //从数据库中 根据N.text（菜单名 menu_name） 获取 frmname
        frmname := menu.getframname_From_menuname(n.text);
        if (frmname <> 'node') and (frmname <> '') then
          begin
             frm := tuniframeclass(findclass(frmname)).Create(t);
            with frm do
            begin 
              Parent := t;
              Align := alClient;
            end;
          end;
      finally
        menu.Free;
      end;
    end
    else
    begin
      T := n.Data;
    end;
    upg.ActivePage := t;  
  end;

end;

initialization
  RegisterAppFormClass(TMainForm);

end.

