
function open_existing_gui(handles)
    msg = gettext("Do you really want to open an existing GUI ? The current GUI will be lost.");
    answ = messagebox(msg, gettext("Open an existing GUI"), "question", [gettext("Yes") gettext("No")], "modal");
    if answ==1 then
        try
            delete(handles.f2);
        end
        fn = uigetfile(["*.sce";]);
        openfile(handles,fn)
    end
    
    // Bug fix on 1-Dec-2017 by Tan CL : Fix issue of hidden figure when open existing gui from menu item.
    handles.f1.visible = "on";
    handles.f2.visible = "on";
    
    handles=resume(handles)
end
