var touch = 0; //タッチしているか否か
var bgC = 255;

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

//点・文字など表示するか否か
//０だと表示しない
var moji = 1;
//長方形の形

//この式ではradiusが、円の直径としている
//radius * cos15°　= rectA の短辺の長さ
var rectA = new p5.Vector(radius*Math.cos(15*Math.PI/180), radius*Math.sin(15*Math.PI/180));
var rectB = new p5.Vector(radius*Math.cos(30*Math.PI/180), radius*Math.sin(30*Math.PI/180));
var rectC = new p5.Vector(radius*Math.cos(45*Math.PI/180), radius*Math.sin(45*Math.PI/180));



//初期設定
function setup() {
    createCanvas(1024, 768);
    background(bgC);
    noStroke(); //面に線なし
}

//何もないよ！！
function draw() {

}

function touchStarted() {
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
        rect(0, 30, 200, 20);
        fill(0);
        text(touchX, 10, 40);
        text(touchY, 10, 50);
    }
}

//タッチ終わりの処理
function touchEnded() {
    if (touch == 1) {
        //時間、位置を取得
        msB = millis();
        xB= touchX;
        yB = touchY;

        //時間、位置の差を代入
        msX = msB - msA;
        xX = xB - xA;
        yX = yB - yA;


        fill(0, 0, 255);  //Blue
        //正方形の中央、正方形の中央、規定値幅、規定値高
        if (moji == 1) {
  		        rect(touchX - WIDTH / 2, touchY - HEIGHT / 2, WIDTH, HEIGHT);
        }

        //長方形の色 時間で色が変わる
        colorMode(HSB);
        fill((msX*0.5) - 30, 50, 100, sqrt(sq(xA - xB) + sq(yA - yB))*0.001 + 0.2);

        //色をRGBによる制御に戻しておく
        colorMode(RGB, 255);

        //移動させる
        translate(xA, yA);

        //ここから回転
        ro = Math.atan2(xB - xA, yA - yB);
        rotate(ro)

/*
            for(var i =1; i<=12; i++){
              drawRectIn(rectB);
              rotate(30.0*PI/180);
            }
*/

            rect(0, 0, sqrt(sq(xA - xB) + sq(yA - yB)) , -sqrt(sq(xA - xB) + sq(yA - yB)));


        rotate(Math.atan2(xA - xB, yA - yB));

        translate(-xA, -yA);

        value = 0;


        //開発部分 左上の文字
        if (moji == 1) {
            fill(0);
            text(msX, 10, 10);
            text(xX, 10, 20);
            text(yX, 10, 30);
            text(degrees(ro), 10, 60);
        }

        //同じところでクリックすると、リセットされる
        if (xX == 0 && yX == 0) {
            background(bgC);
        } else {

        }

    } else {

    }


}

function drawRectIn(vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,vec.y);
  vertex(0,vec.y);
  endShape(CLOSE);
}

function drawRectOut(vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,-vec.y);
  vertex(0,-vec.y);
  endShape(CLOSE);
}

function swap(vec){
  var swappedVec = new p5.Vector(vec.y,vec.x);
  return swappedVec;
}
