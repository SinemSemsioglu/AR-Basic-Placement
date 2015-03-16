String saved = "";
String typing = "";
int phase;
int count;
String[] areas;
color[] colrs;

Space sp;
String siteLoc;

void setup(){
 size(750,750);
 readFile("YOURPATH/visual/data/sample_db");
 phase = 0;
 count = 0;
 areas = new String[4];
 colrs = new  color[4];
 areas[0] = "solar"; areas[1]="dining";areas[2]="recreation";areas[3]="education";
 colrs[0] = color(200,100,100); colrs[1] = color(100,200,170); colrs[2] = color(10,80,100); colrs[3] = color(200,140,50);
 siteLoc = "siteapp.svg";
 sp = new Space(2, 80, 35, new PVector(width/2, height/2), siteLoc);
}

void draw(){
  background(255);
  fill(255);
  
  if(phase == 0){
    if(sp != null) sp.display();
    fill(255);
    rotate(PI/48);
    translate(30,-10);
    text("If you want to remove some squares this is the time, press enter to save",25,40);
  }else if(phase == 1){
    if(count>3) phase = 2;
    else{
      if(sp != null) sp.display(); 
      fill(255);
      rotate(PI/48);
      translate(30,10);
      text("Please define the "+areas[count]+" area and when you are finished press enter.",25,40);  
    }
  }else if(phase == 2){
   sp.display(); 
  }
}

void keyPressed(){
  if(keyCode == ENTER){
    if(phase == 0){
      phase++;
    }else if (phase == 1){
      count++;
      sp.initializeSq();
    }
  }
  
}

void mouseClicked(){
  if(sp != null) sp.checkClick(mouseX,mouseY);
}


