// 13. Image
function draw_uicontrol13(handles)

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
    handles.current_handle =  uicontrol(handles.f2, 'units','normalized', 'style', 'image','tag',props(1),'string',props(2),'position',rec,'fontsize',12,'callback','auto');
    handles.current_handle.userdata(2) = props(1);

    // Added on 12-Nov-2011 by D.Violeau : create a wire for this uicontrol
    scf(handles.f2); xrect([0 0 0 0]); myrect = gce();
    handles.wires=[handles.wires myrect]

    Update_handle(handles);
    handles = resume(handles);

end
