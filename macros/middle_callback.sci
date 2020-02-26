function middle_callback(handles)
//Write your callback for  push_align_middle  here
    indices = get(handles.mylist,'value');
    top=0
    bottom=0
    save_last_alignment(handles)
    
    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            val_top=handles.all_handles(cnt).position(2)+handles.all_handles(cnt).position(4)
            val_bottom=handles.all_handles(cnt).position(2)
            if(bottom<=val_bottom) then 
                bottom=val_bottom
            end    
            if(top<=val_top) then 
                top=val_top
            end    
        end
        
    end
    middle=(top+bottom)/2
    for cnt=indices 
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            handles.all_handles(cnt).position(2)=middle-handles.all_handles(cnt).position(4)/2;
        end
        
    end
    select_highlight(handles)
    handles=resume(handles)
endfunction
