//---------------------------------------------
// Open properties dialog for the selected uicontrol
//---------------------------------------------
function obj_props(handles)
    if(length(selected_item)>1) then
        messagebox("Select only one handle", "ObjectProperties error message", "Error","modal");
    else 
        selected_handle = handles.all_handles(selected_item);
        guipropsedit(selected_handle);
        selected_handle.userdata(2) = get(selected_handle,'tag');
        for cnt = 1:length(handles.all_handles)
            templist(cnt) = handles.all_handles(cnt).user_data(2);
        end
        set(handles.mylist,'string',templist);
        handles = resume(handles);
    end
    
end
