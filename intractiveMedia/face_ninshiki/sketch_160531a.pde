import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;

void setup() {
  opencv = new OpenCV(this, "165.jpg");
  size(480, 360);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
}

void draw() {
  image(opencv.getInput(), 0, 0);

  noFill();
  stroke(0, 255, 255);
  strokeWeight(8);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}