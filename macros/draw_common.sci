//****************************
// Start of Common Functions
//****************************

//-----------------------------
// Drawing Functions
//-----------------------------
function [rec,rec_axes] = draw_common()
  scf(handles.f2);  
  [b,xc,yc]=xclick(); //get a point
  xrect(xc,yc,0,0) //draw a rectangle entity
  r=gce();// the handle of the rectangle
  rep=[xc,yc,-1];first=%f;
  
  while rep(3)==-1 do // mouse just moving ...
    rep=xgetmouse();
    xc1=rep(1);yc1=rep(2);
    ox=min(xc,xc1);
    oy=max(yc,yc1);
    w=abs(xc-xc1);h=abs(yc-yc1);
    r.data=[ox,oy,w,h]; //change the retangle origin, width an height
    first=%f;
  end
  
  rec_axes = r.data;
  rec(1) = (min(xc,xc1)) ;
  rec(2) = (min(yc,yc1)) ;
  rec(3) = (max(xc,xc1) - min(xc,xc1)); 
  rec(4) = (max(yc,yc1) - min(yc,yc1));
  
  rec = rec';
  delete(r);
end
