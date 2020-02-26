function ui_str2 = guigetfile(fn, handles)
    // GUI Builder Version 3.0.
    // Created on 19-Dec-2010 by Tan Chin Luh
    // Modified on 10-Mar-2011 by Tan Chin Luh
    // Modified on 13.11.2011 by D.Violeau
    // Modified on 17-April-2014 by Tan Chin Luh (3.0) to work with Scilab 5.5
    // Modified on 1-Dec-2017 by Tan Chin Luh (4.2) for Scilab 6.0
    // Function to import GUI for guibuilder


    fd = mopen(fn,'rt');
    a = mgetl(fd);
    mclose(fd);
    [r,c] = size(a);

    //find zones defined by ///////////
    eliminator = [];
    for cnt = 1:r
        if a(cnt) == '//////////';
            eliminator = [eliminator cnt];
        end
    end


    //read figure properties   
    out_str = a(eliminator(1)+1);
    ind = strindex(out_str,'figure')
    ui_temp = strsplit(out_str,ind(1)-1);
    ui_str2(1) = ui_temp(2);

    if(size(eliminator,2)==3) then //version 2.1
        rep_uicontrol=1
    elseif (size(eliminator,2)==4) then //version 2.2
        rep_uicontrol=2
    end

    for cnt = eliminator(rep_uicontrol)+1:eliminator(rep_uicontrol+1)-1
        if a(cnt) == 'handles.dummy = 0;';
            eliminator(rep_uicontrol) =cnt;
        end
    end


    //read uicontrols and axes properties
    out_str = (a(eliminator(rep_uicontrol)+1:eliminator(rep_uicontrol+1)-1));

    for cnt = find(length(out_str))

        //Added by Tan C.L. on 1.12.201
        //Abandon the use of try...catch to read the ui components. 
        sw = [~isempty(strindex(out_str(cnt),['uicontrol']))...
        ~isempty(strindex(out_str(cnt),['axes_bounds']))...
        ~isempty(strindex(out_str(cnt),['f.visible']))];

        select sw
        case [%t %f %f]
            ind = strindex(out_str(cnt),'uicontrol')
            ui_temp = strsplit(out_str(cnt),ind-1);
            ui_str1(cnt) = ui_temp(2);
            ui_str2(cnt+1) = strsubst(ui_str1(cnt),'uicontrol(f','uicontrol(handles.f2');
        case [%f %t %f] // This line reserved for reverse compatibility
            ind = strindex(out_str(cnt),'axes_bounds');
            ind1 = strindex(out_str(cnt),'handles.');
            ind2 = strindex(out_str(cnt),'= newaxes');
            zz = strsplit(out_str(cnt));

            ui_temp1 = strcat(zz(ind1(1)+8:ind2(1)-1)');
            ui_temp2 = strsplit(out_str(cnt),ind+13);
            ui_str2(cnt+1) = strcat([ui_temp1,'=',ui_temp2(2)]);   
        case [%f %f %t]


        else
            disp('Error in reading gui file');
        end


        // Version 4.1 codes, to be removed when 4.2 stabilized 

        //        try
        //            ind = strindex(out_str(cnt),'uicontrol')
        //            ui_temp = strsplit(out_str(cnt),ind-1);
        //            ui_str1(cnt) = ui_temp(2);
        //            ui_str2(cnt+1) = strsubst(ui_str1(cnt),'uicontrol(f','uicontrol(handles.f2');
        //        catch
        //            //Added by Tan Chin Luh on 5.5.2017
        //            //to catch the extra line of f.visible
        //            try
        //                
        //                ind = strindex(out_str(cnt),'axes_bounds');
        //                ind1 = strindex(out_str(cnt),'handles.');
        //                ind2 = strindex(out_str(cnt),'= newaxes');
        //                zz = strsplit(out_str(cnt));
        //
        //                ui_temp1 = strcat(zz(ind1(1)+8:ind2(1)-1)');
        //                ui_temp2 = strsplit(out_str(cnt),ind+13);
        //                ui_str2(cnt+1) = strcat([ui_temp1,'=',ui_temp2(2)]);   
        //            catch
        //            end
        //        end

    end


    //Added by D.Violeau on 13.11.2011
    //read definition of previous functions and save every function

    out_str = a(eliminator(rep_uicontrol+2)+1:$);

    for cnt = find(length(out_str))
        ind = strindex(out_str(cnt),'function ')
        if(~isempty(ind))
            handles.previous_functions=[handles.previous_functions strsubst(out_str(cnt),'function ', '')]
        end
    end
    handles.read_functions=out_str

    handles=resume(handles)
endfunction
