/**
  NyARToolkit for proce55ing/1.0.0
  (c)2008-2011 nyatla
  airmail(at)ebony.plala.or.jp
  
  最も短いARToolKitのコードです。
  Hiroマーカを用意してください。
  
  This sample program is most small sample as simpleLite.
  The marker is "patt.hiro".
*/
PImage f0img;
PImage f1img;
PImage f2img;
PImage f3img;
PImage f4img;

import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;

void setup() {
  size(640,480,P3D);
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
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  if((!nya.isExist(0))){
    return;
  }
  nya.beginTransform(0);
  f0img = loadImage("data/fish0.png");
  image(f0img, width/4, height/4, width/2, height/2);  
  nya.endTransform();
}