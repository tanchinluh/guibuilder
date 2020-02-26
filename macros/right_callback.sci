function right_callback(handles)
//Write your callback for  push_align_right  here
    indices = get(handles.mylist,'value');
    right=0
    save_last_alignment(handles)
    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")
            val=handles.all_handles(cnt).position(1)+handles.all_handles(cnt).position(3)
            if(right<=val) then 
                right=val
            end    
        end
    end
    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect        
        if(handles.all_handles(cnt).type=="uicontrol")
            handles.all_handles(cnt).position(1)=right-handles.all_handles(cnt).position(3)   
        end
        
    end
    select_highlight(handles)
    handles=resume(handles)
endfunction
