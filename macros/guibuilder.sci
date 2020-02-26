function guibuilder(fn)
// GUI Builder Version 3.0. 
// Main Function for guibuilder
// Created on 19-Dec-2010 by Tan Chin Luh
// Modified on 10-Mar-2011 by Tan Chin Luh 
// Bug Fix : Style Properties Not Inserted into gencode
// New Features : Launch generated code 
// Modified on 12-July-2011 by Tan Chin Luh (2.1-3)
// Modified on 17-July-2011 by Tan Chin Luh (2.1-3)
// Modified on 12-November-2011 by D.Violeau (2.2)
// Modified on 17-November-2011 by Tan Chin Luh (2.2)
// Bug Fix : Space in the x_dialog default string
// Modified on 15-Dec-2011 by D.Violeau (2.3)
// New Features : Ask confirmation before create a new GUI or open an existing one
// New Features : Posibility to move by 4 buttons a group of buttons 
// Modified on 17-April-2014 by Tan Chin Luh (3.0) to work with Scilab 5.5
// Modified on 16-Feb-2017 by Tan Chin Luh (4.0) to work with Scilab 6.0

funcprot(0);

//************************
//Definition of variables
//************************
//global 
selnum =[];
preh=[];
handles.f1 = 1;    //main figure containing the guihelper
handles.f2 = 1;    //figure containing the user's uicontrols
handles.selected_items = 1;
handles.mylist = 1;    //list of tags for the user's uicontrols
handles.all_handles = []; //list of user's uicontrols
handles.alignments=1;    //handles used for alignments of uicontrols
handles.wires=[];    //rectangles for each user's uicontrol
handles.read_functions="";    //body of the previous functions read
handles.previous_functions=[];    //name of the previous functions
//handles.menus = [];
//definition of the main figure

//////
//handles.f1=figure('position',[20 50 300 480]);
//drawlater()
//delmenu(handles.f1.figure_id, gettext("File"));
//delmenu(handles.f1.figure_id, gettext("Tools"));
//delmenu(handles.f1.figure_id, gettext("Edit"));
//delmenu(handles.f1.figure_id, gettext("?"));
//toolbar(handles.f1.figure_id,'off');    // Added on 4-Mar-2011
//
//mn=uimenu(handles.f1,'label', 'New','callback', 'new_gui(handles)');
//mo=uimenu(handles.f1,'label', 'Open','callback', 'open_existing_gui(handles)');
//m=uimenu(handles.f1,'label', 'Generate');
//// create an item on the menu bar
//m1=uimenu(m,'label', 'Generate GUI Code','callback', 'gencode_callback');

handles.f1 = figure( ...
"dockable", "off", ...
"infobar_visible", "off", ...
"toolbar_visible", "off", ...
"menubar", "none", ...
"default_axes", "off",...  
"visible", "on");

handles.f1.dockable = "on";

delmenu(handles.f1.figure_id, gettext("File"));
delmenu(handles.f1.figure_id, gettext("Tools"));
delmenu(handles.f1.figure_id, gettext("Edit"));
delmenu(handles.f1.figure_id, gettext("?"));
handles.f1.tag = "GUIBuilder Palette ";
handles.f1.figure_size = [320 540];
//f.layout = "border";
handles.f1.figure_position =  [-1,-1];//[523,94];
handles.f1.figure_name = "GUIBuilder Palette ";
//handles.f1.icon = "applications-system";
mn=uimenu(handles.f1,'label', 'New','callback', 'new_gui(handles)');
mo=uimenu(handles.f1,'label', 'Open','callback', 'open_existing_gui(handles)');
m=uimenu(handles.f1,'label', 'Generate');
// create an item on the menu bar
m1=uimenu(m,'label', 'Generate GUI Code','callback', 'gencode_callback');
//////


///////
////definition of the aspect of the figure containing user's uicontrols
//handles.f2=figure('position',[400 50 640 480]);//'backgroundcolor',[1,1,1]);
//handles.f2.children.margins = [0 0 0 0];
//handles.f2.children.axes_visible = ["on","on","on"]; // Added 17 July 2011 for Grid
//handles.f2.children.grid = [1 1]; // Added 17 July 2011 for Grid
//handles.f2.Tag = "f"; 
//handles.f2.children.data_bounds=[0 0;1 1]; // Added 17 April 2014 to be compatible with 5.5
//delmenu(handles.f2.figure_id,gettext("File"));
//delmenu(handles.f2.figure_id,gettext("Tools"));
//delmenu(handles.f2.figure_id,gettext("Edit"));
//delmenu(handles.f2.figure_id,gettext("?"));
//toolbar(handles.f2.figure_id,'off');// Added on 4-Mar-2011


handles.f2 = figure( ...
"dockable", "off", ...
"infobar_visible", "off", ...
"toolbar_visible", "off", ...
"menubar_visible", "off", ...
"default_axes", "on",...  
"visible", "off");
handles.f2.figure_size = [640 480];
handles.f2.figure_position =  [400 50];//[523,94];

handles.f2.children.margins = [0 0 0 0];
handles.f2.children.axes_visible = ["on","on","on"]; // Added 17 July 2011 for Grid
handles.f2.children.grid = [1 1]; // Added 17 July 2011 for Grid
handles.f2.Tag = "f"; 
handles.f2.children.data_bounds=[0 0;1 1]; // Added 17 April 2014 to be compatible with 5.5


//////

/////////////
//definition of the structure containing user's menus, not in use for the moment
global menus nb_menus
menus.label="Main Menu"
menus.tag="main_menu"
menus.submenus=[]
nb_menus=0;
handles.menus=menus

//********************
//Initialize UIControl
//********************

x = 30;
y = 380;
w = 120;
h = 30;
w_offset = 30;


uicontrol(handles.f1, 'units','pixels', 'style', 'frame','position',[x-10 y-375 w*1.2 h*15],'fontsize',12,'FontWeight','bold');
uicontrol(handles.f1, 'units','pixels', 'style', 'frame','position',[x+110 y-375 w*1.2 h*15],'fontsize',12,'FontWeight','bold');
uicontrol(handles.f1, 'units','pixels', 'style', 'text','string','GUIBUILDER 4.2.1','position',[x+30 y+60 w*1.5 h],'fontsize',16,'FontWeight','bold');
//uicontrol(handles.f1, 'units','pixels', 'style', 'text','string','Components','position',[x+110 y+40 w h],'fontsize',12,'FontWeight','bold');

uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Pushbutton}$','FontAngle','normal','position',[x y w h],'fontsize',14,'callback','draw_uicontrol1(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Radiobutton}$','position',[x y-w_offset*1 w h],'fontsize',14,'callback','draw_uicontrol2(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Checkbox}$','position',[x y-w_offset*2 w h],'fontsize',14,'callback','draw_uicontrol3(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Edit}$','position',[x y-w_offset*3 w h],'fontsize',14,'callback','draw_uicontrol4(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Text}$','position',[x y-w_offset*4 w h],'fontsize',14,'callback','draw_uicontrol5(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Slider}$','position',[x y-w_offset*5 w h],'fontsize',14,'callback','draw_uicontrol6(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Frame}$','position',[x y-w_offset*6 w h],'fontsize',14,'callback','draw_uicontrol7(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Listbox}$','position',[x y-w_offset*7 w h],'fontsize',14,'callback','draw_uicontrol8(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Popupmenu}$','position',[x y-w_offset*8 w h],'fontsize',14,'callback','draw_uicontrol9(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Axes}$','position',[x y-w_offset*9 w h],'fontsize',14,'callback','draw_uicontrol10(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Spinner}$','position',[x y-w_offset*10 w h],'fontsize',14,'callback','draw_uicontrol11(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Table}$','position',[x y-w_offset*11 w h],'fontsize',14,'callback','draw_uicontrol12(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Image}$','position',[x y-w_offset*12 w h],'fontsize',14,'callback','draw_uicontrol13(handles)');
//uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathrm{Menu}$','position',[x y-w_offset*10 w h],'fontsize',16,'callback','menu_editor(handles)');

handles.mylist = uicontrol(handles.f1, 'units','pixels', 'style', 'listbox','string','','position',[x+1.05*w y-120 w h+140],'fontsize',10,'BackgroundColor',[1 1 1],'callback','select_highlight(handles)','max',2);
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Left}$','position',[x+1.05*w y-140-w_offset w/2 h/1.5],'fontsize',10,'callback',' Move_callback(selected_item,''left'')');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Right}$','position',[x+1.05*w+(w-w/2) y-140-w_offset w/2 h/1.5],'fontsize',10,'callback',' Move_callback(selected_item,''right'')');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Up}$','position',[x+1.05*w+w/4 y-140-w_offset+h/1.5 w/2 h/1.5],'fontsize',10,'callback',' Move_callback(selected_item,''up'')');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Down}$','position',[x+1.05*w+w/4 y-160-w_offset w/2 h/1.5],'fontsize',10,'callback',' Move_callback(selected_item,''down'')');

uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Move}$','position',[x+1.05*w y-160-w_offset*2 w h],'fontsize',10,'callback',' edit_callback(selected_item)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{W-}$','position',[x+1.05*w y-160-w_offset*3 w/2 h],'fontsize',10,'callback','resizeW_callback(-1)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{W+}$','position',[x+1.05*w+w/2 y-160-w_offset*3 w/2 h],'fontsize',10,'callback','resizeW_callback(1)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{H-}$','position',[x+1.05*w y-160-w_offset*4 w/2 h],'fontsize',10,'callback','resizeH_callback(-1)');

uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{H+}$','position',[x+1.05*w+w/2 y-160-w_offset*4 w/2 h],'fontsize',10,'callback','resizeH_callback(1)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Delete}$','position',[x+1.05*w y-160-w_offset*5 w h],'fontsize',10,'callback','del_callback(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Object Properties}$','position',[x+1.05*w y-160-w_offset*6 w h],'fontsize',10,'callback','obj_props(handles)');
uicontrol(handles.f1, 'units','pixels', 'style', 'pushbutton','string','$\mathbf{Alignements}$','position',[x+1.05*w y-160-w_offset*7 w h],'fontsize',10,'callback','guialignements(handles)');

//xrect([0 0 0 0]); handles.myrect = gce();


// To Import Existing GUI previously created by guibuilder 2.2
if argn(2) 
    openfile(handles,fn)
end
//h_control = resume(h_control);
//handles = resume(handles);

handles.f1.visible = "on";
handles.f1.dockable = "off";
handles.f2.visible = "on";
[handles,selnum,preh]= resume(handles,selnum,preh);
end




function auto()
    
//  e = gcbo();
//  all_h = get(handles.mylist,'string');
//  sel_h = strcmp(all_h,e.tag);
//
//  selected_items = find(sel_h==0);
//  set(handles.mylist,'value',selected_items);  
//  
//  for cnt=1:length(handles.wires)
//      set(handles.wires(cnt),'visible',"off");
//  end
//
//  for cnt=selected_items
//     if isempty(handles.all_handles(cnt).Userdata(1))
//       set(handles.wires(cnt),'data',handles.all_handles(cnt).Position + [0 handles.all_handles(cnt).Position(4) 0 0]);// ;
//       set(handles.wires(cnt),'thickness',10);//;
//       set(handles.wires(cnt),'foreground',5);//;
//       set(handles.wires(cnt),'mark_style',3);
//       set(handles.wires(cnt),'mark_foreground',5);
//       set(handles.wires(cnt),'visible',"on");
//     else
//       set(handles.wires(cnt),'data',handles.all_handles(cnt).data);// ;
//       set(handles.wires(cnt),'thickness',10);//;
//       set(handles.wires(cnt),'foreground',5);//;
//       set(handles.wires(cnt),'mark_style',3);
//       set(handles.wires(cnt),'mark_foreground',5);
//       set(handles.wires(cnt),'visible',"on");
//     end
// end
// 
//disp(selnum) 
//
//  if e.tag == preh then
//      selnum = selnum + 1;
//  end
//
//
//  if selnum >= 1 then
////      act = messagebox("What do you want to do?", "Choose your action", "question", ["Edit Properties" "Move The UIControl"], "modal");
////      if act ==1 then
////          edit_callback(selected_items);
////      else
////          edit_callback(selected_items);
////      end 
//      selnum = 0;
//  end
//  
//  [ibutton,xcoord,yxcoord,iwin,cbmenu]=xclick();
//  disp(ibutton);
//
//preh = e.tag;
//
//[selnum,preh] = resume(selnum,preh);
//
  
end
