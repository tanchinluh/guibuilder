

//-----------------------------
// Calling function to generate the GUI
//-----------------------------
function gencode_callback
  fn = uiputfile(["*.sce";]);
  err = guigencode(fn,handles.all_handles, handles);
  if err == 0 then
      messagebox("GUI Created Sucessfully!", "GUI Created", "info","modal");
  else
      messagebox("Unexpected Error. GUI Not Created!", "GUI Not Created", "Error","modal");
  end
  // Added on 06.1112011 by D.Violeau to load a file with or without extension
  ind=strindex(fn,'.sce')
  fn2=fn
  if (ind==[]) then
    fn2=strcat([fn,'.sce'])
  end
  
  edit(fn2);
end 
