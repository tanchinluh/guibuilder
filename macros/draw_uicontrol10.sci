// 10. Axes
function draw_uicontrol10(handles)

    props = x_mdialog(['UIControl Properties'],['Tag';'String'],['';'']);
    if props == []
        return
    end  

    if props(1) == ''
        props(1) = strcat(['obj',string(length(handles.all_handles)+1)]);
    end

    if props(2) == ''
        props(2) = strcat(['UnName',string(length(handles.all_handles)+1)]);
    end


    [rec,rec_axes] = draw_common();
    xrect(rec_axes);
    handles.current_handle = gce();
    handles.current_handle.userdata(1) = props(1);
    handles.current_handle.userdata(2) = props(1);
    
    // Added on 12-Nov-2011 by D.Violeau : create a wire for this uicontrol
    scf(handles.f2); xrect([0 0 0 0]); myrect = gce();
    handles.wires=[handles.wires, myrect]

    Update_handle(handles);
    handles = resume(handles);

end
