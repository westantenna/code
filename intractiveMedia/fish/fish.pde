int numSpots = 25; //丸の数
PImage f0img, f1img, f2img, f3img, f4img;
int fishNo;
color bg = color(225, 233, 250, 100);

import processing.video.*;


Spot[] spots = new Spot[numSpots];

void setup() {
  size(1024, 768);
  colorMode(RGB, 255, 255, 255, 100);
  background(bg);
  
  
  String list[] = Capture.list();
  cam = new Capture(this, 640, 480, list[list.length-1]);
  nya = new MultiMarker(this,width,height,"data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("data/marker16.pat",80);
  cam.start();
  f0img = loadImage("data/fish0.png");
  f1img = loadImage("data/fish1.png");
  f2img = loadImage("data/fish2.png");
  f3img = loadImage("data/fish3.png");
  f4img = loadImage("data/fish4.png");

  smooth();
  noStroke();
  for (int i = 0; i < spots.length; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float rate = 2.0 + i * 0.1;
    float radius = random(0, 300);
    float alpha = 5;
    spots[i] = new Spot(x, y, radius, rate, alpha);
  }
  flock = new Flock();
  
  //はじめに出現する位置を取得する
  for (int i = 0;i < 12;i++)
  {
    Boid b = new Boid(random(width),random(height));
    flock.addBoid(b);    
  }
}




void draw() {
  flock.run();
  camera();
  fill(bg);
  noStroke();
  rect(0, 0, width, height);
//maru
  for (int i = 0; i < spots.length; i++) {
    spots[i].radius(); 
    spots[i].display();
  }
  
//mask 
//y：192~576 x：320~704
fill(0);
beginShape();
vertex(0, 0);
bezierVertex(  0,   0,   0,   0, 512, 192);
bezierVertex(512, 192, 618, 192, 512, 192);
bezierVertex(406, 192, 320, 278, 320, 384);
bezierVertex(320, 490, 406, 576, 512, 576);
bezierVertex(618, 576, 704, 490, 704, 384);
bezierVertex(704, 278, 618, 192, 512, 192);
bezierVertex(512, 192,   0,   0,   0,   0);
bezierVertex(  0,   0,1024,   0,1024,   0);
bezierVertex(1024,  0,1024,   0,1024,1024);
bezierVertex(1024,1024,1024,1024,  0,1024);
endShape();
//mask end
  fishimg();
}


class Spot {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the circle
  float speed; // Distance moved each frame
  float alpha; // Distance moved each frame
  int direction = 1; // Direction of motion (1 is down, -1 is up)

  // Constructor
  Spot(float xpos, float ypos, float dia, float sp, float al) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
    alpha = al;
  }

  // 1
  void radius() {
    diameter = diameter + 1;
    if (diameter > 300) {
      diameter = 0;
    }
  }
  void alpha() {
     alpha = alpha - 0.2;
  }

  // 2
  void display() {
    strokeWeight(12);
    noFill();
    stroke(161, 185, 234, alpha);
    for (int i = 0; i<5; i++) {
      ellipse(x, y, diameter + i*6, diameter + i*6);
    }
//    println(x, y, diameter, speed, alpha);
  }
}