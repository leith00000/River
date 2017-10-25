class Branches{
  
  ArrayList<Branch> branches;

  
  float prevX =0;
  
 
  
  Branches(float dir_, int sw_){
    //theBegin = new PVector(0,0);
    branches = new ArrayList<Branch>();
    dir = dir_;
    int sw = sw_;
    
   }

  int report(){
   return branches.size(); 
  }

  void aBranching(float prevX, float dir, int sw){
    branches.add(new Branch(prevX, dir, sw));  
  }
  
  void run(float dir, int sw){
     //boolean setter = true;
    
   for (int i = branches.size()-1; i>= 0; i--){
     Branch b = branches.get(i);

       b.run(sw);
       if(b.offMap()){
         b.beg.x=0;
         b.end.x=0;
         b.strt();
         //println("offMap");
       }
       //println(branches.size());
       if(b.born() != 0){
         prevX=b.end.x;
         //println(riddim());
         if(random(0,1000)<3000 && report()< 60 && riddim()){
           //println(b.born());
           //println(b.end.x);
         aBranching(b.end.x, dir,sw);
         aBranching(b.end.x, -dir,sw);
         //println("so this happened");
         }
         else aBranching(prevX, dir,sw);
         b.run(sw);  
         //println("that happened");
         }
         
       if(b.dead()){
      
         branches.remove(i);
         if(report()==0){
         aBranching(0.0, dir,sw);
         b.strt();
         b.run(sw);
         
         }
        }//if b dead
        
        
   }//end for
  }//end run
  
  boolean riddim(){
    //println(millis() % 4000);
    return (millis() % random(1000,4000) < 400);
}
}