PImage f0img;
PImage f1img;
PImage f2img;
PImage f3img;
PImage f4img;

int fishNo;

import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
void setup() {
  size(640,480);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  String list[] = Capture.list();
  cam = new Capture(this, 640, 480, list[list.length-1]);
  nya=new MultiMarker(this,width,height,"data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("data/marker16.pat",80);
  cam.start();
  f0img = loadImage("data/fish0.png");
  f1img = loadImage("data/fish1.png");
  f2img = loadImage("data/fish2.png");
  f3img = loadImage("data/fish3.png");
  f4img = loadImage("data/fish4.png");
}

void draw() {
  if (cam.available() == false) return; // カメラの準備ができてないときは何もしない
  cam.read();
  nya.detect(cam);
  background(0);
  if (!nya.isExist(0)) {
    fishNo = int(random(1, 5.0));
    println("NO");
  } else {
    println("MARKER!");
    if (fishNo == 0) {
      f0img = loadImage("data/fish0.png");
      image(f0img, 0, 0, width/2, height/2);
    } 
    if (fishNo == 1) {
      f1img = loadImage("data/fish1.png");
      image(f1img, 0, 0, width/2, height/2);
    }       
    if (fishNo == 2) {
      f2img = loadImage("data/fish2.png");
      image(f2img, 0, 0, width/2, height/2);
    }       
    if (fishNo == 3) {
      f3img = loadImage("data/fish3.png");
      image(f3img, 0, 0, width/2, height/2);
    }       
    if (fishNo == 4) {
      f4img = loadImage("data/fish4.png");
      image(f4img, 0, 0, width/2, height/2);
    }       
  }
}