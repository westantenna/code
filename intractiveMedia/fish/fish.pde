//maru no kazu

int numSpots = 5;
PImage img, maskImage;
int jx = 0;
int jy = 0;


Spot[] spots = new Spot[numSpots];

void setup() {
  size(768, 768);
  colorMode(HSB, 360, 100, 100, 100);
  background(220, 3, 100, 100);
  smooth();
  noStroke();
  for (int i = 0; i < spots.length; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float rate = 2.0 + i * 0.1;
    float radius = random(-1000, 300);
    float alpha = 10;

    spots[i] = new Spot(x, y, radius, rate, alpha);
  }
}

void draw() {
//background Color
  fill(220, 3, 100, 4);
  noStroke();
  rect(0, 0, width, height);

  println(jx, jy);  
  if (jx > 200) {
    jx = -1;
  } if (jy > 200)  {
    jy = -1;
  } else {
    jx++;
    jy++;
  }
//maru

  for (int i = 0; i < spots.length; i++) {
    spots[i].radius(); // Move each object
    spots[i].display(); // Display each object
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
  }
  void alpha() {
    alpha = alpha - 1;
  }

  // 2
  void display() {
    strokeWeight(20);
    fill(220, 3, 100, alpha*2);
    stroke(240, 20, 95, alpha);
  //  noFill();
    if (diameter < 0) {
      diameter = 0;
    }
    ellipse(x, y, diameter, diameter);
    println(x, y, diameter, speed, alpha);
    if (diameter > 600) {
      diameter = 0;
    }
  }
}