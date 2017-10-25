Branches br, br1, mc;

PVector riverBend;
//PShader blur;

float dir;
boolean bent = false;
int fps = 20;

void setup() {
  //fullScreen(P3D,2);
  size(400, 1600, P3D);
  //hint(ENABLE_STROKE_PERSPECTIVE);
  stroke(255);
  strokeWeight(2);
  background(0);
  frameRate(fps);
  smooth(8);
  
  br = new Branches(-1,6);
  br1 = new Branches(1,6);
  mc = new Branches(0,15);
  riverBend = new PVector(-.1,.1);
  
  //blur = loadShader("blur.glsl");
  filter(BLUR,10);
}

void draw() {
  

  
  //else dir = -1;
  //println(dir);
   background(0);
   
   translate((width/2),-30, -40);
   //rotateX(PI/5);
   strokeWeight(40);
   stroke(255,150);
  //line(0, 0, 0, height);
   
   //strokeWeight(60);
   //point(random(-5,5),0);
   strokeWeight(1);
   //println(millis()%1000);
   if(br.report()<1){
     
     br.aBranching(0.0, 1.0,20);
   }
   if(br1.report()<1){

     br1.aBranching(0.0, -1.0,20);
   }
   if(mc.report()<1){

     mc.aBranching(0.0, .1,5);
   }
  

     //br.aBranching();
     br.run(.65,20);//int(random(19,21)));
     br1.run(-.65,20);//int(random(19,21)));
    // strokeWeight(10);
     rBend();
     mc.run(random(riverBend.x,riverBend.y),10);
     //println(bent);
     //for( int i = 1; i < 50; i++){
     //   stroke(255,30); 
     //   strokeWeight(random(1,5));
     //   line(width/i, -100, width/i, height + 20);
     //   line(-width/i, -100, -width/i, height + 20);
     //   stroke(255,255);
       
    
  //}
}//end draw


void rBend(){
  //boolean bent = false;
  
  while(frameCount%(5*fps)==0 && bent == false){
    
   if(int(random(2))==0){
   riverBend.x = -0.4;
   riverBend.y = 0;
   println("bendL");
   }
   else{
     riverBend.x = 0;
     riverBend.y = 0.4;
     println("bendR");
   }  
   bent = true;
  }
  bent = false;
  if(frameCount%1000==0){
    riverBend.x=0;
    riverBend.y=0;
    println("reset");
  }
}