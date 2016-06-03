size(1024, 768);
background(255);
fill(0);
beginShape();
vertex(0, 0);
bezierVertex(  0,   0,   0,   0, 512, 192);
bezierVertex(512, 192, 618, 192, 512, 192);
bezierVertex(406, 192, 320, 278, 320, 384);
bezierVertex(320, 490, 406, 576, 512, 576);
bezierVertex(618, 576, 704, 490, 704, 384);
bezierVertex(704, 278, 618, 192, 512, 192);
bezierVertex(512, 192,   0,   0,   0,   0);
bezierVertex(  0,   0,1024,   0,1024,   0);
bezierVertex(1024,  0,1024,   0,1024,1024);
bezierVertex(1024,1024,1024,1024,  0,1024);
endShape();

