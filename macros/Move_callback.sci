//-----------------------------
// Move the Selected Items to the left
//-----------------------------
function Move_callback(selected_item,direction)
    sz=1;
    move_vector=[0 0 0 0]
    if direction=="left" then
       move_vector=[-sz/100 0 0 0];
    elseif direction=="right" then
       move_vector=[sz/100 0 0 0];
    elseif direction=="up" then
       move_vector=[0 sz/100 0 0];
    elseif direction=="down" then
       move_vector=[0 -sz/100 0 0];       
    end
    for cnt=1:size(selected_item,2)
        if isempty(handles.all_handles(selected_item(cnt)).Userdata(1))
          newszW = handles.all_handles(selected_item(cnt)).Position + move_vector;
          set(handles.all_handles(selected_item(cnt)),'Position',newszW);
        else
          newszW = handles.all_handles(selected_item(cnt)).data + move_vector;
          set(handles.all_handles(selected_item(cnt)),'data',newszW);
        end   
    end

    select_highlight(handles);
    handles = resume(handles);
end
