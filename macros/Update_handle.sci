//--------------------------------------
// Update the List of Components Handles
//--------------------------------------
function Update_handle(handles)  
  handles.all_handles = [handles.all_handles handles.current_handle];
    
  for cnt = 1:length(handles.all_handles)
    templist(cnt) = handles.all_handles(cnt).user_data(2);
  end

// Removed on 17-Nov-2011 by Tan C.L. : To enable the object created for Axes too, pending for review.
//  if(handles.current_handle.type=="uicontrol") then
//      set(handles.mylist,'string',string(templist));
//  elseif(handles.current_handle.type=="uimenu") then
     set(handles.mylist,'string',string(templist));
//  end

  handles = resume(handles);
end 
