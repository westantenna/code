//kidoumadeni jikanga kakaruyo!!
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(1280, 960);
  //↑640,480
  
  String list[] = Capture.list();
  video = new Capture(this, 640, 480, list[list.length-1]);
 
  
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}