//--------------------------------------
// Calling function to open an existing GUI
//--------------------------------------
function openfile(handles,fn)

    handles.previous_functions=[]
    handles.read_functions=""
    a = guigetfile(fn, handles);
    [r,c] = size(a);
  
    for cnt = 1:r
      temp_tag = strsplit(a(cnt));
        if strcat(temp_tag(1:9)') == 'uicontrol'
            handles.current_handle = evstr(a(cnt));
            handles.current_handle.userdata(2) = get(handles.current_handle,'tag');
            scf(handles.f2); xrect([0 0 0 0]); myrect = gce();
            handles.wires=[handles.wires, myrect]
            Update_handle(handles);   
        elseif strcat(temp_tag(1:6)') == 'figure'
            handles.f2=evstr(a(cnt));
            handles.f2.children.margins = [0 0 0 0];
            handles.f2.children.data_bounds=[0 0;1 1]; // Added 17 April 2014 to be compatible with 5.5             
            handles.f2.children.axes_visible = ["on","on","on"]; 
            handles.f2.children.grid = [1 1]; 
            handles.f2.Tag = "f"; 
            delmenu(handles.f2.figure_id,gettext("File"));
            delmenu(handles.f2.figure_id,gettext("Tools"));
            delmenu(handles.f2.figure_id,gettext("?"));
            toolbar(handles.f2.figure_id,'off');
            handles.all_handles = [];
            handles.wires=[];
            set(handles.mylist,'string','');
            xrect([0 0 0 0]); handles.myrect = gce();
        else
            ind1 = strindex(a(cnt),'=[');
            temp_tag = strsplit(a(cnt));
            rec_axes = evstr(strcat(temp_tag(ind1+1:$)'));
            rec_axes(2) = 1 - rec_axes(2);
            scf(handles.f2);
            xrect(rec_axes);
            handles.current_handle = gce();
            handles.current_handle.userdata(1) = (strcat(temp_tag(1:ind1-1)'));
            handles.current_handle.userdata(2) = (strcat(temp_tag(1:ind1-1)'));
            //Added by Tan C.L. on 17.11.2011
            xrect([0 0 0 0]); myrect = gce();
            handles.wires=[handles.wires, myrect]

            Update_handle(handles);
        end    
    end
    handles = resume(handles);
end 
