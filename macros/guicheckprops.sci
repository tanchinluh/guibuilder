function outdata = guicheckprops(indata,datatype)
    
    
// datatype
// 1 = check color matrix
select datatype  
    case 1 then
        outdata = guicheckcolor(indata);
    case 2 then
        outdata = guicheckonoff(indata);
    case 3 then
        outdata = guicheckfontangle(indata);
    case 4 then
        outdata = guicheckfontname(indata);
    case 5 then
        outdata = guicheckpositve(indata);
    case 6 then
        outdata = guicheckfontunit(indata);
    case 7 then
        outdata = guicheckfontweight(indata);
    case 8 then
        outdata = guicheckcolor(indata);
    case 9 then                           
        outdata = guicheckhalign(indata);
    case 10 then                           
        outdata = guicheckpositve(indata);  
    case 11 then                           
        outdata = guicheckminmax(indata);  
    case 12 then                           
        outdata = guicheckminmax(indata);  
    case 13 then
        outdata = guicheckposition(indata);  
    case 14 then
        outdata = guicheckrelief(indata);
    case 15 then
        outdata = guicheckstep(indata);
    case 16 then
        outdata = guicheckstring(indata);
    case 17 then
        outdata = guicheckstyle(indata);
    case 18 then
        outdata = guicheckvalue(indata);
    case 19 then
        outdata = guicheckvalign(indata);
    case 20 then
        outdata = guicheckonoff(indata);
    case 21 then
        outdata = guichecktag(indata);
    case 22 then
        outdata = guicheckcb(indata);
    else

end


    
endfunction

function outdata = guicheckcolor(indata)
    try
        val_set = evstr(indata);
        if size(val_set,1)==1 & size(val_set,2)==3 then
            if sum(val_set<=1 | val_set >=0 | val_set == -1) == 3 then
                outdata = val_set;
            else
                outdata = 'err';
                error('wrong size for color matrix')                
            end
        else
                outdata = 'err';
                error('wrong size for color matrix')
        end
    catch
        outdata = 'err';
    end
endfunction

function outdata = guicheckonoff(indata)
    try
       // pause
        val_set = indata;
        if strcmp(val_set,'on') == 0  then
            outdata = 'on';
        elseif strcmp(val_set,'off') == 0  then
            outdata = 'off';            
        else
            outdata = 'err';
            error('only value ''on'' or ''off'' allowed');
        end
    catch
        outdata = 'err';
    end
endfunction

function outdata = guicheckfontangle(indata)
//{normal} | italic | oblique
    try
       // pause
        val_set = indata;
        if strstr('normal',val_set) == 'normal' then
            outdata = 'normal';
        elseif strstr('italic',val_set) == 'italic' then
            outdata = 'italic';
        elseif strstr('oblique',val_set) == 'oblique' then
            outdata = 'oblique';                                
        else
            outdata = 'err';
            error('only value ''on'' or ''off'' allowed');
        end
    catch
        outdata = 'err';
    end 
endfunction


function outdata = guicheckfontname(indata)
    try
        outdata = indata;
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckpositve(indata)
    try
        val_set = evstr(indata);
        if size(val_set,1)==1 & size(val_set,2)==1 then
            if val_set > 0 then
                outdata = round(val_set);
            else
                outdata = 'err';
                error('wrong size for fontsize')                
            end
        elseif isempty(val_set)
            outdata = val_set;
        else
                outdata = 'err';
                error('wrong size for fontsize')
        end
    catch
        outdata = 'err';
    end 
endfunction


function outdata = guicheckfontunit(indata)
//{points} | pixels | normalized    
// pause
    try
        val_set = indata;
        if strstr('points',val_set) == 'points' then
            outdata = 'points';
        elseif strstr('pixels',val_set) == 'pixels' then
            outdata = 'pixels';
        elseif strstr('normalized',val_set) == 'normalized' then
            outdata = 'normalized';                                
        else
            outdata = 'err';
            error('only value ''points'', ''pixels'' or ''normalized'' allowed');
        end
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckfontweight(indata)
// light | {normal} | demi | bold
    try
        val_set = indata;
        if strstr('light',val_set) == 'light' then
            outdata = 'light';
        elseif strstr('normal',val_set) == 'normal' then
            outdata = 'normal';
        elseif strstr('demi',val_set) == 'demi' then
            outdata = 'demi';     
        elseif strstr('bold',val_set) == 'bold' then
            outdata = 'bold';                                            
        else
            outdata = 'err';
            error('only value ''light'', ''normal'', ''demi'' or ''bold'' allowed');
        end
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckhalign(indata)
//    left | {center} | right
    try
        val_set = indata;
        if strstr('left',val_set) == 'left' then
            outdata = 'left';
        elseif strstr('center',val_set) == 'center' then
            outdata = 'center';
        elseif strstr('right',val_set) == 'right' then
            outdata = 'right';                                
        else
            outdata = 'err';
            error('only value ''left'', ''center'' or ''right'' allowed');
        end
    catch
        outdata = 'err';
    end 
endfunction


function outdata = guicheckminmax(indata)

    try
        
        val_set = evstr(indata);
        if size(val_set,1)==1 & size(val_set,2)==1 & type(val_set) == 1 then
                outdata = (val_set);
        else
            outdata = 'err';
            error('wrong size for fontsize')
        end
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckposition(indata)
    try
        val_set = evstr(indata);
        if size(val_set,1)==1 & size(val_set,2)==4 then
                outdata = val_set;
        else
                outdata = 'err';
                error('wrong data for position')
        end
    catch
        outdata = 'err';
    end
    
endfunction

function outdata = guicheckrelief(indata)
//{default} | flat | groove | raised | ridge | solid | sunken
    try
        val_set = indata;
        if strstr('default',val_set) == 'default' then
            outdata = 'default';
        elseif strstr('flat',val_set) == 'flat' then
            outdata = 'flat';
        elseif strstr('groove',val_set) == 'groove' then
            outdata = 'groove';     
        elseif strstr('raised',val_set) == 'raised' then
            outdata = 'raised';                                            
        elseif strstr('ridge',val_set) == 'ridge' then
            outdata = 'ridge';   
        elseif strstr('solid',val_set) == 'solid' then
            outdata = 'solid';   
        elseif strstr('sunken',val_set) == 'sunken' then
            outdata = 'sunken';                                      
        else
            outdata = 'err';
            error('only value ''{default} | flat | groove | raised | ridge | solid | sunken'' allowed');
        end
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckstep(indata)
    try
        val_set = evstr(indata);
        if size(val_set,1)==1 & size(val_set,2)==2 then
                outdata = val_set;
        else
                outdata = 'err';
                error('wrong data for position')
        end
    catch
        outdata = 'err';
    end
endfunction

function outdata = guicheckstring(indata)
    try
        outdata = indata;
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckstyle(indata)
    try
        outdata = indata;
    catch
        outdata = 'err';
    end 
endfunction


function outdata = guicheckvalue(indata)
    try
        val_set = evstr(indata);
        if size(val_set,1)==1 & size(val_set,2)==1 then
            if val_set > 0 then
                outdata = round(val_set);
            else
                outdata = 'err';
                error('wrong size for fontsize')                
            end
        elseif isempty(val_set)
            outdata = val_set;
        else
                outdata = 'err';
                error('wrong size for fontsize')
        end
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckvalign(indata)
//    top | {middle} | bottom
    try
        val_set = indata;
        if strstr('top',val_set) == 'top' then
            outdata = 'top';
        elseif strstr('middle',val_set) == 'middle' then
            outdata = 'middle';
        elseif strstr('bottom',val_set) == 'bottom' then
            outdata = 'bottom';                                
        else
            outdata = 'err';
            error('only value ''top'', ''middle'' or ''bottom'' allowed');
        end
    catch
        outdata = 'err';
    end 
endfunction


function outdata = guichecktag(indata)
    try
        outdata = indata;
    catch
        outdata = 'err';
    end 
endfunction

function outdata = guicheckcb(indata)
    try
        outdata = indata;
    catch
        outdata = 'err';
    end 
endfunction
