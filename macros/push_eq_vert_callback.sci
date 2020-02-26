function push_eq_vert_callback(handles)
//Write your callback for  push_eq_vert  here
    indices = get(handles.mylist,'value');
    save_last_alignment(handles)
    if(length(indices)>=3)
        positions_center=[]
        for cnt=indices
            positions_center=[positions_center (handles.all_handles(cnt).position(2)+handles.all_handles(cnt).position(4)/2)]
        end
        [positions_center,ind]=gsort(positions_center,'g','i')
        sorted_indices=indices(ind)
      //calculation of the space between each rectangle
        space=(handles.all_handles(sorted_indices($)).position(2)-handles.all_handles(sorted_indices(1)).position(2))
        for cnt=1:(length(sorted_indices)-1)
            space=space-handles.all_handles(sorted_indices(cnt)).position(4)
        end
        space=space/(length(sorted_indices)-1)
        //put new position
        for cnt=2:(length(sorted_indices)-1)
            new_position=handles.all_handles(sorted_indices(cnt-1)).position(2)+handles.all_handles(sorted_indices(cnt-1)).position(4)+space
            handles.all_handles(sorted_indices(cnt)).position(2)=new_position;
        end
    
    
        select_highlight(handles)
        handles=resume(handles)
    end
endfunction
