function load_menus(loaded_menus)
// GUI Builder Version 2.2.
// Created on 13-11-2011 by D.Violeau
// Function to create menu for GUI (not implemented yet)
    
    global menus nb_menus
    //nb_menus=size(menus.submenus,1)
    menus=loaded_menus
    update_listmenus()
endfunction


function menu_editor(handles)
// GUI Builder Version 2.1-3. 
// Main Function for menus edition
// Created on 22-10-2011 by David Violeau
global menus nb_menus selected_menus
selected_menus=[]
//nb_menus=0
//menus=[]
//menu_names = menus(1).label;
//label_menu = menus(1).label;
//tag_menu = menus(1).tag;
//callback_menu = menus(1).callback;
//menu_names = "";
//label_menu = "";
//tag_menu="";
//callback_menu="";



pos_ini_x=0.05
pos_ini_y=0.85
button_height=0.1
button_width=0.2
space_between_entities=0.02
listmenu_width=0.4
listmenu_height=0.5
text_height=0.1
text_width=0.2
figure_menu_editor=figure('figure_position',[623,75],'figure_size',[448,426],'auto_resize','on','background',[-2],'figure_name','Menus Editor');
delmenu(figure_menu_editor.figure_id,gettext('File'))
delmenu(figure_menu_editor.figure_id,gettext('?'))
delmenu(figure_menu_editor.figure_id,gettext('Edit'))
delmenu(figure_menu_editor.figure_id,gettext('Tools'))
toolbar(figure_menu_editor.figure_id,'off')
handles.dummy = 0;
//add menu
handles.addmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x,pos_ini_y,button_width,button_height],'Relief','raised','SliderStep',[0.01,0.1],'String','Add menu','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','addmenu','Callback','addmenu_callback()')
//delete menu
handles.deletemenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+1*button_width+1*space_between_entities,pos_ini_y,button_width,button_height],'Relief','raised','SliderStep',[0.01,0.1],'String','Delete Menu','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','deletemenu','Callback','deletemenu_callback()')
//frame list menu
handles.framemenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x,0.2,0.4,0.6],'Relief','ridge','SliderStep',[0.01,0.1],'String','Menu list','Style','frame','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','framemenu','Callback','')
//add title to frame list menu

//list menu
handles.listmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+space_between_entities,0.21,0.38,0.58],'Relief','flat','SliderStep',[0.01,0.1],'String','','Style','listbox','Value',[1],'VerticalAlignment','middle','Visible','on','Tag','listmenu','Callback','')
//frame menu properties
handles.menuprop=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+space_between_entities+listmenu_width,0.20,0.5,0.60],'Relief','ridge','SliderStep',[0.01,0.1],'String','Menu properties','Style','frame','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','menuprop','Callback','')
//todo add title

//valid button
handles.valid=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x,0.05,button_width,button_height],'Relief','raised','SliderStep',[0.01,0.1],'String','OK','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','valid','Callback','handles.menus=valid_callback()')
//cancel button
handles.cancel=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+button_width+space_between_entities,0.05,button_width,button_height],'Relief','raised','SliderStep',[0.01,0.1],'String','Cancel','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','cancel','Callback','cancel_callback()')
//text label menu
handles.labelmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+2*space_between_entities+listmenu_width,0.65,text_width,text_height],'Relief','flat','SliderStep',[0.01,0.1],'String','Label:','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','labelmenu','Callback','')
//edit label menu
handles.editlabelmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+2*space_between_entities+listmenu_width+text_width,0.65,text_width,text_height],'Relief','sunken','SliderStep',[0.01,0.1],'String','','Style','edit','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','editlabelmenu','Callback','editmenu_callback(''label'')')
//text Tag menu
handles.tagmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+2*space_between_entities+listmenu_width,0.45,text_width,text_height],'Relief','flat','SliderStep',[0.01,0.1],'String','Tag:','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','tagmenu','Callback','')
//edit tag menu
handles.edittagmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+2*space_between_entities+listmenu_width+text_width,0.45,text_width,text_height],'Relief','sunken','SliderStep',[0.01,0.1],'String','','Style','edit','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','edittagmenu','Callback','editmenu_callback(''tag'')')
//text callback menu
handles.callbackmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+2*space_between_entities+listmenu_width,0.25,text_width,text_height],'Relief','flat','SliderStep',[0.01,0.1],'String','Callback:','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','callbackmenu','Callback','')
//edit callback menu
handles.editcallbackmenu=uicontrol(figure_menu_editor,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[pos_ini_x+2*space_between_entities+listmenu_width+text_width,0.25,text_width,text_height],'Relief','sunken','SliderStep',[0.01,0.1],'String','','Style','edit','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','editcallbackmenu','Callback','editmenu_callback(''callback'')')

if(size(handles.menus.submenus,1)>0) then
load_menus(handles.menus)
end
//update_listmenus()
endfunction

function global_string=read_submenus(level,global_string,menus)
    //spaces before menu name (function of the level of the menu)
    initial_spaces=[]
    for cnt=1:level
        initial_spaces(cnt)="      "
    end
    initial_spaces=strcat(initial_spaces)
    //add label menu to global label menu
    for cnt=1:size(menus,1)
        global_string(size(global_string,1)+1)=initial_spaces+menus(cnt).label
        if(size(menus(cnt).submenus,1)>0) then 
            global_string=read_submenus(level+1,global_string,menus(cnt).submenus)
        end
    end
endfunction

function update_listmenus()
    global menus
    menu_names=[]
    //global menu
    disp(menus)
    menu_names(1)=menus.label
    //recursive procedure to add label menu with spaces depending of the level of the menu
    menu_names=read_submenus(1,menu_names,menus.submenus)
    //change list name
    menu_names=strcat(menu_names','|')
    listmenu_handle = findobj("Tag","listmenu");
    set(listmenu_handle, "String", menu_names);
endfunction


function menu=select_and_add_menu(selected,index,menu,new_menu)
    global index
   if( selected==index ) then
       menu.submenus(size(menu.submenus,1)+1)=new_menu 
   else
       for cnt=1:size(menu.submenus,1)
            index=index+1;
            menu.submenus(cnt)=select_and_add_menu(selected,index,menu.submenus(cnt),new_menu)
            if(index==selected) then 
                break 
            end
        end
   end  
endfunction

function addmenu_callback()
    global menus nb_menus index
    //create new menu
    nb_menus=nb_menus+1    
    new_menu.label="Untitled "+string(nb_menus)
    new_menu.level=1
    new_menu.tag="untitled"+string(nb_menus)
    new_menu.callback="untitled"+string(nb_menus)+"_callback()"
    new_menu.submenus=[];
    //add new menu depending on the level of the menu selected
    listmenu_handle = findobj("Tag","listmenu");
    selected = get(listmenu_handle, "Value");
    if(selected==1 | selected==[]) then
        menus.submenus(size(menus.submenus,1)+1)=new_menu
    else
        index=1;
        menus=select_and_add_menu(selected,index,menus,new_menu)
//        for cnt=1:size(menus,1)
//            index=index+1;
//            menus(cnt)=select_and_add_menu(selected,index,menus(cnt),new_menu)
//            if(index==selected) then 
//                break 
//            end
//        end
    end
    update_listmenus()
endfunction



//change label name to display
//function listmenu_callback()
//    global menus selected_menus
//    listmenu_handle = findobj("Tag","listmenu");
//    indices = get(listmenu_handle, "Value");
//    selected_menus=indices
//    editlabelmenu_handle = findobj("Tag","editlabelmenu");
//    label_menu=menus(indices).label;
//    set(editlabelmenu_handle, "String", label_menu);    
//    edittagmenu_handle = findobj("Tag","edittagmenu");
//    tag_menu=menus(indices).tag
//    set(edittagmenu_handle, "String", tag_menu);
//    editcallbackmenu_handle = findobj("Tag","editcallbackmenu");
//    callback_menu=menus(indices).callback
//    set(editcallbackmenu_handle, "String", callback_menu);
//    
//    set(listmenu_handle,"Value",selected_menus)
//endfunction

//exit menu editor
function cancel_callback()
    close()
endfunction

function handle_menus=valid_callback()
    global menus
    handle_menus=menus
    close()
endfunction

//function deletemenu_callback()
//    global menus 
//    listmenu_handle = findobj("Tag","listmenu");
//    indices = get(listmenu_handle, "Value");
//    menus(indices)=[];
//    update_listmenus()
//endfunction

function submenus=select_delete_submenu(selected, index, menu)
   global index
//   disp("selected "+string(selected))
//   disp("size "+string(size(menu.submenus,1)))
   //if(size(menu.submenus,1)~=0) then
       for cnt=1:size(menu.submenus,1)
            index=index+1;
            if(index~=selected) then
                menu.submenus(cnt).submenus=select_delete_submenu(selected,index,menu.submenus(cnt))
            else
                if(size(menu.submenus,1)<=1) then
                    menu.submenus=[]
                else
                    menu.submenus(cnt)=[]
                end
                break
            end
        end
    //end
    submenus=menu.submenus

endfunction


function deletemenu_callback()
    global menus index
    listmenu_handle = findobj("Tag","listmenu");
    selected = get(listmenu_handle, "Value");
    if(selected==1 | selected==[]) then
        menus.submenus=[]
    else
       index=1; 
       level=1;
       menus.submenus=select_delete_submenu(selected, index, menus)
//       for cnt=1:size(menus,1)
//            index=index+1;
//            if(index~=selected) then 
//                menus(cnt).submenus=select_delete_submenu(selected, index, menus(cnt))
//            else
//                if(size(menus,1)<=1) then
//                    menus=[]
//                else
//                    menus(cnt)=[]
//                end
//                break 
//            end
//        end
    end

    update_listmenus()
endfunction

function submenus=select_submenu(selected, index, menu)
   global index
       for cnt=1:size(menu.submenus,1)
            index=index+1;
            if(index~=selected) then
                menu.submenus(cnt).submenus=select_delete_submenu(selected,index,menu.submenus(cnt))
            else
                label_menu=menu.submenus(cnt).label;
                tag_menu=menu.submenus(cnt).tag
                callback_menu=menu.submenus(cnt).callback
                editlabelmenu_handle = findobj("Tag","editlabelmenu");
                set(editlabelmenu_handle, "String", label_menu);    
                edittagmenu_handle = findobj("Tag","edittagmenu");
                set(edittagmenu_handle, "String", tag_menu);
                editcallbackmenu_handle = findobj("Tag","editcallbackmenu");
                set(editcallbackmenu_handle, "String", callback_menu);
                set(listmenu_handle,"Value",selected)
                break
            end
        end
    submenus=menu.submenus

endfunction


function listmenu2_callback()
    global menus index
    listmenu_handle = findobj("Tag","listmenu");
    selected = get(listmenu_handle, "Value");
    disp(selected)
    if(selected==1 | selected==[]) then
        label_menu=""
        tag_menu=""
        callback_menu=""
        set(listmenu_handle,"Value",1)
    else
       index=1; 
       level=1;
       for cnt=1:size(menus,1)
            index=index+1;
            //index_menu_selected(level)=cnt
            if(index~=selected) then 
                menus(cnt).submenus=select_delete_submenu(selected, index, menus(cnt))
            else
                label_menu=menus(cnt).label;
                tag_menu=menus(cnt).tag
                callback_menu=menus(cnt).callback
                editlabelmenu_handle = findobj("Tag","editlabelmenu");
                set(editlabelmenu_handle, "String", label_menu);    
                edittagmenu_handle = findobj("Tag","edittagmenu");
                set(edittagmenu_handle, "String", tag_menu);
                editcallbackmenu_handle = findobj("Tag","editcallbackmenu");
                set(editcallbackmenu_handle, "String", callback_menu);
                set(listmenu_handle,"Value",selected)
                break 
            end
        end
    end
    


    //update_listmenus()
endfunction


function index_menu_selected=select_menu(selected, index, menu, index_menu_selected, level)
    global index
    level=level+1
//    disp("level "+string(level))
    for cnt=1:size(menu.submenus,1)
        index=index+1;
        index_menu_selected(level)=cnt
//        disp("ind "+string(index))
//        disp("sel "+string(index_menu_selected))
        if(index~=selected) then
           index_menu_selected=select_menu(selected,index,menu.submenus(cnt), index_menu_selected, level)
           if(index~=selected) then 
               index_menu_selected=index_menu_selected(1:$-1)
           else
               break
           end
//           if(index==selected) then 
//                    index_menu_selected=index_menu_selected(1:level+1)
//                    break 
//            end  
        else

//            disp("ok")
//            disp(index_menu_selected)
            break
        end
    end
endfunction

function selectmenu2_callback()
    global menus index
    listmenu_handle = findobj("Tag","listmenus");
    selected = get(listmenu_handle, "Value");

    index_menu_selected=[]
    if(selected==1 | selected==[]) then
        //menus=[]
//        disp("ini")
    else
       index=1; 
       level=1;
       for cnt=1:size(menus,1)
//           disp("level "+string(level))
            index=index+1;
            index_menu_selected(level)=cnt
//       disp("ind "+string(index))
//        disp("sel "+string(index_menu_selected))

            if(index~=selected) then 
                index_menu_selected=select_menu(selected, index, menus(cnt), index_menu_selected, level)
                //menus(cnt)=[]
                if(index~=selected) then 
                    index_menu_selected=index_menu_selected(1:$-1)
                    //disp(index_menu_selected)  
                else
                    break;
                end
                
                
            else
                //index_menu_selected=index_menu_selected(1:level)
//                disp("ok")
//                disp(index_menu_selected)
                break 
            end
        end
    end
//    disp("index_sel")
   disp(index_menu_selected)
    //update_listmenus2()
    
endfunction


function editmenu_callback(key)
    global menus selected_menus
    editmenu="edit"+key+"menu"
    editmenu_handle = findobj("Tag",editmenu);
    if(key=="label")
        menus(selected_menus).label=get(editmenu_handle, "String");
        update_listmenus()
    elseif(key=="callback")
        menus(selected_menus).callback=get(editmenu_handle, "String");
    elseif(key=="tag")
        menus(selected_menus).tag=get(editmenu_handle, "String");
    end
    listmenu_handle = findobj("Tag","listmenu");
    set(listmenu_handle,"Value",selected_menus)
endfunction

