/*
 This template code provides a method for combining ControlP5 
 with the piGeon geometry library and interface.  The method
 gives the user dynamic control over geometry variables using 
 interactive controls such as sliders, toggles, knobs, and 
 other cool GUI stuff.
 
 Required Libraries 
 piGeon:  http://igeo.jp
 ControlP5:  http://www.sojamo.de/libraries/controlP5/
*/

//2011 Nathan Miller, The Proving Ground

import igeo.*;
import processing.opengl.*;
import controlP5.*;

//changing to include controlFrame instead of Control Window
import java.awt.Frame;
import java.awt.BorderLayout;

ControlFrame cf;

//DECLARE CONTROLS
ControlP5 controlP5;
//ControlWindow myControlWindow;  //initialize control window


//SURFACE PROPERTIES
int uDegree;
int vDegree;
int numSelections = 3;    //number of different initial configurations
int selection;        //choice of initial configuration
IVec[][][] cCoords;   //coordinates of the control points for each selection
IVec4[][] cPoints;    //control points with weights

//SETUP
/*
 Use void setup() to initialize piGeon interface, and ControlP5. 
 void setup() can also be used to establish static geometry 
 (imports, references)
*/ 


void setup() {
  //INITIALIZE MAIN INTERFACE
  size(600, 600, IG.GL);

  //NITIALIZE CONTROLP5 AND CONTROL WINDOW
  controlP5 = new ControlP5(this);
  cf = addControlFrame("piGeon Controls", 480,360);
  
  uDegree = 2;
  vDegree = 2;
  
  cPoints = new IVec4[(uDegree+1)][(vDegree+1)];
  cCoords = new IVec[numSelections][(uDegree+1)][(vDegree+1)];
  
  for(int s = 0; s<numSelections; s++){
    for(int i=0; i<uDegree+1; i++){
      for(int j=0; j<vDegree+1; j++){
       cCoords[s][i][j] = new IVec(random(-100+i*10,100+i*10),random(-100+j*(-100),100+j*(-100)),random(-100+(i+j)*25,100+(i+j)*25));
      }
    }
  }
  
}

//DRAW

void draw() {
  //REFRESH PIGEON GEOMETRY
  refpiGeon(); //function to refresh variable piGeon geometry
  
  //sliders, one for each control points + for configuration selection.
  for(int i=0; i<(uDegree+1)*(vDegree+1)+1;i++){
    if(i==0){
     selection = (int) cf.controls.get(0).getValue();
     //selection = 1;
    }else{
     float weight = cf.controls.get(i).getValue();
     int currI = (i-1)/(vDegree+1);
     int currJ = (i-1)%(vDegree+1);
     cPoints[currI][currJ] = new IVec4(cCoords[selection][currI][currJ], weight);
    }
  }
  
  ISurface surf = new ISurface(cPoints, uDegree, vDegree).clr(1,.5,1);
  
  int unum = 10, vnum = 10;
  double uinc = 1.0/unum, vinc = 1.0/vnum;

  for(int i=0; i < unum; i++){
    for(int j=0; j < vnum; j++){
      IVec pt11 = surf.pt( i*uinc, j*vinc );
      IVec pt21 = surf.pt( (i+1)*uinc, j*vinc );
      IVec pt12 = surf.pt(i*uinc, j*vinc,10);
      IVec pt22 = surf.pt( (i+1)*uinc, j*vinc,10 );
      /*
      IVec pt12 = surf.pt( i*uinc, (j+1)*vinc );
      IVec pt22 = surf.pt( (i+1)*uinc, (j+1)*vinc );*/
      new ISurface(pt11, pt21, pt22, pt12).clr(i*uinc,j*vinc,0);
    }
  }
  
}

//REFRESH FUNCTION.
//Clears piGeon geometry in the scene.
void refpiGeon() {
  //Refreshes (deletes) iGeo geometry.
  
  IPoint[] ptarr = IG.points();
  ICurve[] crvarr = IG.curves();
  ISurface[] srfarr = IG.surfaces();
  IBrep[] breparr = IG.breps();
  IMesh[] mesharr = IG.meshes();

  //clear points
  for (IPoint pt: ptarr) {
    pt.del();
  }
  //clear curves
  for (ICurve crv: crvarr) {
    crv.del();
  }
  //clear surfaces
  for (ISurface srf:  srfarr) {
    srf.del();
  }
  //clear BReps
  for (IBrep brep:  breparr) {
    brep.del();
  }
  //clear meshes
  for (IMesh mesh: mesharr) {
    mesh.del();
  }
}

ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}

void mousePressed(){
  System.out.println("ay");
}
