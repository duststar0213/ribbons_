
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.video.*;
float diameter=0;
float angle =0;
float c1 =0 ;
PImage img;
Capture cam;
float theta = 0;
  float r = 0;
boolean direction = true;
void setup(){
  size(1200,1200,P2D);
  background(255);
  frameRate(10);
  smooth();

  //colorMode(HSB);
  surface.setResizable(true);
  
}
void draw()
{
background(255);
translate(width/2,height/2);
   pushMatrix();
for(float i =0; i<100; i+=0.18){   

 rotate(sin(millis()/100)+cos(second()*i+10)-tan(i/100)+atan(i/10));
  drawFlower(i,i, 8);
 drawFlower(-i/10,i/10,10);

}
popMatrix();
println(second());
println(millis());
//println(mouseX);
saveFrame("wc-#####.jpg");  
}




 



void drawFlower(float x, float y,float radius){
  noStroke();
  colorMode(HSB);
  
 // fill(0,map(y,height,20,0.2,50),map(x,width,20,0.2,200),40);    //blue
   color col = color(round(map(x,0.1,width/10,10,255)), angle, 255,75); //rainbow color code
   fill(col);
 diameter = 2;
 float radius1 = 1 +  (cos(angle/mouseX) * diameter/4) + sin(angle/mouseX);
float radius2 = diameter- diameter*sin(angle/mouseX) + sin(angle/mouseX)*sqrt(abs(cos(angle/mouseY))/(sin(angle/mouseX)+1.4));
 float radius3 = 1 + (cos(angle * millis()) * diameter/4)+sin(millis());
 x = radius * cos(angle/millis()*15);
 y = radius * sin(angle/millis()*15);
 float x1 =  10 * sin(angle/millis()*10);
float  y1 = 10 * cos(angle/millis()*10);
   float thisx = r * cos(theta);
  float thisy =  r * sin(theta);

  // Increment the angle
  theta += 0.01;

  r += 0.1;

translate(x,y);
pushMatrix();
rotate(thisx);
ellipse(thisx, thisy, 3, 3); 
star(thisx, thisy,1,2,5);
point(x+radius1,x+radius1,thisx);
star(x,y,3,6,5);
popMatrix();
translate(x1,y1);
stroke(col);
pushMatrix();
rotate(thisy);
star(0,0,3,16,5);
float a =lerp(x1,y1,radius1);
float b = lerp(x1,y1, radius2);
rotate(a);
point(a,b);
rotate(thisx);
point(thisx,thisy);
rotate(thisy);
point(thisy+a, thisx+b);
popMatrix();
pushMatrix();
rotate(radius);
star(thisx, thisy, 3, 5, 5);
//point(x/mouseX,mouseX/10+y,radius);
strokeWeight(radius/2);
popMatrix();
angle += 0.15;
radius +=1;
radius1 +=1;
radius2 +=1;
 }
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    point(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    point(sx, sy);
  }
  endShape(CLOSE);
}

  
  

 