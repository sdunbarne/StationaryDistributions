if(!settings.multipleView) settings.batchView=false;
defaultfilename="stationarydistributions-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

settings.outformat = "pdf";

size(5inches);

real myfontsize = 12;
real mylineskip = 1.2*myfontsize;
pen mypen = fontsize(myfontsize, mylineskip);
defaultpen(mypen);

real marge=1mm;
pair z1=(-1, 1), z2=(0, 1), z3=(1, 1);
pair z4=(-1, 0), z5=(0, 0), z6=(1, 0);
transform r=scale(1.0);

object state_OCO=draw("OCO",ellipse,z1,marge),
state_VO =draw("VO",ellipse,z2,marge),
state_OOO=draw("OOO",ellipse,z3,marge),
state_OFO=draw("OFO",ellipse,z4,marge),
state_VV =draw("VV",ellipse,z5,marge),
state_OOV=draw("OOV",ellipse,z6,marge);

add(new void(picture pic, transform t) {
draw(pic,r*Label("$1/2$"),
point(state_OCO,NW,t){NW}..{NE}point(state_OCO,SW,t),Arrow);
draw(pic,r*Label("$1/2$", align=N),
point(state_VO,NW,t){NW}..{SW}point(state_VO,NE,t),Arrow);
draw(pic,r*Label("$1/2$", align=E),
point(state_OOO,NE,t){NE}..{NW}point(state_OOO,SE,t),Arrow);
});

add(new void(picture pic, transform t) {
draw(pic,r*Label("$1/2$"),
point(state_OFO,NW,t){NW}..point(state_OFO,SW,t),Arrow);
draw(pic,r*Label("$1/2$", align=S),
point(state_VV,SW,t){SW}..point(state_VV,SE,t),Arrow);
draw(pic,r*Label("$1/2$", align=E),
point(state_OOV,NE,t){NE}..point(state_OOV,SE,t),Arrow);
});

add(new void(picture pic, transform t) {
draw(pic,r*Label("$1/6$", align=N),
point(state_VO,NE,t)..point(state_OOO,NW,t),Arrow);
draw(pic,r*Label("$1/2$", align=S),
point(state_OOO,SW,t)..point(state_VO,SE,t),Arrow);
draw(pic,r*Label("$1/6$", align=N),
point(state_VV,NE,t)..point(state_OOV,NW,t),Arrow);
draw(pic,r*Label("$1/2$", align=S),
point(state_OOV,SW,t)..point(state_VV,SE,t),Arrow);
});

add(new void(picture pic, transform t) {
draw(pic,r*Label("$1/6$", align=N),
point(state_VO,NW,t)..point(state_OCO,NE,t),Arrow);
draw(pic,r*Label("$1/6$", align=2N, position=Relative(0.2)),
point(state_VO,W,t)..point(state_OFO,NE,t),Arrow);
draw(pic,r*Label("$1/6$", align=2N, position=Relative(0.2)),
point(state_VV,NW,t)..point(state_OCO,SE,t),Arrow);
draw(pic,r*Label("$1/6$", align=S),
point(state_VV,SW,t)..point(state_OFO,SE,t),Arrow);
draw(pic,r*Label("$1/2$", align=3S, position=Relative(0.2)),
point(state_OCO,S,t)..point(state_VV,W,t),Arrow);
draw(pic,r*Label("$1/4$", align=3S, position=Relative(0.2)),
point(state_OFO,E,t)..point(state_VO,SW,t),Arrow);
draw(pic,r*Label("$1/4$", align=N, position=Relative(0.5)),
point(state_OFO,E,t)..point(state_VV,W,t),Arrow);
});
