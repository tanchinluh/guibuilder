function err = guigencode(fn,all_handles,handles)
// GUI Builder Version 4.2.1
// Function to generate user design GUI for guibuilder
// Created on 19-Dec-2010 by Tan Chin Luh
// Modified on 10-Mar-2011 by Tan Chin Luh
// Modified on 13.11.2011 by D.Violeau
// Modified on 17-April-2014 by Tan Chin Luh (3.0) to work with Scilab 5.5
// Modified on 16-Feb-2017 by Tan Chin Luh (4.0) to work with Scilab 6.0

com = list(1);

for cnt = 1:length(all_handles)
  
  if ~isempty(all_handles(cnt).Userdata(1)) //write axes data   
    tag = all_handles(cnt).user_data(1);
    data = abs(all_handles(cnt).data  + [ 0 -1 0 0]);
    pos =  strcat(string(data'),',');
    com(cnt) = strcat(['handles.',tag,'= newaxes();','handles.',tag,'.margins = [ 0 0 0 0];','handles.',tag,'.axes_bounds = ','[',pos,'];']);
  else    //write uicontrol data
    tag = all_handles(cnt).Tag;
    if ~isempty(all_handles(cnt).callback) then 
        if all_handles(cnt).callback =='auto'
          cbk = strcat([tag,'_callback(handles)']);
          all_handles(cnt).callback=cbk;
        end
    else
        cbk = '';
    end 

    tempcom =  guicontrolcreate(all_handles(cnt));
    com(cnt) = tempcom;
  end

end

//add the extension .sce
ind=strindex(fn,'.sce')
fn2=fn
if (ind==[]) then
    fn2=strcat([fn,'.sce'])
end
fd = mopen(fn2,'wt');

//---------------------------
// Beginning of the writing
//---------------------------
mfprintf(fd,'%s\n','// This GUI file is generated by guibuilder version 4.2.1');
mfprintf(fd,'%s\n','//////////');

//write figure properties from the handles.f2 properties
figure_string=guicontrolfigurecreate(handles.f2) //Added on 30.10.2011 by D.Violeau : read figure properties
mfprintf(fd,'%s\n',figure_string);
mfprintf(fd,'%s\n','//////////');

// Modified on 17-Feb-2017 by Tan Chin Luh (4.0) 
//mfprintf(fd,'%s\n','delmenu(f.figure_id,gettext(''File''))');
//mfprintf(fd,'%s\n','delmenu(f.figure_id,gettext(''?''))');
//mfprintf(fd,'%s\n','delmenu(f.figure_id,gettext(''Tools''))');
//mfprintf(fd,'%s\n','toolbar(f.figure_id,''off'')');
//toolbar(handles.f1.figure_id,'off');

mfprintf(fd,'%s\n','handles.dummy = 0;');

//write all handles data
for cnt = 1:length(all_handles)
  mfprintf(fd,'%s\n',com(cnt));
end

// Modified on 17-Feb-2017 by Tan Chin Luh (4.0) 
mfprintf(fd,'\n\n%s\n','f.visible = ""on"";');


mfprintf(fd,'\n\n%s\n','//////////');
mfprintf(fd,'%s\n','// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version');
mfprintf(fd,'%s\n\n','//////////');

//write definition of functions defined by user or automatically 
//Modified by D.Violeau on 10.11.2011

if(~isempty(handles.read_functions))
    mfprintf(fd,'%s\n',handles.read_functions);
end

for cnt = 1:length(all_handles)
  if ~isempty(all_handles(cnt).callback) then
    tag = all_handles(cnt).Tag; 
    cbk=all_handles(cnt).callback;
    write_function=1
    for cnt2=1:size(handles.previous_functions,2)
        ind=strindex(cbk,handles.previous_functions(cnt2))
        if(~isempty(ind))
           write_function=0 
        end
    end

    if(write_function==1)
        mfprintf(fd,'%s %s\n','function',cbk);
        mfprintf(fd,'%s %s %s\n\n','//Write your callback for ',tag, ' here');
        mfprintf(fd,'%s\n\n\n','endfunction'); 
    end   
    
  end  
end

// Added output to check error on 4-Mar-2011
err = mclose(fd);

endfunction