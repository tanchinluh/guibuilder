//Added by D.Violeau on 19.11.2011 : cancel previous alignment operation
function push_cancel_callback(handles)
//Write your callback for  push_cancel  here
if(~isempty(handles.saved_alignments))
    indices=handles.saved_alignments($).selected_items
    i=0
    for cnt=indices
        i=i+1
        if(handles.all_handles(cnt).type=="uicontrol")   
            if(length(handles.saved_alignments)==1)   
                handles.all_handles(cnt).position=handles.saved_alignments($).positions(i)
            else  
                handles.all_handles(cnt).position=handles.saved_alignments($).positions(i)
            end
            
        end
    end

    handles.saved_alignments($)=null()
    select_highlight(handles)
    handles=resume(handles)  
end  
    
endfunction
