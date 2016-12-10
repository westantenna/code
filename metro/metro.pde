JSONArray values;
int numOpe, numG, numM, numC, numH, numN, numY, numF, numZ;
int delayAll, delayG, delayM, delayC, delayH, delayN, delayY, delayF, delayZ;
int timer = 9999;

void setup() {
    size(1600,900);
    background(255);
    colorMode(HSB, 360, 100, 100);
    frameRate(24);
    getAPI();
}

void draw() {
  fill(205, 10, 95);
//  fill(#ffffff,20);
  rect(0, 0, width, height);
  
  stroke(205, 50, 90);
  for (int i = 0; i<width; i++) {
    line (i, height, i, height - 400 + sin(float(i + timer)/15) * (delayAll/1000 + 5));
  }
  timer++;
  println(timer);
  
  
// getAPI / 91.6s  
  if (timer > 2200) {
    timer = 0;
    getAPI();
  }
}

void getAPI() {
  values = loadJSONArray("https://api.tokyometroapp.jp/api/v2/datapoints?rdf:type=odpt:Train&acl:consumerKey=90fd55a1b0a284b0d2b4bb3bf45fe5505b37465c3ec79e129d4d2b22ac9d0e4c");
  for (int i = 0; i < values.size(); i++) {
    JSONObject metro = values.getJSONObject(i); 


    String railway = metro.getString("odpt:railway");
    String trainNumber = metro.getString("odpt:trainNumber");
    String trainType = metro.getString("odpt:trainType");
    int delay = metro.getInt("odpt:delay");
    String fromStation = metro.getString("odpt:fromStation");
    String terminalStation = metro.getString("odpt:terminalStation");
    String railDirection = metro.getString("odpt:railDirection");
    String trainOwner = metro.getString("odpt:trainOwner");
    println(railway +","+ trainNumber +","+ trainType +","+ delay +","+ fromStation +","+ terminalStation +","+ railDirection +","+ trainOwner);
    if (railway.equals("odpt.Railway:TokyoMetro.Ginza")) {
      numG++;
      delayG = delayG + delay;
    }else if (railway.equals("odpt.Railway:TokyoMetro.Marunouchi")) {
      numM++;
      delayM = delayM + delay;
    }else if (railway.equals("odpt.Railway:TokyoMetro.Chiyoda")) {
      numC++;
      delayC = delayC + delay;
    }else if (railway.equals("odpt.Railway:TokyoMetro.Hibiya")) {
      numH++;
      delayH = delayH + delay;
    }else if (railway.equals("odpt.Railway:TokyoMetro.Namboku")) {
      numN++;
      delayN = delayN + delay;
    }else if (railway.equals("odpt.Railway:TokyoMetro.Yurakucho")) {
      numY++;
      delayY = delayY + delay;
    }else if (railway.equals("odpt.Railway:TokyoMetro.Fukutoshin")) {
      numF++;
      delayF = delayF + delay;
    }else if (railway.equals("odpt.Railway:TokyoMetro.Hanzomon")) {
      numZ++;
      delayZ = delayZ + delay;
    }
  }
 numOpe = values.size();
// println(values);
 println("numOpe="+ numOpe +",G="+ numG +",M="+ numM +",C="+ numC +",H="+ numH +",N="+ numN +",Y="+ numY +",F="+ numF +",Z="+ numZ);
 println("delayAll="+ delayAll +",G="+ delayG +",M="+ delayM +",C="+ delayC +",H="+ delayH +",N="+ delayN +",Y="+ delayY +",F="+ delayF +",Z="+ delayZ);
/* if (TokyoMetro.Ginza) {
   
 }*/
}