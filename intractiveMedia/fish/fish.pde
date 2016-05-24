//maru no kazu
int numSpots = 5;

Spot[] spots = new Spot[numSpots];

void setup() {
  size(1024, 768);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noStroke();
  for (int i = 0; i < spots.length; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float rate = 2.0 + i * 0.1;
    float radius = random(10, 30);
    spots[i] = new Spot(x, y, radius, rate);
  }
}

void draw() {
//background Color
  fill(220, 1, 100, 2);
  noStroke();
  rect(0, 0, width, height);


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
  int direction = 1; // Direction of motion (1 is down, -1 is up)

  // Constructor
  Spot(float xpos, float ypos, float dia, float sp) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
  }

  // 1
  void radius() {
    diameter = diameter + 1;
  }

  // 2
  void display() {
  strokeWeight(20);
  stroke(240, 20, 95, 6);
  noFill();
  ellipse(x, y, diameter, diameter);
  
  if (diameter > 600) {
    diameter = 0;
  }
}
}