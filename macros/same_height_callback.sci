function same_height_callback(handles)
//Write your callback for  push_same_height  here
    indices = get(handles.mylist,'value');
    max_size=0
    save_last_alignment(handles)
    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            val=handles.all_handles(cnt).position(4)
            if(max_size<=val) then 
                max_size=val
            end    
        end
        
    end
    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            handles.all_handles(cnt).position(4)=max_size   
        end
        
    end
    select_highlight(handles)
    handles=resume(handles)
endfunction
