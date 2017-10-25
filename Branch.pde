class Branch{
 
  PVector beg;
  PVector end;
  PVector randbase;
  
  boolean setter = false;
  //float dir = int(random(-2,2));//start here
  
  Branch(float prevX_, float dir_, int sw_){
    float prevX = prevX_;
    float dir=dir_;
    //int sw =sw_;
    beg = new PVector(prevX,0);
    end = new PVector(beg.x + dir*(int(random(-width/40,15))), beg.y - int(random(2,12)));
    strokeCap(ROUND);
    //randbase = new PVector(-10,-10);//dir.copy();
  }
  
  void run(int sw){
    //println(dir);
    //strt();
    update();
    display(sw); 
    //offMap();
    //println(beg.x);
  }//end run
  
  void strt(/*float in_*/){

    end.x = beg.x + int(random(-4,4));
    end.y = beg.y - int(random(4,8));

  }//end start
  
  void display(int sw){
    stroke(random(240,255),200);
    strokeWeight(map(abs(end.x), 0, width/2, sw, 2));
    //println(map(abs(end.x), 0, width/2, sw, 2));
    
    line(beg.x, beg.y, end.x, end.y);

  }//end display
  
  void update(){

    beg.y +=1;
    end.y +=1;
    
  }//end update
  
  float born(){
    if (end.y == 0) {
    return end.x;
    
  }
    else return 0.0;
    }
    
  boolean dead(){

    return (end.y >= height+20);  

  }
  
  boolean offMap(){
    
    return (abs(end.x) > width/2-10 );
  }
}