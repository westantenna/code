var img;
var rectX = 0;
function preload(){
	img = loadImage("keihachi_shinjuku_2.png");
}
var canvas;


function setup(){
    canvas = createCanvas(4000, 3000);
  canvas.parent("map");
	
}


function draw(){
  image(img, 0, 0);
  fill(255, 255, 255);
  noStroke();
  rect(rectX, 0, 5000, 640);
  fill(127, 255, 255);
  rect(rectX-2, 0, 2, 640);
  rectX = rectX + 2;
  print(rectX);
}

