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
 phase = 1;
 count = 0;
 areas = new String[4];
 colrs = new  color[4];
 areas[0] = "solar"; areas[1]="dining";areas[2]="recreation";areas[3]="education";
 colrs[0] = color(200,100,100); colrs[1] = color(100,200,170); colrs[2] = color(10,80,100); colrs[3] = color(200,140,50);
 siteLoc = "siteapp.svg";
 sp = new Space(2, 75, 35, new PVector(width/2, height/2), siteLoc);
}

void draw(){
  background(255);
  fill(255);
  
  if(phase == 0){
    /*text("Looks like you have a 16 unit square space\n How would you like to organize your squares?\n Press 1 for 4x4, 2 for 2x8",25,40);
    text(typing,25,90);
    if(saved.equals("1")){
      sp = new Space(1, 75, 35, new PVector(width/2, height/2), siteLoc);
      saved = "";
      phase++;
    }else if(saved.equals("2")){
      sp = new Space(2, 75, 35, new PVector(width/2, height/2), siteLoc);
      saved = "";
      phase++;
    }*/
    
  }else if(phase == 1){
    if(count>3) phase = 2;
    else{
      if(sp != null) sp.display(); 
      fill(255);
      text("Please define the "+areas[count]+" area and when you are finished press enter.",25,40);  
    }
  }else if(phase == 2){
   sp.display(); 
  }
}

void keyPressed(){
  if(phase == 0){
  if (keyCode == ENTER ) {
    saved = typing;
    typing = ""; 
  } else {
    typing = typing + key; 
  } 
  }else if (phase == 1){
    if(keyCode == ENTER){
      count++;
      sp.initializeSq();
    }
  }
  
}

//draws a 4x4 space
void drawFour(){
 stroke(0);
 noFill();
 rect(0,0,width/4,height/4);
 //this works if width is the same as height
 for(int i = width/16; i<width/4; i+=width/16){
   line(i,0,i,height/4);
   line(0,i,width/4,i);
 }
}
//draws a 8x8 space
void drawEight(){
 stroke(0);
 noFill(); 
 rect(0,0,width/2,height/8);
 for(int i = width/16; i<width/2; i+=width/16){
   line(i,0,i,height/8);
 }

 line(0,height/16,width/2,height/16);

}

void mouseClicked(){
  if(sp != null && phase == 1) sp.checkClick(mouseX,mouseY);
}


