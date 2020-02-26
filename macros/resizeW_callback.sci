//-----------------------------
// Resize Width Function
//-----------------------------
function resizeW_callback(sz)
  if(length(selected_item)>1) then
      messagebox("Select only one handle", "resizeW error message", "Error","modal");
  else      
    if isempty(handles.all_handles(selected_item).Userdata(1))
      newszW = handles.all_handles(selected_item).Position + [0 0 sz./100 0];
      set(handles.all_handles(selected_item),'Position',newszW);
    else
      newszW = handles.all_handles(selected_item).data + [0 0 sz./100 0];
      set(handles.all_handles(selected_item),'data',newszW);
    end
  end
  select_highlight(handles);

end
