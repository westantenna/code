import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int r = 200;
int xa;

void setup(){
  size(640,480);
  
  minim = new Minim(this);
  player = minim.loadFile("chofu_hachioji.mp3");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.play();
  background(0);
}

void draw() { 
  beat.detect(player.mix);
//  translate(width/2, height/2);
  noFill();
  
  
  fill(-1, 10);
  stroke(-1, 50);
  
  int bsize = player.bufferSize();
  
  beginShape();
  noFill();
  stroke(-1, 50);
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (player.left.get(i)*100)*2;
    float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize)*2;
    
    fill(#ffffff);
    
    ellipse(xa, i/2, x2, x2);
    
/*    vertex(x2, y2);
    pushStyle();
    stroke(-1);
    strokeWeight(2);
    point(x2, y2);
    popStyle();   
*/
    print(player.left.get(i));
  }
  xa++;  
  println("xa=" + xa);
  ellipse (xa+100, 40, player.left.level(), player.left.level()*4000);
}