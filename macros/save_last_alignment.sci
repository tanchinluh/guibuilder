//Added by D.Violeau on 19.11.2011 : save positions of uicontrols before alignment operation
function save_last_alignment(handles)
    indices = get(handles.mylist,'value');
    last_alignment.selected_items=indices
    last_alignment.positions=list()
    for cnt=1:size(indices,1)
        last_alignment.positions(cnt)=[0,0,0,0]
    end
    ind=0
    for cnt=indices
        ind=ind+1
        last_alignment.positions(ind)=handles.all_handles(cnt).position
    end
    disp(last_alignment)
    handles.saved_alignments($+1)=last_alignment
    handles=resume(handles)
endfunction
