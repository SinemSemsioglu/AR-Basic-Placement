class Square{
 //architectural fields
 int light;
 int privacy;
 int h;
 int function;
 
 String dbIndex;
 
 //display fields
 float size;
 boolean clicked;
 boolean selected;
 boolean initialized;
 
 PVector location; //location of the object on the screen
 
 Square(float size_, PVector location_){
   size = size_;
   clicked = false;
   selected = false;
   initialized = false;
   location = location_;
 }
 
 boolean mouseOver(float mX, float mY){
   float lX = location.x;
   float lY = location.y;
   if(mX > lX-size/2 && mX < lX+size/2 && mY > lY-size/2 && mY < lY+size/2){
     return true; 
   }
   return false;
 }
 
 void initialize(){
 }
 
 void display(){
  stroke(0);
  
  if(clicked){
    fill(255,40,130);
  }else if(selected){
    fill(colrs[function]);
  }else{
    noFill();
  }
  
  if(mouseOver(mouseX,mouseY)){
    fill(255,200,220);
  }
  
  rectMode(CENTER);
  rect(location.x,location.y,size,size);
  
  if(initialized){
    text(dbIndex, size,size);
  }
 }
  
}
  
  
  
