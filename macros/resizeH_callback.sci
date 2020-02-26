//-----------------------------
// Resize Height Function
//-----------------------------
function resizeH_callback(sz)
    if(length(selected_item)>1) then
        messagebox("Select only one handle", "resizeH error message", "Error","modal");
    else 
        if isempty(handles.all_handles(selected_item).Userdata(1))  
          newszH = handles.all_handles(selected_item).Position + [0 0 0 sz./100];
          set(handles.all_handles(selected_item),'Position',newszH);
        else
          newszH = handles.all_handles(selected_item).data + [0 0 0 sz./100];
          set(handles.all_handles(selected_item),'data',newszH);
        end
    end
    select_highlight(handles);
end
