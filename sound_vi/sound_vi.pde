import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
  boolean sw =true; //再生、停止用のbool値


Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
FFT fft;
int xa; //time

void setup(){
  size(2700,1000);
  colorMode(HSB, 360,100,100);
  background(360, 0, 0);
  noStroke();
  minim = new Minim(this);
  player = minim.loadFile("tau_hashimoto.wav");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.play();
  background(0);
  meta = player.getMetaData();
  fft = new FFT(player.bufferSize(), 512);
  fft.window(FFT.HAMMING);
  frameRate(30);
}

void draw() { 
  fft.forward(player.mix);
  for (int i =0; i < fft.specSize(); i++) {
    float h = map(player.mix.level(), 0, 0.03, 240, 0);
//    float h2 = map(fft.getBand(i), 0, 1, 0, 90);
    float s = map(fft.getBand(i), 0, 1, 0, 150);
    float b = map(fft.getBand(i), 0, 1, 100, 60);
//    println(player.mix.level());
    println(h, s, b);
    fill(h, s, b);
    float i2 = map(i, 0, fft.specSize(), 600, 50);
    rect(xa*2, i2, 5, 2);
//    line(x, height, x, height- fft.getBand(i)*8);
  }
  xa++;
  println(player.mix);
}

void keyPressed() {
switch(key) {
case 'a':
if(sw) {
player.pause();
sw = false;
} else {
player.play();
sw = true;
}
break;
}
}