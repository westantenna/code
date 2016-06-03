/**
  NyARToolkit for proce55ing/1.0.0
  (c)2008-2011 nyatla
  airmail(at)ebony.plala.or.jp
  
  最も短いARToolKitのコードです。
  Hiroマーカを用意してください。
  
  This sample program is most small sample as simpleLite.
  The marker is "patt.hiro".
*/
PImage fimg;

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
    fimg = loadImage("data/fish0.png");
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
  fimg = loadImage("data/fish0.png");
  image(fimg, width/4, height/4, width/2, height/2);  
  nya.endTransform();
}