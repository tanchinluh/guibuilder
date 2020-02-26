function top_callback(handles)
//Write your callback for  push_align_top  here
    indices = get(handles.mylist,'value');
    top=0
    save_last_alignment(handles)

    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            val=handles.all_handles(cnt).position(2)+handles.all_handles(cnt).position(4)
            if(top<=val) then 
                top=val
            end    
        end
        
    end
    for cnt=indices
        // Added on 17-Nov-2011 by Tan C.L. : to include axes in alignment but ignoring effect
        if(handles.all_handles(cnt).type=="uicontrol")        
            handles.all_handles(cnt).position(2)=top-handles.all_handles(cnt).position(4)   
        end
        
    end
    select_highlight(handles)
    handles=resume(handles)
endfunction
