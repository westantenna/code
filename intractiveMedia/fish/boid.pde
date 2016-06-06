class Boid {
  PVector location;//魚の位置 xとy
  PVector velocity;//魚の動く速度 xとy
  int r;//進行方向
  
  //魚の前後が震えるところの制御
  float angle;
  float angleSpeed;
  float angleFish;
  float size;
  
  int type = 0;//色

//setupで取得した数値をベクターに代入している
  Boid(float x, float y) {
    //魚の動く方向とスピード
    velocity = new PVector(random(-1, 1), random(-1, 1));
    //魚現れる最初の位置
    location = new PVector(x, y);
    //魚の震える激しさ
    angleSpeed = random(1,1);
    
    type = int(random(0, 2));//０１２の中のものをランダムで表示
    size = random(0.3, 1.5);
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
    offsetHead = sin(angle*0.2+PI)*2;
    offsetTail = sin(angle*0.2+PI/2)*5;
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);

    //fill(#ff7154);
    if (type == 0) fill(#ff7154);
    if (type == 1) fill(#6784a8);
    
    noStroke();
    
    //魚の形
    pushMatrix();
    translate(location.x, location.y);
    scale(size);//大きさ変える
    rotate(theta);
    beginShape();
    vertex((offsetTail), -50);
    bezierVertex((-11+offsetHead), -120, (11+offsetHead),-120,(offsetTail), -50);
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