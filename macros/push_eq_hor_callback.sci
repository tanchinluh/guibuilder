function push_eq_hor_callback(handles)
//Write your callback for  push_eq_hor  here
    indices = get(handles.mylist,'value');
    save_last_alignment(handles)
    if(length(indices)>=3)
        //extract center positions
        positions_center=[]
        for cnt=indices
            positions_center=[positions_center (handles.all_handles(cnt).position(1)+handles.all_handles(cnt).position(3)/2)]
        end
        //sort center positions and adapt indices
        [positions_center,ind]=gsort(positions_center,'g','i')
        sorted_indices=indices(ind)
        //calculation of the space between each rectangle
        space=(handles.all_handles(sorted_indices($)).position(1)-handles.all_handles(sorted_indices(1)).position(1))
        for cnt=1:(length(sorted_indices)-1)
            space=space-handles.all_handles(sorted_indices(cnt)).position(3)
        end
        space=space/(length(sorted_indices)-1)
        //put new position
        for cnt=2:(length(sorted_indices)-1)
            new_position=handles.all_handles(sorted_indices(cnt-1)).position(1)+handles.all_handles(sorted_indices(cnt-1)).position(3)+space
            handles.all_handles(sorted_indices(cnt)).position(1)=new_position;
        end
    
        select_highlight(handles)
        handles=resume(handles)
    end
endfunction
