import jp.nyatla.nyar4psg.*;
Capture cam;
MultiMarker nya;
int test,f;
int x = 400;
int y = 300;
int w = 200;
int h = 160;

void fishimg() {
//カメラ画像を投影したい時は、ここを1にする  if (cam.available() == false) return; // カメラの準備ができてないときは何もしない
  cam.read();
  if (test == 1) {
    image(cam, 0, 0, 320, 240);
  }
  nya.detect(cam);

//  background(0);

  // マーカを検出していない時、ここから
  if (!nya.isExist(0)) {
    println("NO", f);
    if (f == 0) {
      fishNo = int(random(1, 5.0));    
    }
    if (random(0,1) > 0.98) {
      f = 0;
    }
  
  //マーカを検出した時、ここまで
  } else {
    println("MARKER", f);
    f = 1;
  //  m = 0;
  }
  
  
  if (f == 1) {
    if (fishNo == 0) {
      f0img = loadImage("data/fish0.png");
      image(f0img, x, y, w, h);
    } 
    if (fishNo == 1) {
      f1img = loadImage("data/fish1.png");
      image(f1img, x, y, w, h);
    }       
    if (fishNo == 2) {
      f2img = loadImage("data/fish2.png");
      image(f2img, x, y, w, h);
    }       
    if (fishNo == 3) {
      f3img = loadImage("data/fish3.png");
      image(f3img, x, y, w, h);
    }       
    if (fishNo == 4) {
      f4img = loadImage("data/fish4.png");
      image(f4img, x, y, w, h);
    }
  }}