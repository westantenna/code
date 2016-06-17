void setup() {
  size(768,768);
  flock = new Flock();
  
  //はじめに出現する位置を取得する
//  Boid b = new Boid(random(width),random(height));
  flock.addBoid(b);
  smooth();
}

void draw() {
  background(#F2F6FF);
  flock.run();
}


Flock flock;
class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

//魚が出現する
  void addBoid(Boid b) {
    boids.add(b);
  }
}


class Boid {
  PVector location;//魚の位置 xとy
  PVector velocity;//魚の動く速度 xとy
  int r;//進行方向
  
  //魚の前後が震えるところの制御
  float angle;
  float angleSpeed;
  float angleFish;

//setupで取得した数値をベクターに代入している
  Boid(float x, float y) {
    //魚の動く方向とスピード
    velocity = new PVector(random(-1, 1), random(-1, 1));
    //魚現れる最初の位置
    location = new PVector(x, y);
    //魚の震える激しさ
    angleSpeed = random(1,2);
  }

  void run(ArrayList<Boid> boids) {
    update(); //魚が進む
    borders(); //魚の形
    render(); //魚が壁に当たって跳ね返る
  }
//魚が進む
 void update() {
    location.add(velocity);
  }

  void render() {
    angle = angle+angleSpeed;
    float offsetHead;
    float offsetTail;

//魚の頭の震えの数値、色
    offsetHead = sin(angle*0.2+PI)*0;
    offsetTail = sin(angle*0.2+PI/2)*6;
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(#D36742);
    noStroke();
    
    //魚の形
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex((offsetTail), -90);
    bezierVertex((-11+offsetHead), -150, (11+offsetHead),-150,(offsetTail), -90);
    endShape();
    popMatrix();

    pushMatrix();
    translate(location.x+60, location.y+160);
    rotate(theta);
    beginShape();
    vertex((offsetTail), -80);
    bezierVertex((-20+offsetHead), -200, (20+offsetHead), -200, (offsetTail), -80);
    endShape();
    popMatrix();
  }

  // 画面の枠に当たって跳ね返る
  void borders() {
    if (location.x < -r) velocity.x = -velocity.x;
    if (location.y < -r) velocity.y = -velocity.y;
    if (location.x > width+r) velocity.x = -velocity.x;
    if (location.y > height+r) velocity.y = -velocity.y;
  }
}