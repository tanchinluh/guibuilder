function guipropsedit(a)
// GUI Builder Version 2.2.
// Created on 19-Dec-2010 by Tan Chin Luh
// Modified on 10-Mar-2011 by Tan Chin Luh
// Modified on 15-July-2011 by Tan Chin Luh
// Properties Editor for guibuilder
// Modified on 16-Feb-2017 by Tan Chin Luh (4.0) to work with Scilab 6.0

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


for cnt = 1:22 // Changed on 10-Mar-2011 from 21 to 22
    val_temp = get(a,str(cnt));
    
// Changed on 16-Feb-2017 to be compatible with Scilab 6
    if val_temp == []
        val(cnt) = '[]';
    elseif typeof(val_temp) == 'constant'
        val(cnt) = strcat(string(get(a,str(cnt))),',');
        val(cnt) = strcat(['[',val(cnt),']']);
    elseif size(val_temp,2) >1
        val(cnt) = strcat(val_temp,'|'); // Changed on 15-July-2011 for Listbox and Popupmenu        
    else
        val(cnt) = val_temp;
    end
end

sig = x_mdialog('Uicontrol Properties',str,val);
if isempty(sig)
return
else
//sig2 = sig    
//    for cnt = [1:16,18:22] // Changed on 10-Mar-2011 from 21 to 22 
//                           // Modified on 12-Mar-2011 to omit 17 as the style could not be set
//        val_temp = sig(cnt); 
//        try
//            if or(isnum(strsplit(val_temp)))//isnum(val_temp) 
//                val_set = eval(val_temp);
//                set(a,str(cnt),val_set);
//            elseif val_temp == '[]'
//                set(a,str(cnt),[]);
//            elseif isempty(val_temp)
//                set(a,str(cnt),'[]');
//            else
//                set(a,str(cnt),val_temp);
//            end
//        catch
//            disp('err')
//            set(a,str(cnt),sig2(cnt));
//        end
//        disp(cnt)
//    end

//  str(1) = 'BackgroundColor';
cnt = 1;
out = guicheckprops(sig(cnt),1);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end

//str(2) = 'Enable';
cnt = 2;
out = guicheckprops(sig(cnt),2);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),val(cnt));
end

// str(3) = 'FontAngle';
cnt = 3;
out = guicheckprops(sig(cnt),3);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),val(cnt));
end

//str(4) = 'FontName';
cnt = 4;
out = guicheckprops(sig(cnt),4);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),val(cnt));
end

//str(5) = 'FontSize';
cnt = 5;
out = guicheckprops(sig(cnt),5);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),val(cnt));
end

//str(6) = 'FontUnits';
cnt = 6;
out = guicheckprops(sig(cnt),6);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),val(cnt));
end

//str(7) = 'FontWeight';
cnt = 7;
out = guicheckprops(sig(cnt),7);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),val(cnt));
end

//str(8) = 'ForegroundColor';
cnt = 8;
out = guicheckprops(sig(cnt),8);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end

//str(9) = 'HorizontalAlignment';
cnt = 9;
out = guicheckprops(sig(cnt),9);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),val(cnt));
end

//str(10) = 'ListboxTop';
cnt = 10;
out = guicheckprops(sig(cnt),10);

if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),'[]');
end

//str(11) = 'Max';
cnt = 11;
out = guicheckprops(sig(cnt),11);
out2 = guicheckprops(sig(cnt+1),12);
if out ~= 'err' & out2 ~= 'err' then    
    if  out > out2 then
        set(a,str(cnt),out);    
    else
        set(a,str(cnt),evstr(val(cnt)));
    end
else
    set(a,str(cnt),evstr(val(cnt)));
end

//str(12) = 'Min';
cnt = 12;
out = guicheckprops(sig(cnt),12);
out2 = guicheckprops(sig(cnt-1),11);
if out ~= 'err' & out2 ~= 'err' then    
    if  out < out2 then
        set(a,str(cnt),out);    
    else
        set(a,str(cnt),evstr(val(cnt)));
    end
else
   set(a,str(cnt),evstr(val(cnt)));
end

//str(13) = 'Position';
cnt = 13;
out = guicheckprops(sig(cnt),13);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end

//str(14) = 'Relief';
cnt = 14;
out = guicheckprops(sig(cnt),14);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),(val(cnt)));
end

//str(15) = 'SliderStep';
cnt = 15;
out = guicheckprops(sig(cnt),15);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end

//str(16) = 'String';
cnt = 16;
out = guicheckprops(sig(cnt),16);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),(val(cnt)));
end


//str(17) = 'Style'; // Added on 10-Mar-2011
//cnt = 17;
//out = guicheckprops(sig(cnt),17);
//if out ~= 'err' then
//    set(a,str(cnt),out);    
//else
//    set(a,str(cnt),evstr(val(cnt)));
//end

//str(18) = 'Value';
cnt = 18;
out = guicheckprops(sig(cnt),18);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end

//str(19) = 'VerticalAlignment';
cnt = 19;
out = guicheckprops(sig(cnt),19);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end


//str(20) = 'Visible';
cnt = 20;
out = guicheckprops(sig(cnt),20);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end


//str(21) = 'Tag';
cnt = 21;
out = guicheckprops(sig(cnt),21);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end

//str(22) = 'Callback';
cnt = 22;
out = guicheckprops(sig(cnt),22);
if out ~= 'err' then
    set(a,str(cnt),out);    
else
    set(a,str(cnt),evstr(val(cnt)));
end


end
endfunction
