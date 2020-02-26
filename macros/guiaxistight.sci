function guiaxistight(h)
    
min_max = [min(h.children.children.data,'r');max(h.children.children.data,'r')];
h.data_bounds = min_max;

endfunction