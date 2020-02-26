//-----------------------------
// Delete Selected Components
//-----------------------------
function del_callback(handles)

   delete(handles.all_handles(selected_item));  
   handles.all_handles = handles.all_handles(is_handle_valid(handles.all_handles));
   delete(handles.wires(selected_item)) // Added on 12.Nov.2011 by D.Violeau to delete uicontrol wire
   handles.wires = handles.wires(is_handle_valid(handles.wires))
   if isempty(handles.all_handles)  // Added on 17 July to delete last remaining item
       templist = '';
       set(handles.mylist,'string',templist);
       handles.myrect.data = [0 0 0 0];
       handles.all_handles=[]
   else
       for cnt = 1:length(handles.all_handles)
           templist(cnt) = handles.all_handles(cnt).user_data(2);
       end

       set(handles.mylist,'string',string(templist));
       update_unname(handles)
   end
   handles = resume(handles);
   
end 
