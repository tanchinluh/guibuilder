function center_callback(handles)
//Write your callback for  push_align_c  here
    indices = get(handles.mylist,'value');
    right=0
    left=1
    save_last_alignment(handles)
    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            val_right=handles.all_handles(cnt).position(1)+handles.all_handles(cnt).position(3)
            val_left=handles.all_handles(cnt).position(1)
            if(left>=val_left) then 
                left=val_left
            end    
            if(right<=val_right) then 
                right=val_right
            end    
        end
        
    end
    middle=(right+left)/2
    for cnt=indices 
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            handles.all_handles(cnt).position(1)=middle-handles.all_handles(cnt).position(3)/2;
        end
        
    end
    select_highlight(handles)
    handles=resume(handles)
endfunction
