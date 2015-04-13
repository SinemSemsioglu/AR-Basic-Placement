//the ControlFrame class extends PApplet, so we 
// are creating a new processing applet inside a
// new frame with a controlP5 object loaded

public class ControlFrame extends PApplet {

  ControlP5 cp5;

  Object parent;
  
  int w, h;

  int abc = 100;
  
  ArrayList<Controller> controls; 
  
  public void setup() {
    size(w, h);
    frameRate(25);
    cp5 = new ControlP5(this);
    controls.add(cp5.addSlider("selection").setRange(0, 2).setPosition(10,10));
    controls.add(cp5.addSlider("p11").setRange(1, 10).setPosition(10,60));
    controls.add(cp5.addSlider("p12").setRange(1, 10).setPosition(10,80));
    controls.add(cp5.addSlider("p13").setRange(1, 10).setPosition(10,100));
    controls.add(cp5.addSlider("p21").setRange(1, 10).setPosition(10,120));
    controls.add(cp5.addSlider("p22").setRange(1, 10).setPosition(10,140));
    controls.add(cp5.addSlider("p23").setRange(1, 10).setPosition(10,160));
    controls.add(cp5.addSlider("p31").setRange(1, 10).setPosition(10,180));
    controls.add(cp5.addSlider("p32").setRange(1, 10).setPosition(10,200));
    controls.add(cp5.addSlider("p33").setRange(1, 10).setPosition(10,220));
    controls.add(cp5.addSlider("p41").setRange(1, 10).setPosition(10,240));
    controls.add(cp5.addSlider("p42").setRange(1, 10).setPosition(10,260));
    controls.add(cp5.addSlider("p43").setRange(1, 10).setPosition(10,280));
    
   // controls.add(cp5.addSlider("off2").plugTo(parent,"def").setRange(0, 255).setPosition(10,30));
  }

  public void draw() {
      background(abc);
  }
  
  private ControlFrame() {
  }
  

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
    controls = new ArrayList<Controller>();
  }
  
  public ControlP5 control() {
    return cp5;
  }
  
  
}
