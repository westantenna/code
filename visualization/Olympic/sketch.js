var touch = 0; //タッチしているか否か
var bgC = 255;//背景色

var WIDTH = 5; //タッチしたところに出てくる四角の幅
var HEIGHT = 5; //タッチしたところに出てくる四角の高さ
var msA = 0; //始　時間
var xA = 0; //始　X
var yA = 0; //始　Y
var msB = 0; //終　時間
var xB = 0; //終 X
var yB = 0; //終 Y
var msX = 0; //タッチしていた時間
var yX = 0; //移動したXの距離
var xX = 0; //移動したYの距離
var ro = 0; //回転した角度
var radius = 100; //動かしたマウスの距離（仮に0を入れている）
var pen = 0;
var pmode = 0;

var img;
var img1;
var img2;
var img3;

//点・文字など表示するか否か
//０だと表示しない
var moji = 0;
//長方形の形

//初期設定
//展示Macの画面サイズは、1680*1050
function setup() {
    createCanvas(1680, 1050);
    background(bgC);
    noStroke(); //面に線なし
    img = loadImage("button.png");
    img1 = loadImage("button_p1.png");
    img2 = loadImage("button_p2.png");
    img3 = loadImage("button_p3.png");
}

function draw() {
//    image(img, 1630, 0, 50, 150);
//起動時には、一回クリックをする
}

function touchStarted() {
    //ボタン
    image(img, 1630, 0, 50, 150);
    //タッチ始めの処理
    msA = millis();
    xA= touchX;
    yA = touchY;
    fill(196);
    //数値書き換え部分
    fill(255, 0, 0); //Red
    if (moji == 1) {
        rect(touchX - WIDTH / 2, touchY - HEIGHT / 2, HEIGHT, WIDTH);
    }
    touch = 1;

    //ボタン押されてが反応する
    if (1630 < xA && 0 < yA && 50 > yA) {
        image(img1, 1630, 0, 50, 50);
        pmode = 0;
    }
    if (1630 < xA && 50 < yA && 100 > yA) {
        image(img2, 1630, 50, 50, 50);
        pmode = 1;
    }
    if (1630 < xA && 100 < yA && 150 > yA) {
        image(img3, 1630, 100, 50, 50);
        pmode = 2;
    }

    //開発部分 左上の文字
    if (moji == 1) {
        fill(bgC);
        rect(0, 0, 200, 30);
        rect(0, 50, 200, 10);
    }



}

function touchMoved() {
    //押されたまま動いているとき
    if (moji == 1) {
        fill(bgC);
        rect(0, 30, 200, 60);
        fill(128);
        rect(touchX, touchY, 2, 2);
        fill(0);
        text(touchX, 10, 40);
        text(touchY, 10, 50);
        text(radius, 10, 70);
        text(pen, 10, 80);
        text(pmode, 10, 80);
    }

    msB = millis();
    xB= touchX;
    yB = touchY;

    //時間、位置の差を代入
    msX = msB - msA;
    xX = xB - xA;
    yX = yB - yA;




    //四角が書かれる条件、要調整
    if (msX > 100) {
        drawRect();
    }
}

//タッチ終わりの処理
function touchEnded() {
    //四角が書かれる
    drawRect();

    //ボタン
    image(img, 1630, 0, 50, 150);

    //開発部分 左上の文字
    if (moji == 1) {
        fill(0);
        text(msX, 10, 10);
        text(xX, 10, 20);
        text(yX, 10, 30);
        text(degrees(ro), 10, 60);
    }



    if (pmode == 2) {
        background(bgC);
        image(img, 1630, 0, 50, 150);
        pmode = 0;
    }
}


function drawRect() {
    //正方形の中央、正方形の中央、規定値幅、規定値高
    //クリックを始めた位置に現れる四角
    if (moji == 1) {
        fill(0, 0, 255);  //Blue
        rect(touchX - WIDTH / 2, touchY - HEIGHT / 2, WIDTH, HEIGHT);
    }
    //長方形の色 時間で色が変わる、RGBではなく一時的にHSBで
    if (pmode == 0) {
        colorMode(HSB);
        fill(sqrt(sq(xA - xB) + sq(yA - yB))*0.5 + 2, 60, 100, msX * 0.007 + random(-0.1, 0.1));
    }
    if (pmode == 1) {
        fill(255, 255, 255, 191);
    }
    //色をRGBによる制御に戻しておく
    colorMode(RGB, 255);
    //移動させる
    translate(xA, yA);
    var radius = sqrt(sq(xA - xB) + sq(yA - yB));

    //ここから回転
    ro = Math.atan2(xB - xA, yA - yB) + PI;
    rotate(ro);


    if (pen == 0) {
        drawRectOlympic0(radius);
        pen++;
    } else if (pen == 1) {
        drawRectOlympic1(radius);
        pen++;
    } else if (pen == 2) {
        drawRectOlympic2(radius);
        pen++;
    } else if (pen == 3) {
        drawRectOlympic3(radius);
        pen++;
    } else if (pen == 4) {
        drawRectOlympic4(radius);
        pen++;
    } else if (pen == 5) {
        drawRectOlympic5(radius);
        pen++;
    } else if (pen == 6) {
        drawRectOlympic6(radius);
        pen = 0;
    }
    rotate(-ro);
    translate(-xA, -yA);
    msA = millis();
    xA= touchX;
    yA = touchY;
}


/*
//この式ではradiusが、円の直径としている
//radius * cos15°　= rectA の短辺の長さ
//radius * sin15°　= rectA の長辺の長さ
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));
*/


function drawRectOlympic0(rad){
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));
    beginShape();
    vertex(0,0);
    vertex(rectA.x,0);
    vertex(rectA.x,rectA.y);
    vertex(0,rectA.y);
    endShape(CLOSE);

    translate(rectA.x, 0);
    rotate(radians(-30.0));
        beginShape();
        vertex(0,0);
        vertex(rectA.x,0);
        vertex(rectA.x,rectA.y);
        vertex(0,rectA.y);
        endShape(CLOSE);

        translate(rectA.x, 0);
        rotate(radians(-30.0));
            beginShape();
            vertex(0,0);
            vertex(rectA.x,0);
            vertex(rectA.x,rectA.y);
            vertex(0,rectA.y);
            endShape(CLOSE);

        rotate(radians(30.0));
        translate(-rectA.x, 0);
    rotate(radians(30.0));
    translate(-rectA.x, 0);
}


function drawRectOlympic1(rad){
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));
    translate(rectA.x, 0);
        beginShape();
        vertex(0,0);
        vertex(rectB.x,0);
        vertex(rectB.x,rectB.y);
        vertex(0,rectB.y);
        endShape(CLOSE);

        translate(rectA.x+rectB.x, 0);
        rotate(radians(-30.0));
            beginShape();
            vertex(0,0);
            vertex(rectB.x,0);
            vertex(rectB.x,rectB.y);
            vertex(0,rectB.y);
            endShape(CLOSE);

        rotate(radians(30.0));
        translate(-rectA.x-rectB.x, 0);
    translate(-rectA.x, 0);
}
function drawRectOlympic2(rad){
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));
    beginShape();
    vertex(0,0);
    vertex(rectA.x,0);
    vertex(rectA.x,rectA.y);
    vertex(0,rectA.y);
    endShape(CLOSE);

    translate(rectC.x, (rectA.y-rectC.y)/2);
        beginShape();
        vertex(0,0);
        vertex(rectC.x,0);
        vertex(rectC.x,rectC.y);
        vertex(0,rectC.y);
        endShape(CLOSE);

    translate(-rectC.x, -(rectA.y-rectC.y)/2);
}
function drawRectOlympic3(rad){
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));
        translate(rectA.x, 0);
            beginShape();
            vertex(0,0);
            vertex(rectB.x,0);
            vertex(rectB.x,rectB.y);
            vertex(0,rectB.y);
            endShape(CLOSE);

            translate(rectB.x+rectC.x, 0);
            rotate(radians(30.0));
                beginShape();
                vertex(0,0);
                vertex(rectB.x,0);
                vertex(rectB.x,rectB.y);
                vertex(0,rectB.y);
                endShape(CLOSE);

            rotate(radians(-30.0));
            translate(-rectB.x-rectC.x, 0);
        translate(-rectA.x, 0);
}
function drawRectOlympic4(rad){
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));
    beginShape();
    vertex(0,0);
    vertex(rectA.x,0);
    vertex(rectA.x,rectA.y);
    vertex(0,rectA.y);
    endShape(CLOSE);

    translate(rectA.x+rectB.x, (rectA.y-rectC.y)/2);
    rotate(radians(30.0));
        beginShape();
        vertex(0,0);
        vertex(rectA.x,0);
        vertex(rectA.x,rectA.y);
        vertex(0,rectA.y);
        endShape(CLOSE);

        translate(rectC.x, (rectA.y-rectC.y)/2);
            beginShape();
            vertex(0,0);
            vertex(rectC.x,0);
            vertex(rectC.x,rectC.y);
            vertex(0,rectC.y);
            endShape(CLOSE);

        translate(-rectC.x, -(rectA.y-rectC.y)/2);
    rotate(radians(-30.0));
    translate(-rectA.x-rectB.x, -(rectA.y-rectC.y)/2);
}
function drawRectOlympic5(rad){
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));

    translate(rectA.x+rectA.x*cos(30),-rectA.x*sin(30));
    rotate(radians(30.0));
        beginShape();
        vertex(0,0);
        vertex(rectB.x,0);
        vertex(rectB.x,rectB.y);
        vertex(0,rectB.y);
        endShape(CLOSE);

        translate(rectB.x, 0);
        rotate(radians(-75.0));
            beginShape();
            vertex(0,0);
            vertex(rectC.x,0);
            vertex(rectC.x,rectC.y);
            vertex(0,rectC.y);
            endShape(CLOSE);

        rotate(radians(75.0));
        translate(-rectB.x, 0);
    rotate(radians(-30.0));
    translate(-rectA.x-rectA.x*cos(30),rectA.x*sin(30));
}
function drawRectOlympic6(rad){
var rectA = new p5.Vector(rad*Math.sin(15*Math.PI/180), rad*Math.cos(15*Math.PI/180));
var rectB = new p5.Vector(rad*Math.sin(30*Math.PI/180), rad*Math.cos(30*Math.PI/180));
var rectC = new p5.Vector(rad*Math.sin(45*Math.PI/180), rad*Math.cos(45*Math.PI/180));
translate(-rectB.x*cos(60),-rectB.x*sin(60));
rotate(radians(30.0));
    beginShape();
    vertex(0,0);
    vertex(rectC.x,0);
    vertex(rectC.x,rectC.y);
    vertex(0,rectC.y);
    endShape(CLOSE);

    translate(rectC.x, 0);
    rotate(radians(-75.0));
        beginShape();
        vertex(0,0);
        vertex(rectB.x,0);
        vertex(rectB.x,rectB.y);
        vertex(0,rectB.y);
        endShape(CLOSE);

    rotate(radians(75.0));
    translate(-rectC.x, 0);
rotate(radians(-30.0));
translate(rectB.x*cos(60),rectB.x*sin(60));
}
