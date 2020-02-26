//-----------------------------
// Move the Selected Items
//-----------------------------
function edit_callback(selected_item)
  if(length(selected_item)>1) then
      messagebox("Select only one handle", "Move error message", "Error","modal");
  else      
      if isempty(handles.all_handles(selected_item).Userdata(1))
        data = handles.all_handles(selected_item).Position + [0 handles.all_handles(selected_item).Position(4) 0 0];
        r = dragrect(data);
        set(handles.all_handles(selected_item),'Position',r'-[0 handles.all_handles(selected_item).Position(4) 0 0]);    
      else
        data = handles.all_handles(selected_item).data;
        r = dragrect(data);
        set(handles.all_handles(selected_item),'data',r');
      end
      //handles.f1.children($).visible = 'off';
      select_highlight(handles);
      handles = resume(handles);
  end
end
