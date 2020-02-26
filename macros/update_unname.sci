//--------------------------------
// Assign name to un-named objects
//--------------------------------
// ToDo: Auto increment without reseting previous deleted items
function update_unname(handles)

  templist = get(handles.mylist,'string');
  tempcnt = size(templist,2);
  
  for cnt = 1:tempcnt
    if isempty(handles.all_handles(cnt).Userdata(1))
      if strindex(handles.all_handles(cnt).tag,'obj')
         handles.all_handles(cnt).tag = strcat(['obj',string(cnt)]);
      end
      if strindex(strcat(handles.all_handles(cnt).String),'UnName')
         handles.all_handles(cnt).String = strcat(['UnName',string(cnt)]);
      end
      if strindex(handles.all_handles(cnt).user_data(2),'obj')
         handles.all_handles(cnt).user_data(2) = strcat(['obj',string(cnt)]);
      end       
    else
      if strindex(handles.all_handles(cnt).user_data(1),'obj')
         handles.all_handles(cnt).user_data(1) = strcat(['obj',string(cnt)]);
      end
      if strindex(handles.all_handles(cnt).user_data(2),'obj')
         handles.all_handles(cnt).user_data(2) = strcat(['obj',string(cnt)]);
      end       
    end
         
    clear templist tempcnt;
  end
  
  for cnt = 1:length(handles.all_handles)
    templist(cnt) = handles.all_handles(cnt).user_data(2);
  end
  set(handles.mylist,'string',templist);
  handles = resume(handles);
     
end
