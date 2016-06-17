String lines[];

ArrayList<Meme> memes;

void setup(){
  size(1000,600);
  noLoop();
  
  //1.データを配列に読み込む
  //CSVファイルを読み込んで、1行ごとに配列linesの要素として読み込む
  //テキストとして読み込む、配列を使う loadstringsというパラメータで、読み込みたいcsvファイルを選択する
  lines = loadStrings("meme_sample.csv");
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
    
    meme.user_id = data[0];
    meme.zone_date = data[1];
    meme.zone_focus = float(data[2]);
    meme.zone_calm = float(data[3]);
    meme.zone_posture = float(data[4]);
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
  background(0);
  
  //3. データの出力
  println("focus");
  for(int i = 0; i<memes.size(); i++){
    //memes配列からひとつのmemeを取り出す、iに対応するデータが取得できる
    Meme meme = memes.get(i);
    println(meme.user_id + " , " + meme.zone_date + " , " + meme.zone_focus + " , " + meme.zone_calm + " , " + meme.zone_posture);
  }
  println("==========================");
  
  //4. 最大値と最小値を調べる
  //配列に、値を入れる操作。zone_focusだけ持ってきた値
  float[] values0 = new float[memes.size()];
  float[] values1 = new float[memes.size()];
  float[] values2 = new float[memes.size()];

  for(int i = 0; i<memes.size(); i++){
    Meme meme = memes.get(i);
    values0[i] = meme.zone_focus;
    values1[i] = meme.zone_calm;
    values2[i] = meme.zone_posture;
  }
  float max_value0, min_value0, max_value1, min_value1, max_value2, min_value2;

  max_value0 = max(values0);
  min_value0 = min(values0);
  max_value1 = max(values1);
  min_value1 = min(values1);
  max_value2 = max(values2);
  min_value2 = min(values2);
  
  println("zone_focusの最大値は "+ max_value0);
  println("zone_focusの最小値は "+ min_value0);
  println("zone_calmの最大値は "+ max_value1);
  println("zone_calmの最小値は "+ min_value1);
  println("zone_postureの最大値は "+ max_value2);
  println("zone_postureの最小値は "+ min_value2);
  println("==========================");
  
  
  //取得してきた値を、引き伸ばして扱う
  //5.点をplotしてみる。
  strokeWeight(6);
  stroke(255,255,255);
  float Xaxis_y = height-50; //y軸（横線）の原点
  float Xaxis_x = 50; //x軸の原点
  float step = 7; //x座標を何倍にするか
  for(int i = 0; i<memes.size(); i++){
    Meme meme = memes.get(i);
    //点のx座標の計算
    float point_x = Xaxis_x + step * i;
    //点のy座標の計算
    //もともとのデータは9～100のデータである
    //zone_focusの値を0〜400の範囲に引き延ばす
    //https://processing.org/reference/map_.html
    float point_y = map(meme.zone_focus, min_value0, max_value0, 0, 400);
    //大きいのから、ちいさいのを引くことで、ひっくり返す
    point_y = Xaxis_y - point_y;
    point(point_x, point_y);
  }
  
  stroke(128,255,255);
  for(int i = 0; i<memes.size(); i++){
    Meme meme = memes.get(i);
    //点のx座標の計算
    float point_x = Xaxis_x + step * i;
    //点のy座標の計算
    //もともとのデータは9～100のデータである
    //zone_focusの値を0〜400の範囲に引き延ばす
    //https://processing.org/reference/map_.html
    float point_y = map(meme.zone_calm, min_value1, max_value1, 0, 400);
    //大きいのから、ちいさいのを引くことで、ひっくり返す
    point_y = Xaxis_y - point_y;
    point(point_x, point_y);
  }
  strokeWeight(1);
  stroke(255,255,255);
  line(Xaxis_x,Xaxis_y ,width-50, Xaxis_y);
  line(50,50,Xaxis_x,Xaxis_y);
  
  
}

//csvが持っているデータを格納する関数を作っておく
//文字列はString、数列はfloatにした（きっと、計算の過程で小数点も出てくるだろうので）
class Meme {
  String user_id;
  String zone_date;
  float zone_focus;
  float zone_calm;
  float zone_posture;
  String create_date;
  String update_date;
  Meme(){}
}