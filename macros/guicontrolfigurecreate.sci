// Function to create figure properties of uicontrol generation for guibuilder
function uistring = guicontrolfigurecreate(a)
str(1) = 'figure_position';
str(2) = 'figure_size';
str(3) = 'auto_resize';
str(4) = 'background';
str(5) = 'figure_name';

for cnt = 1:size(str,1) 
    val_temp = get(a,str(cnt));
    if typeof(val_temp) == 'constant'
        val(cnt) = strcat(string(get(a,str(cnt))),',');
        val(cnt) = strcat(['[',val(cnt),']']);
    elseif size(val_temp,2) >1
        val(cnt) = strcat(val_temp,'|');
    else
        val(cnt) = val_temp;
    end
end

// Modified on 17-Feb-2017 by Tan Chin Luh (4.0) 
str(6) = 'dockable';
str(7) = 'infobar_visible';
str(8) = 'toolbar_visible';
str(9) = 'menubar_visible';
str(10) = 'default_axes';
str(11) = 'visible';
val(6) = 'off';
val(7) = 'off';
val(8) = 'off';
val(9) = 'off';
val(10) = 'on';
val(11) = 'off';
///

b = strcat([str,val]',''',''');
c = strsubst(b,'''[','[');
d = strsubst(c,']''',']');
uistring ='f=figure('''+d+''');'
// f=figure('figure_position',[400,50],'figure_size',[640,480],'auto_resize','on','background',[33],'figure_name','Graphic window number %d');


endfunction
