function uistring = guicontrolcreate(a)
// GUI Builder Version 3.0
// Function to create statement of uicontrol generation for guibuilder
// Created on 19-Dec-2010 by Tan Chin Luh
// Modified on 10-Mar-2011 by Tan Chin Luh
// Modified on 15-July-2011 by Tan Chin Luh
// Modified on 17-April-2014 by Tan Chin Luh (3.0) to work with Scilab 5.5
// Modified on 16-Feb-2017 by Tan Chin Luh (4.0) to work with Scilab 6.0
str=[]
if(a.type=="uicontrol") then
    str(1) = 'BackgroundColor';
    str(2) = 'Enable';
    str(3) = 'FontAngle';
    str(4) = 'FontName';
    str(5) = 'FontSize';
    str(6) = 'FontUnits';
    str(7) = 'FontWeight';
    str(8) = 'ForegroundColor';
    str(9) = 'HorizontalAlignment';
    str(10) = 'ListboxTop';
    str(11) = 'Max';
    str(12) = 'Min';
    str(13) = 'Position';
    str(14) = 'Relief';
    str(15) = 'SliderStep';
    str(16) = 'String';
    str(17) = 'Style'; // Added on 10-Mar-2011
    str(18) = 'Value';
    str(19) = 'VerticalAlignment';
    str(20) = 'Visible';
    str(21) = 'Tag';
    str(22) = 'Callback';
end

for cnt = 1:size(str,1) // Changed on 10-Mar-2011 from 21 to 22

    val_temp = get(a,str(cnt));

// Changed on 16-Feb-2017 to be compatible with Scilab 6
    if val_temp == []
        val(cnt) = '[]';
    elseif typeof(val_temp) == 'constant'
        val(cnt) = strcat(string(get(a,str(cnt))),',');
        val(cnt) = strcat(['[',val(cnt),']']);
    elseif size(val_temp,2) >1
        val(cnt) = strcat(val_temp,'|'); // Changed on 15-July-2011 for Listbox and Popupmenu
    elseif typeof(val_temp) == 'handle'
        val(cnt) = a.Parent.tag;
    else
        val(cnt) = val_temp;
    end
end

if(a.type=="uicontrol") then
    if val(18)=='[]' // Changed on 10-Mar-2011 from 17 to 18
        val(18) = '[0]';
    end
    if val(22) =='auto' // Changed on 10-Mar-2011 from 21 to 22
        tag = a.Tag;
        val(22) = strcat([tag,'_callback(handles)']);
    end
    b = strcat([str,val]',''',''');
    c = strsubst(b,'''[','[');
    d = strsubst(c,']''',']');
    // Changed on 10-Mar-2011 from 20 to 21
    uistring = strcat(['handles.',val(21),'=uicontrol(f,''unit'',''normalized'',''',d,''')']);
end
 
endfunction



