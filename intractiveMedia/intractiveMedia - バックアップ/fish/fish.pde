//maru no kazu
int numSpots = 8;
PImage img, maskImage;
color bg = color(225, 233, 250, 100);

Spot[] spots = new Spot[numSpots];

void setup() {

  size(768, 768);
  colorMode(RGB, 255, 255, 255, 100);
  background(bg);
  smooth();
  noStroke();
  for (int i = 0; i < spots.length; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float rate = 2.0 + i * 0.1;
    float radius = random(0, 300);
    float alpha = 7;
    spots[i] = new Spot(x, y, radius, rate, alpha);
  }
}

void draw() {
  fill(bg);
  noStroke();
  rect(0, 0, width, height);
//maru
  for (int i = 0; i < spots.length; i++) {
    spots[i].radius(); 
    spots[i].display();
  }
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
    strokeWeight(20);
    noFill();
    stroke(161, 185, 234, alpha);
    for (int i = 0; i<6; i++) {
      ellipse(x, y, diameter + i*7, diameter + i*7);
    }
    println(x, y, diameter, speed, alpha);
  }
}