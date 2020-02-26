function guialignements(handles)
// GUI Builder Version 2.2.
// Created on 13-11-2011 by D.Violeau
// Modified on 17-11-2011 by Tan C.L.
// Function to align GUI for guibuilder
//////////
//f=figure('figure_position',[0,0],'figure_size',[359,452],'auto_resize','on','background',[33],'figure_name','Figure n°%d');
////////////
//delmenu(f.figure_id,gettext('File'))
//delmenu(f.figure_id,gettext('?'))
//delmenu(f.figure_id,gettext('Tools'))
//toolbar(f.figure_id,'off')
//
f = figure( ...
"dockable", "off", ...
"infobar_visible", "off", ...
"toolbar_visible", "off", ...
"menubar_visible", "on", ...
"default_axes", "off",...  
"visible", "off");
f.figure_size = [359,452];
f.figure_position =  [-1,-1];//[523,94];
f.figure_name = "GUI Alignment";
delmenu(f.figure_id, gettext("File"));
delmenu(f.figure_id, gettext("Tools"));
delmenu(f.figure_id, gettext("Edit"));
delmenu(f.figure_id, gettext("?"));


handles.dummy = 0;
handles.frame_align_v=uicontrol(f,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.0352941,0.3193916,0.4235294,0.5969582],'Relief','ridge','SliderStep',[0.01,0.1],'String','Alignement vertical','Style','frame','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','frame_align_v','Callback','')
handles.text_align_v=uicontrol(f,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.0705882,0.8897338,0.3411765,0.0684411],'Relief','ridge','SliderStep',[0.01,0.1],'String','Vertical Alignment','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','text_align_v','Callback','')
handles.push_align_top=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.1176471,0.7642586,0.2588235,0.1026616],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Top}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_align_top','Callback','top_callback(handles)')
handles.push_align_middle=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.1176471,0.6273764,0.2588235,0.1026616],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Middle}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_align_middle','Callback','middle_callback(handles)')
handles.push_align_bottom=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.1176471,0.3650190,0.2588235,0.1026616],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Bottom}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_align_bottom','Callback','bottom_callback(handles)')
handles.frame_align_h=uicontrol(f,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.0352941,0.0456274,0.9411765,0.2281369],'Relief','ridge','SliderStep',[0.01,0.1],'String','Horizontal Alignment','Style','frame','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','frame_align_h','Callback','')
handles.text_align_h=uicontrol(f,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.2941176,0.2395437,0.4117647,0.0684411],'Relief','ridge','SliderStep',[0.01,0.1],'String','Horizontal Alignment','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','text_align_h','Callback','')
handles.push_align_left=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.0588235,0.0912548,0.1764706,0.0912548],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Left}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_align_left','Callback','left_callback(handles)')
handles.push_align_center=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.2588235,0.0912548,0.1882353,0.0912548],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Center}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_align_center','Callback','center_callback(handles)')
handles.push_align_right=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7882353,0.0912548,0.1764706,0.0912548],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Right}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_align_right','Callback','right_callback(handles)')
handles.frame_size=uicontrol(f,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.4941176,0.5703422,0.4823529,0.3650190],'Relief','ridge','SliderStep',[0.01,0.1],'String','Size','Style','frame','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','frame_size','Callback','')
handles.text_size=uicontrol(f,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5529412,0.8897338,0.3529412,0.0684411],'Relief','ridge','SliderStep',[0.01,0.1],'String','Size','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','text_size','Callback','')
handles.push_same_width=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5647059,0.7300380,0.3294118,0.0912548],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Same\;width}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_same_width','Callback','same_width_callback(handles)')
handles.push_same_height=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5647059,0.6045627,0.3294118,0.0912548],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Same\;height}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_same_height','Callback','same_height_callback(handles)')
handles.push_eq_vert=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.1176471,0.4942966,0.2588235,0.1026616],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Equally\; spaced}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_eq_vert','Callback','push_eq_vert_callback(handles)')
handles.push_eq_hor=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.4705882,0.0912548,0.2941176,0.0912548],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Equally \; spaced}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_eq_hor','Callback','push_eq_hor_callback(handles)')
handles.push_cancel=uicontrol(f,'unit','normalized','BackgroundColor',[0.6,0.6,0.6],'Enable','on','FontAngle','normal','FontName','helvetica','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5294118,0.3992395,0.4,0.1026616],'Relief','raised','SliderStep',[0.01,0.1],'String','$\mathrm{Undo}$','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','push_cancel','Callback','push_cancel_callback(handles)')


f.visible = "on";
handles.saved_alignments=list()
handles=resume(handles)
endfunction 

//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////
































