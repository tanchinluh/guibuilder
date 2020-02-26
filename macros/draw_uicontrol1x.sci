// 11. Menus (not in use for the moment)
function draw_uicontrol1x(handles)

    props = x_mdialog(['UImenu Properties'],['Tag';'Label';'Parent Tag'],['';'';'main_figure']);
    if props == []
        return
    end  

    if props(1) == ''
        props(1) = strcat(['obj',string(length(handles.all_handles)+1)]);
    end

    if props(2) == ''
        props(2) = strcat(['UnName',string(length(handles.all_handles)+1)]);
    end
    
    select_handle_menu=handles.f2
    for cnt=1:length(handles.all_handles)
        if(handles.all_handles(cnt).type=="uimenu") then
            if(props(3)==handles.all_handles(cnt).Tag) then
                select_handle_menu=handles.all_handles(cnt)
            end
        end
    end
    
    handles.current_handle = uimenu("Parent", select_handle_menu, "Label", props(2),"Tag",props(1));
    handles.current_handle.userdata(2) = props(1);

    Update_handle(handles);
    handles = resume(handles);

end
