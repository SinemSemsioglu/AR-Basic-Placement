class Space{
 Square[][] lot;
 PVector location; //center
 float size; //size of each square
 int w;
 int h;
 
 Space(int choice, float size_, PVector location_){
   location = location_;
   size = size_;
   if(choice == 1){
     w = 4;
     h = 4;
   }else if(choice == 2){
     w = 8;
     h = 2;
   }
   //initilazing the squares
   lot = new Square[w][h];
   float x_start;
   float y_start;
   if( w == h){
     x_start = location.x - size*3/2;
     y_start = location.y - size*3/2;
   }else{
     x_start = location.x - size*7/2;
     y_start = location.y - size/2;
   }
   for(int i=0; i<w; i++){
     for(int j =0; j<h; j++){
      PVector loc = new PVector(x_start + i*size, y_start + j*size);
      lot[i][j] = new Square(size, loc);
     }
   }
 }
 
 void display(){
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
      }
     }
    }
  }
  
}
