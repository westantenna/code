import processing.svg.*;
import processing.pdf.*;

String lines[];

ArrayList<Meme> memes;

void setup(){
//  size(1000, 1000);
  size(2000, 1000, PDF, "chuo_keio.pdf");
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 90, 100);
  noLoop();
  rectMode(CENTER);

  //1.データを配列に読み込む
  //CSVファイルを読み込んで、1行ごとに配列linesの要素として読み込む
  //テキストとして読み込む、配列を使う loadstringsというパラメータで、読み込みたいcsvファイルを選択する
  lines = loadStrings("date/shinjuku.csv");
  println("データの行数は " + lines.length); //何行読み込んだか
  println("==========================");
  println("1行目のデータは " + lines[0]);
  println("2行目のデータは " + lines[1]);
  println("==========================");
  
  
  //2.「可変型配列memes」にMemeのデータを格納する
  //memesを初期化する。
  memes = new ArrayList<Meme>();
  
  //1行目のデータ（見出し）はいらないので、i = 1から開始をする
  for (int i = 1 ; i < lines.length; i++) {
    
    //1行分のデータをセパレータ「,」で区切った配列にする。
    String[] data = split(lines[i], ',');
    
    //memeオブジェクトを作成
    Meme meme = new Meme();
    
//    meme.user_id = data[0];
    meme.radian = float(data[1]);
    meme.time = float(data[2]);
    meme.passengers = float(data[3]);
    meme.difference = float(data[4]);
    //create date と update date は、ここでは省略している
    
    //memeオブジェクトを可変型配列memesに追加
    memes.add(meme);
    
  }
  
  println("格納されたmemeオブジェクトの個数 " + memes.size());
  println("==========================");
  //1行目は見出しなので捨てた、行数-1=格納されたオブジェクト個数

}


//ここからの、データを出力するところをよく確認しよう！！ ここが超重要！！
void draw(){
  translate(950, 500);
  noStroke();
  fill(0, 100, 100, 5);
  ellipse(0, 0, 815, 815);
  fill(0, 100, 100, 80);
  ellipse(0, 0, 5, 5);
  
  //3. データの出力
  println("date");
  for(int i = 0; i<memes.size(); i++){
    //memes配列からひとつのmemeを取り出す、iに対応するデータが取得できる
    Meme meme = memes.get(i);
    println(meme.radian + " , " + meme.time + " , " + meme.passengers + " , " + meme.difference);
  }
  println("==========================");
    
  //取得してきた値を、引き伸ばして扱う
  //5.点をplotしてみる。
  
  for(int i = 0; i<memes.size(); i++){
    if (i <= 34) { fill(40, 59, 99, 60);}
    if (i > 34) { fill(310, 59, 99, 60);}
    Meme meme = memes.get(i);
    //もともとのデータは9～100のデータである
    //zone_focusの値を0〜400の範囲に引き延ばす
    //https://processing.org/reference/map_.html
    float diameter = map(meme.passengers, 0, 1000000, 0, 300);
    float x = cos(radians(meme.radian-90)) * meme.time;
    float y = sin(radians(meme.radian-90)) * meme.time;
    x = x * 20;
    y = y * 20;
    //大きいのから、ちいさいのを引くことで、ひっくり返す
    ellipse(x, y, diameter, diameter);
  }

  exit();
}

//csvが持っているデータを格納する関数を作っておく
//文字列はString、数列はfloatにした（きっと、計算の過程で小数点も出てくるだろうので）
class Meme {  
  float radian;
  float time;
  float passengers;
  float difference;
  String create_date;
  String update_date;
  Meme(){}
}