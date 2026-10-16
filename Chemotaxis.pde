Bacteria[] bob = new Bacteria[15];
int[] grassX = new int[700];
int[] grassY = new int[700];
boolean appleVisible = true;

void setup(){     
  size(500,500);
  for(int i=0;i<bob.length;i++)
     bob[i] = new Bacteria();
  for(int i=0;i<grassX.length;i++){
    grassX[i] = (int)(Math.random()*500);
    grassY[i] = (int)(Math.random()*500);
  }
}   
void draw()   
{    
  background(90, 180, 80);  // green background
  stroke(50, 140, 50);
  strokeWeight(1);
  for(int i=0;i<grassX.length;i++){
    line(grassX[i], grassY[i], grassX[i]+2, grassY[i]-8);
  }
  
  for(int i=0;i<bob.length;i++){
    bob[i].move();
    bob[i].show();
    // if an ant is close to the apple, the apple disappears
    if(dist(bob[i].myX, bob[i].myY, mouseX, mouseY) < 25){
      appleVisible = false;
    }
  }

  if(appleVisible == true){
    noCursor();  // hide the normal cursor
    drawApple();
  } else {
    cursor();    // bring the normal cursor back
  }
}
void mousePressed(){
  appleVisible = true;  // click to get the apple back
}

void drawApple(){
  stroke(0);
  strokeWeight(2);

  // stem (line)
  line(mouseX, mouseY-10, mouseX+3, mouseY-18);

  // leaf (green shape)
  fill(60, 160, 60);
  ellipse(mouseX+8, mouseY-15, 10, 6);

  // apple body (red shapes)
  fill(220, 30, 30);
  ellipse(mouseX-6, mouseY, 18, 22);  // left half
  ellipse(mouseX+6, mouseY, 18, 22);  // right half
}

class Bacteria
{
  color myColor;
  int myX,myY;

  Bacteria(){
    myX = (int)(Math.random() * 500);
    myY = (int)(Math.random() * 500);
    myColor = color((int)(Math.random() * 256),(int)(Math.random() * 256),(int)(Math.random() * 256));
    move();
    show();
  }
   void move(){
    if(mouseX>myX)
      myX = myX + (int)(Math.random()*5)-1;
    else
      myX = myX - (int)(Math.random()*5)-1;
    if(mouseY>myY)
      myY = myY + (int)(Math.random()*5)-1;
    else
      myY = myY - (int)(Math.random()*5)-1;
  }
   void show(){
      stroke(0);
      strokeWeight(2);
      line(myX-10, myY, myX-15, myY-10);  // back legs
      line(myX-10, myY, myX-15, myY+10);
      line(myX, myY, myX, myY-12);        // middle legs
      line(myX, myY, myX, myY+12);
      line(myX+10, myY, myX+15, myY-10);  // front legs
      line(myX+10, myY, myX+15, myY+10);
    
      // antennae (lines)
      line(myX+20, myY, myX+28, myY-8);
      line(myX+20, myY, myX+28, myY+8);
    
      // body (shapes)
      fill(myColor);
      ellipse(myX-12, myY, 16, 12);  // abdomen (back part)
      ellipse(myX, myY, 12, 10);     // thorax (middle part)
      ellipse(myX+12, myY, 10, 10);  // head
    
      // eyes
      fill(255);
      ellipse(myX+14, myY-3, 3, 3);
      ellipse(myX+14, myY+3, 3, 3);
  }
}    


