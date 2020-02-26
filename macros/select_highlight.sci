//-----------------------------
// Highlight the Selection
//-----------------------------
//Changed on 12.11.2011 by D.Violeau : possibility to highlight more than one handle
function select_highlight(handles)
  selected_items = get(handles.mylist,'value');
  //disp(selected_items)

  for cnt=1:length(handles.wires)
      set(handles.wires(cnt),'visible',"off");
  end

  for cnt=selected_items
     if isempty(handles.all_handles(cnt).Userdata(1))
       set(handles.wires(cnt),'data',handles.all_handles(cnt).Position + [0 handles.all_handles(cnt).Position(4) 0 0]);// ;
       set(handles.wires(cnt),'thickness',10);//;
       set(handles.wires(cnt),'foreground',5);//;
       set(handles.wires(cnt),'mark_style',3);
       set(handles.wires(cnt),'mark_foreground',5);
       set(handles.wires(cnt),'visible',"on");
     else
       set(handles.wires(cnt),'data',handles.all_handles(cnt).data);// ;
       set(handles.wires(cnt),'thickness',10);//;
       set(handles.wires(cnt),'foreground',5);//;
       set(handles.wires(cnt),'mark_style',3);
       set(handles.wires(cnt),'mark_foreground',5);
       set(handles.wires(cnt),'visible',"on");
     end
 end
 selected_item = resume(selected_items)
 handles=resume(handles)
end
