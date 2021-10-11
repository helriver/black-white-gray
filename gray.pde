void setup(){
  
  float a, b, min, col;
  float[] x;
  x = new float[10];
  float[] y;
  y = new float[10];
  String s = "";
  boolean[] t;
  t = new boolean[100];
  int m1, n1, m2, n2;
  boolean bool;

  x[0] = 0;
  x[9] = 1000;
  y[0] = 0;
  y[9] = 1000;
  
  size(1000,1000);
  background(255);
  for(int i=0; i<8; i++){
    a=random(1000);
    strokeWeight(random(5)+3);
    stroke(0);
    line(a,0,a,1000);
    x[i+1] = a;
    b=random(1000);
    line(0,b,1000,b);
    y[i+1] = b;
  }
  
  for(int i=1; i<8; i++){
    for(int j=i; j<9; j++){
      if(x[j]-x[i-1]<20){x[j]+=15;}
      if(y[j]-y[i-1]<20){y[j]+=15;}
      if(x[j] < x[i]){
        min = x[j];
        x[j] = x[i];
        x[i] = min;
      }
      if(y[j] < y[i]){
        min = y[j];
        y[j] = y[i];
        y[i] = min;
      }
    }
  }
  if(x[8]>1000){x[8]=1000;}
  if(y[8]>1000){y[8]=1000;}

  for(int i=0; i<100; i++){ t[i]=true; }
    
  for(int i=0; i<15; i++){
    bool=true;
    m1=int(random(9)); n1=int(random(9));
    m2=m1+1+int(random(9-m1)); n2=n1+1+int(random(9-n1));
    outer:
    for(int j=m1; j<=m2; j++){
      for(int k=n1; k<=n2; k++){
          if(t[k*10+j]==false){
            bool=false;
            break outer;
          }
      }
    }
    
//    if(t[n1*10+m1]==true & t[n2*10+m2]==true){
//      col = random(3); 
//      if( 0<=col & col<1 ){fill(63);}
//      else if( 1<=col & col<2 ){fill(127);}
//      else{fill(255);}
    if(bool==true && x[m2]-x[m1]<=618 && y[n2]-y[n1]<=618){
      fill(random(100)+25);
      stroke(0);
      strokeWeight(random(5)+3);
      rect(x[m1], y[n1], x[m2]-x[m1], y[n2]-y[n1]);
      for(int j=m1+1; j<m2; j++){
        for(int k=n1+1; k<n2; k++){
          t[k*10+j]=false;
        }
      }
    }
    else{ i -= 1; }
  }
  
/*  for(int i=0; i<62; i++){
    col=random(3);
    if( 0<=col & col<1 ){fill(63);}
    else if( 1<=col & col<2 ){fill(127);}
    else{fill(255);}
    stroke(0);
    rect(x[int(random(9))],y[int(random(9))],x[int(random(9))],y[int(random(9))]);
  }*/

}
