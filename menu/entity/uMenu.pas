unit uMenu;

interface
  uses System.SysUtils,Generics.Collections,System.Classes;
type
  TMymenu = class

    private
    Fbh: string;
    Fmenu_name: string;
    Ffrm_name: string;
    fnodeType_id:Integer;
    Fparentnode_id: Integer;
    Fstate: string;
    Fimg_id: Integer;
    FimglistName: string;

    public
      property bh: string read Fbh write Fbh;
      property menu_name: string read Fmenu_name write Fmenu_name;
      property frm_name: string read Ffrm_name write Ffrm_name;
      property nodeType_id: integer read fnodeType_id write fnodeType_id;
      property parentnode_id: Integer read Fparentnode_id write Fparentnode_id;
      property state: string read Fstate write Fstate;
      property img_id: Integer read Fimg_id write Fimg_id;
      property imglistName: string read FimglistName write FimglistName;

      function getframname_From_menuname(amenu_name:string):string;
      class function getmenuObject_list(anodetype_id:integer):TobjectList<TMymenu>;
      class function getnode_menuName(aparentnodeID:Integer):string;
      class function getnode_image(aparentnode_Id:integer):Integer;
      class function getmenuObject(abh:string):TMymenu;

  end;
implementation
  USES
    MainModule;
{ tmenu }

function TMymenu.getframname_From_menuname(amenu_name: string): string;
begin
   Result := '';
   with UniMainModule.q_search  do
   begin
     sql.Clear;
     sql.Add('select frm_name from menu where menu_name = :menu_name');
     Params.ParamByName('menu_name').Value := amenu_name;
     open;
   end;
   if not UniMainModule.q_search.IsEmpty  then
     Result := UniMainModule.q_search.FieldByName('frm_name').Value;
end;

class function TMymenu.getmenuObject(abh: string): TMymenu;
begin
  Result := nil;
  with UniMainModule.q_menu do
  begin
    sql.Clear;
    SQL.Add('select * from menu where bh = :bh');
    Params.ParamByName('bh').Value := abh;
    open;
  end;

  if UniMainModule.q_menu.RecordCount >  0 then
  begin
    Result := TMymenu.Create;
    with UniMainModule.q_menu do
    begin
      Result.bh := FieldByName('bh').value;
      Result.menu_name := FieldByName('menu_name').value;
      Result.frm_name :=  FieldByName('frm_name').value ;
      Result.nodeType_id := FieldByName('nodeType_id').value;
      Result.parentnode_id := FieldByName('parentnode_id').value;
      Result.state := FieldByName('state').value;
      Result.img_id := FieldByName('img_id').value;
    end;
  end;
  Result := Result;
end;

class function TMymenu.getmenuObject_list(anodetype_id: integer): TobjectList<TMymenu>;
var
  menu:TMymenu  ;
  menus:TobjectList<TMymenu>;
begin
  Result := nil;
  menu := TMymenu.Create;
  menus := TobjectList<TMymenu>.Create;
  with UniMainModule.q_menu do
  begin
    sql.clear;
    sql.add('select * from menu where  ( nodetype_id = :nodetype_id)');
    Params.ParamByName('nodetype_id').Value := anodetype_id;
    open;
  end;

  if UniMainModule.q_menu.RecordCount > 0 then
    begin
      with UniMainModule.q_menu do
      begin
        while not eof do
        begin
          menu := tmymenu.Create;
          menu.bh := FieldByName('bh').value;
          menu.menu_name := FieldByName('menu_name').value;
          menu.frm_name :=  FieldByName('frm_name').value ;
          menu.nodeType_id := FieldByName('nodeType_id').value;
          menu.parentnode_id := FieldByName('parentnode_id').value;
          menu.state := FieldByName('state').value;
          menu.img_id := FieldByName('img_id').value;
          menus.add(menu) ;
          next;
        end;
      end;
    end;

   Result := menus;
end;

class function TMymenu.getnode_image(aparentnode_Id: integer): Integer;
begin
  Result := -1;
  with UniMainModule.q_menu  do
  begin
    Result :=  LookupEx('bh',aparentnode_Id,'img_id');
  end;
end;

class function TMymenu.getnode_menuName(aparentnodeID: Integer): string;
begin
  Result := 'null';
  with UniMainModule.q_menu  do
  begin
    Result :=  LookupEx('bh',aparentnodeID,'menu_name');
  end;
end;

end.
