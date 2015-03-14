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
   
   /*if(choice == 1){
     w = 4;
     h = 4;
   }else if(choice == 2){
     w = 8;
     h = 2;
   }
   //initilazing the squares
  
   
   if( w == h){
     x_start = location.x - sizeX*3/2;
     y_start = location.y - sizeY*3/2;
   }else{
     x_start = location.x - sizeX*7/2;
     y_start = location.y - sizeY/2;
   }*/
   
   w = 5;
   h = 7;
   lot = new Square[w][h];
   x_start = location.x - sizeX*2;
   y_start = location.y - sizeY*3;

   for(int i=0; i<w; i++){
     for(int j =0; j<h; j++){
      PVector loc = new PVector(x_start + i*sizeX, y_start + j*sizeY);
      lot[i][j] = new Square(75,35,loc);
     }
   }
 }
 
 void display(){
   shapeMode(CENTER);
   shape(site,location.x,location.y);
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
        Boolean temp = lot[i][j].clicked;
        lot[i][j].clicked = !temp;
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
  
}
