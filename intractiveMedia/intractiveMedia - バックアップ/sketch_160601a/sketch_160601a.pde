PGraphics pg;
PGraphics mask;
final int ELLIPSE_SIZE = 30;
void setup() {
  size(400, 400);
  smooth();
  background(0);
 
  pg = createGraphics(width, height);
  pg.smooth();
  mask = createGraphics(width, height);
 
  pg.beginDraw();
  pg.background(255);
  pg.fill(0, 0, 255);
  pg.rect(100, 100, 250, 250);



  pg.endDraw();
 
 
  mask.beginDraw();
  mask.smooth();
  mask.background(0);
  mask.noStroke();
  mask.fill(255);
  mask.ellipse(mask.width / 2, mask.height / 2, mask.width, mask.height);
  mask.endDraw();
 
  pg.mask(mask);  
  image(pg, 0, 0); 

}