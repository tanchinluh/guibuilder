

//--------------------------------------
// Calling function to create a new GUI
//--------------------------------------
function new_gui(handles)
    msg = gettext("Do you really want to create a new GUI ? The current GUI will be lost.");
    answ = messagebox(msg, gettext("New GUI"), "question", [gettext("Yes") gettext("No")], "modal");
    if answ==1 then
        try
            delete(handles.f2);
        end
        handles.f2=figure('position',[400 50 640 480],'backgroundcolor',[0.8,0.8,0.8]);//'backgroundcolor',[1,1,1] 
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
        set(handles.mylist,'string','');
        xrect([0 0 0 0]); handles.myrect = gce();
        handles.wires=[];
        handles.previous_functions=[]
        handles.read_functions=""
    end
    handles=resume(handles)
end

