class Square{
 //architectural fields
 int light;
 int privacy;
 int h;
 int function;
 
 String dbIndex;
 
 //display fields
 float sizeX;
 float sizeY;
 boolean clicked;
 boolean selected;
 boolean initialized;
 
 PVector location; //location of the object on the screen
 
 Square(float sizeX_, float sizeY_, PVector location_){
   sizeX = sizeX_;
   sizeY = sizeY_;
   clicked = false;
   selected = false;
   initialized = false;
   location = location_;
 }
 
 boolean mouseOver(float mX, float mY){
   float lX = location.x;
   float lY = location.y;
   if(mX > lX-sizeX/2 && mX < lX+sizeX/2 && mY > lY-sizeY/2 && mY < lY+sizeY/2){
     return true; 
   }
   return false;
 }
 
 void initialize(){
   int l;
   int p;
   int h;
   //make random better
   if(function == 1){
     l = (int)random(8,10);
     p = (int)random(1,10);
     h = (int)random(7,10);
   }else if(function == 2){
     l = (int)random(5,8);
     p = (int)random(3,10);
     h = (int)random(3,9);
   }else if(function == 3){
     l = (int)random(3,5);
     p = (int)random(3,7);
     h = (int)random(6,9); 
   }else if(function == 4){
     l = (int)random(3,6);
     p = (int)random(1,3);
     h = (int)random(3,6);
   }else{
    //problem 
    return;
   }
   
    ArrayList<String> r = search(l,p,h);
    int randPick = (int)random(0,r.size()-1);
    dbIndex = r.get(randPick);
    initialized = true;
   
 }
 
 void display(){
  stroke(200);
  
  if(clicked){
    fill(255,40,130,80);
  }else if(selected){
    fill(colrs[function-1],80);
  }else{
    noFill();
  }
  
  if(mouseOver(mouseX,mouseY)){
    fill(255,200,220,60);
  }
  
  rectMode(CENTER);
  rect(location.x,location.y,sizeX,sizeY);
  
  if(initialized){
    fill(255);
    text(dbIndex, location.x-sizeX/2,location.y);
  }
 }
  
}
  
  
  
