var main;
var shibu;
var shin;
var baba;
var ike;

var mainStationName=[];
var mainStationX=[];
var mainStationY=[];
var mainPassengers=[];

var stationName=[];
var radian=[];
var time=[];
var passengers=[];
var difference=[];

var mainRowCount;
var shibuRowCount;
var shinRowCount;
var babaRowCount;
var ikeRowCount;

var fSize;
var fColor;

var moji = 1;

var j = 0;

function preload(){
	main=loadTable("main.csv")
  	shibu=loadTable("shibu.csv");
  	shin=loadTable("shin.csv");
  	baba=loadTable("baba.csv");
  	ike=loadTable("ike.csv");
    plus = loadImage("plus.png");
    minus = loadImage("minus.png");
}
var canvas;


function setup(){
    canvas = createCanvas(3840, 2160, SVG);
    canvas.class("p5");
   	frameRate(24);
    colorMode(HSB, 360, 100, 100, 100);
	background(0, 0, 100, 100);
	mainRowCount = main.getRowCount();
	shibuRowCount = shibu.getRowCount();
	shinRowCount = shin.getRowCount();
	babaRowCount = baba.getRowCount();
	ikeRowCount = ike.getRowCount();

  	textAlign(CENTER);
  	rectMode(CENTER);

  	for(var i=0; i<mainRowCount;i+=1){
    	mainPassengers[i]=main.getNum(i,3);
    	mainStationY[i]=main.getNum(i,2);
    	mainStationX[i]=main.getNum(i,1);
    	mainStationName[i]=main.getString(i,0);
  	}

  	for(var i=0; i<shibuRowCount;i+=1){
    	difference[i]=shibu.getNum(i,4);
    	passengers[i]=shibu.getNum(i,3);
    	time[i]=shibu.getNum(i,2);
    	radian[i]=shibu.getNum(i,1);
    	stationName[i]=shibu.getString(i,0);
  	}

  	for(i; i<(shibuRowCount+shinRowCount);i+=1){
    	difference[i]=shin.getNum(i-shibuRowCount,4);
    	passengers[i]=shin.getNum(i-shibuRowCount,3);
    	time[i]=shin.getNum(i-shibuRowCount,2);
    	radian[i]=shin.getNum(i-shibuRowCount,1);
    	stationName[i]=shin.getString(i-shibuRowCount,0);
  	}

  	for(i; i<(shibuRowCount+shinRowCount+babaRowCount);i+=1){
    	difference[i]=baba.getNum(i-shibuRowCount-shinRowCount,4);
    	passengers[i]=baba.getNum(i-shibuRowCount-shinRowCount,3);
    	time[i]=baba.getNum(i-shibuRowCount-shinRowCount,2);
    	radian[i]=baba.getNum(i-shibuRowCount-shinRowCount,1);
    	stationName[i]=baba.getString(i-shibuRowCount-shinRowCount,0);
  	}
  	for(i; i<(shibuRowCount+shinRowCount+babaRowCount+ikeRowCount);i+=1){
    	difference[i]=ike.getNum(i-shibuRowCount-shinRowCount-babaRowCount,4);
    	passengers[i]=ike.getNum(i-shibuRowCount-shinRowCount-babaRowCount,3);
    	time[i]=ike.getNum(i-shibuRowCount-shinRowCount-babaRowCount,2);
    	radian[i]=ike.getNum(i-shibuRowCount-shinRowCount-babaRowCount,1);
    	stationName[i]=ike.getString(i-shibuRowCount-shinRowCount-babaRowCount,0);
  	}

}

/*
東京	0
品川	1
渋谷	2
新宿	3
馬場	4
池袋	5
日暮里	6
北千住	7
上野	8
秋葉原	9
錦糸町	10
*/

function draw(){
	clear();
	background(0, 0, 100);
	noStroke();
  	translate(1500, 1500); //東京駅の位置
/* 東京	0 */
	j=0;
	mainStation();

/* 品川	1 */
	j=1;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();
	translate(-mainStationX[j], -mainStationY[j]);

/* 渋谷	2 */
	j=2;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();

    noStroke();
  	fill(0);

  	for(var i=0; i< shibuRowCount;i++){
    	var diameter = sqrt(map(passengers[i], 0, 1000000, 0, 33333));
    	var x = (cos(radians(radian[i]-90)) * time[i])*20;
    	var y = (sin(radians(radian[i]-90)) * time[i])*20;
    	var c = map(difference[i], 50, 400, 120, 360);
    	fill(c, 59, 99, 59);

    	ellipse(x, y, diameter, diameter);
        stroke(360, 0, 100, 20);
        if (i<34) { fill(30, 60, 100); } //中央線
        if (i<70) { fill(300, 60, 100); } //中央線
        else { fill(300, 0, 70); } //その他
        text(stationName[i], x, y);
        noStroke();
	}



	translate(-mainStationX[j], -mainStationY[j]);

/* 新宿	3 */
	j=3;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();

    noStroke();
  	fill(0);

  	for(i; i< shibuRowCount+shinRowCount;i++){
    	diameter = sqrt(map(passengers[i], 0, 1000000, 0, 33333));
    	x = (cos(radians(radian[i]-90)) * time[i])*20;
    	y = (sin(radians(radian[i]-90)) * time[i])*20;
    	if (i>50 && i <=120) {
    		fill(220, 60, 100, 20);
    		ellipse(x, y, diameter*1.15+10, diameter*1.15+10);
    	}
    	if (i>120 && i <=170) {
    		fill(300, 60, 100, 20);
    		ellipse(x, y, diameter*1.15+10, diameter*1.15+10);
    	}
    	if (i>170) {
    		fill(30, 60, 100, 20);
    		ellipse(x, y, diameter*1.15+10, diameter*1.15+10);
    	}

	}

  	for(i=shibuRowCount; i< shibuRowCount+shinRowCount;i++){
    	diameter = sqrt(map(passengers[i], 0, 1000000, 0, 33333));
    	x = (cos(radians(radian[i]-90)) * time[i])*20;
    	y = (sin(radians(radian[i]-90)) * time[i])*20;
    	c = map(difference[i], 50, 400, 120, 360);
    	fill(c, 60, 100, 70);
    	ellipse(x, y, diameter, diameter);
	}

  	for(i=shibuRowCount; i< shibuRowCount+shinRowCount;i++){
    	x = (cos(radians(radian[i]-90)) * time[i])*20;
    	y = (sin(radians(radian[i]-90)) * time[i])*20;
    	fSize = map(passengers[i], 0, 1000000, 8, 40);
    	fColor = map(passengers[i], 0, 100000, 70, 100);
    	fill(0, 0, 100, fColor);
    	textSize(fSize);
   		text(stationName[i], x, y+fSize/3);
	}

	translate(-mainStationX[j], -mainStationY[j]);

/* 高田馬場	4 */
	j=4;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();

    noStroke();
  	fill(0);

  	for(i; i< shibuRowCount+shinRowCount+babaRowCount;i++){
    	diameter = sqrt(map(passengers[i], 0, 1000000, 0, 33333));
    	x = (cos(radians(radian[i]-90)) * time[i])*20;
    	y = (sin(radians(radian[i]-90)) * time[i])*20;
    	c = map(difference[i], 50, 400, 120, 360);
    	fill(c, 59, 99, 59);
    	ellipse(x, y, diameter, diameter);
        stroke(360, 0, 100, 20);
        if (i<34) { fill(30, 60, 100); } //中央線
        if (i<70) { fill(300, 60, 100); } //中央線
        else { fill(300, 0, 70); } //その他
        text(stationName[i], x, y);
        noStroke();
	}
	translate(-mainStationX[j], -mainStationY[j]);

/* 池袋	5 */
	j=5;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();

    noStroke();
  	fill(0);

  	for(i; i< shibuRowCount+shinRowCount+babaRowCount+ikeRowCount;i++){
    	diameter = sqrt(map(passengers[i], 0, 1000000, 0, 33333));
    	x = (cos(radians(radian[i]-90)) * time[i])*20;
    	y = (sin(radians(radian[i]-90)) * time[i])*20;
    	c = map(difference[i], 50, 400, 120, 360);
    	fill(c, 59, 99, 59);
    	ellipse(x, y, diameter, diameter);
        textAlign(LEFT);
        stroke(360, 0, 100, 20);
        if (i<34) { fill(30, 60, 100); } //中央線
        if (i<70) { fill(300, 60, 100); } //中央線
        else { fill(300, 0, 70); } //その他
        text(stationName[i], x, y);
        textAlign(CENTER);
        noStroke();
	}
	translate(-mainStationX[j], -mainStationY[j]);


/* 日暮里	6 */
	j=6;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();
	translate(-mainStationX[j], -mainStationY[j]);

/* 北千住	7 */
	j=7;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();
	translate(-mainStationX[j], -mainStationY[j]);

/* 上野	8 */
	j=8;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();
	translate(-mainStationX[j], -mainStationY[j]);

/* 秋葉原	9 */
	j=9;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();
	translate(-mainStationX[j], -mainStationY[j]);

/* 錦糸町	10 */
	j=10;
	translate(mainStationX[j], mainStationY[j]);
	mainStation();
	translate(-mainStationX[j], -mainStationY[j]);



    if (frameCount > 0) {
        noLoop();
        save();
    }
    

}

function mainStation() {
	if (j == 3) {
    	fill(0, 100, 100, 30);
	} else {
		fill(0, 100, 100, 15);
	}
    diameter = sqrt(map(mainPassengers[j], 0, 1000000, 0, 33333));
    ellipse(0, 0, diameter, diameter);
    textAlign(CENTER);
    stroke(360, 0, 100);
    text(mainStationName[j], 0, 5);
    textSize(25);
    noStroke();
    textSize(10);
}