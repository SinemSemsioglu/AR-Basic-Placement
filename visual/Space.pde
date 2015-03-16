class Space{
 Square[][] lot;
 PVector location; //center
 float sizeX; //width of each square
 float sizeY; //height of each square
 int w;
 int h;
 
 PShape site;
 
 Space(int choice, float sizeX_,float sizeY_, PVector location_, String path){
   
   site = loadShape(path);
   
   location = location_;
   sizeX = sizeX_;
   sizeY = sizeY_;
   
   float x_start;
   float y_start;
   
   
   w = 5;
   h = 7;
   lot = new Square[w][h];
   x_start = location.x - sizeX*2;
   y_start = location.y - sizeY*3;

   for(int i=0; i<w; i++){
     for(int j =0; j<h; j++){
      PVector loc = new PVector(x_start + i*sizeX, y_start + j*sizeY);
      lot[i][j] = new Square(sizeX,sizeY,loc);
     }
   }
 }
 
 void display(){
   shapeMode(CENTER);
   shape(site,location.x,location.y);
   rotate(-PI/48);
   translate(-30,10);
   for(int i=0; i<w; i++){
     for(int j =0; j<h; j++){
       lot[i][j].display();
     }
   }
 }
 
 void checkClick(float mX,float mY){
   for(int i=0; i<w; i++){
    for(int j=0; j<h; j++){
      if(lot[i][j].mouseOver(mX,mY) && !lot[i][j].selected){
        Boolean temp;
        if(phase == 0){
          temp = lot[i][j].invisible;
          lot[i][j].invisible = !temp;
        }else if(phase == 1){
          temp = lot[i][j].clicked;
          lot[i][j].clicked = !temp;
        }
      }
     }
    }
  }
  
  void initializeSq(){
   for(int i=0; i<w; i++){
    for(int j=0; j<h; j++){
      if(lot[i][j].clicked){
        lot[i][j].clicked = false;
        lot[i][j].selected = true;
        lot[i][j].function = count;
        lot[i][j].initialize();
      }
     }
    }
  }
  
  void removeSqs(){
    for(int i=0; i<w; i++){
    for(int j=0; j<h; j++){
      if(lot[i][j].invisible){
        lot[i][j]=null;
      }
     }
    }
  }
  
}
