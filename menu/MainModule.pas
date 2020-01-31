unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Aurelius.Sql.MSSQL,
  Aurelius.Schema.MSSQL, Aurelius.Drivers.FireDac, Aurelius.Comp.Connection,
  Aurelius.Engine.ObjectManager, Aurelius.Linq, Aurelius.Comp.Manager,
  Aurelius.Engine.DatabaseManager, Aurelius.Comp.DBSchema, UserConnection,
  RemoteFireDac, Vcl.Menus, uniMainMenu,Generics.Collections, uniGUIBaseClasses,
  uniGUIClasses, UniFSTheme, uniImageList, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, Aurelius.Sql.MySQL, Aurelius.Schema.MySQL;

type
  TUniMainModule = class(TUniGUIMainModule)
    q_menu: TFDQuery;
    objMgr: TAureliusManager;
    MenuItems_menu: TUniMenuItems;
    FSTheme: TUniFSTheme;
    utm_imagelist: TUniNativeImageList;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    AureliusConnection1: TAureliusConnection;
    q_search: TFDQuery;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleDestroy(Sender: TObject);
   // function getNode(aparentNodeID:integer):string;  //ͨ�����ڵ��Ż�ȡ�ڵ�
  private
    { Private declarations }
    procedure loadNode; // һ���Լ������нڵ� ������ ��
    procedure loadNodeAndMenu(const nodeBHArr: array of integer);                     //��������������нڵ��Լ��ڵ���һ���˵�
    procedure loadMenu_One(aparentnode_Id:integer); //����ѡ���Ľڵ��Լ��ڵ�������һ���˵� �����ã�
   // procedure loaduserPopupMenu(ausertype:string);  //�����û�����
  public
    { Public declarations }
    
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, uMenu_entity, uMenu,
    // ���� TList<tobject>�ĵ�Ԫ

//     Aurelius.Sql.MSSQL ,  //ΪDML�������MSSQL Sql����
//
//     Aurelius.Schema.MSSQL ,// ΪDDL�������MSSQL sql����

     Aurelius.Criteria.Base,Aurelius.Criteria.Linq;//ʹ��Linq��ѯϵͳ;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;


procedure TUniMainModule.loadMenu_One(aparentnode_Id: integer);
var
  menus_one: Tlist<tmenu>;  //���ݿ�������һ���˵����ݣ�ת��Ϊ������ʽ��
  itemsArr_one :array of TUniMenuItem; //����һ���˵���׼���������ݿ���һ���˵������ã�
  i:integer;
  item_node:TUniMenuItem; //�ڵ�
  menu:Tmymenu;
 // menus:TList<tmenu>  ;
begin

  menus_one := objMgr.Find<tmenu>.Add(Linq [ 'parentnode_id' ] = aparentnode_Id).OrderBy('bh').List;  //ͨ�����ڵ��ȡ����һ���˵�
  SetLength(itemsArr_one,menus_one.Count);


//  item_node:= TUniMenuItem.Create(self);
//  item_node.Caption :=  tmymenu.getnode_menuName(aparentnode_Id);
//  item_node.ImageIndex := tmymenu.getnode_image(aparentnode_Id);
//--------------------------------------------------------------------------

   item_node:= TUniMenuItem.Create(self);

   menu := TMymenu.getmenuObject(aparentnode_Id.ToString);
   item_node.Caption :=  menu.menu_name ;
   item_node.ImageIndex := menu.img_id;

//-----------------------------------------------------------------------------
  try
    for I := Low(itemsArr_one) to high(itemsArr_one) do
    begin
       itemsArr_one[i] := TUniMenuItem.Create(self);
       itemsArr_one[i].Caption := menus_one[i].menu_name ;
       itemsArr_one[i].ImageIndex := menus_one[i].img_id; ;
       item_node.Add(itemsArr_one[i]);
    end;
    MenuItems_menu.Items.Add(item_node);
  finally
      menus_one.Free;
      menu.Free;
  end;
end;

procedure TUniMainModule.loadNode;
var
  menus_node :Tlist<tmenu>;  //���нڵ�
  itemArr_node:array of TUniMenuItem;  //���нڵ�
  i :Integer;
begin
  menus_node := objMgr.Find<tmenu>.Add(Linq [ 'nodetype_id' ] = 0).List;  //���нڵ�
  SetLength(itemArr_node,menus_node.Count);
  try
  for I := Low(itemArr_node) to High(itemArr_node) do
  begin
     itemArr_node[i] := TUniMenuItem.Create(self);
     itemArr_node[i].Caption := menus_node[i].menu_name ;
     MenuItems_menu.Items.Add(itemArr_node[i]);
  end;
  finally
    menus_node.Free;
  end;
end;

procedure TUniMainModule.loadNodeAndMenu(const nodeBHArr: array of integer);
VAR
 i:integer;
begin
  for i := Low(nodeBHArr) to High(nodeBHArr) do
  begin
    loadMenu_One(nodeBHArr[i]);
  end;

end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
var
  menuarr: array of Integer;
begin
 // FSTheme.Aplly;
  FDConnection1.Open;
  q_menu.Active := true;
//--------------------------------------
  //�Զ�����ؽڵ��Լ��ڵ���һ���˵�
  SetLength(menuarr,4);
  menuarr[0]:= 1;
  menuarr[1] := 2;
  menuarr[2] := 3;
  menuarr[3] := 4;
  loadNodeAndMenu(menuarr);
//--------------------------------
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  FDConnection1.Close;
  q_menu.Active := false;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.