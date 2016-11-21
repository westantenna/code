JSONArray values;
int a;



void setup() {
    size(640,480);
    background(255);
    
  values = loadJSONArray("https://api.tokyometroapp.jp/api/v2/datapoints?rdf:type=odpt:Train&acl:consumerKey=90fd55a1b0a284b0d2b4bb3bf45fe5505b37465c3ec79e129d4d2b22ac9d0e4c");
//  values = loadJSONArray("data.json");

  for (int i = 0; i < values.size(); i++) {
    
    JSONObject metro = values.getJSONObject(i); 

    String railway = metro.getString("odpt:railway");
    String trainNumber = metro.getString("odpt:trainNumber");
    String trainType = metro.getString("odpt:trainType");
    int delay = metro.getInt("odpt:delay");
    String terminalStation = metro.getString("odpt:terminalStation");
    String railDirection = metro.getString("odpt:railDirection");
    String trainOwner = metro.getString("odpt:trainOwner");
    
    println(railway +","+ trainNumber +","+ trainType +","+ delay +","+ terminalStation +","+ railDirection +","+ trainOwner);
    println(values);
  }
}

void draw() {
  fill(#ffffff,20);
  rect(0, 0, width, height);
  fill(#ffff99, 40);
//  noStroke();
  beginShape();
  vertex(0, 0);
  vertex(0, height/2);
  vertex(0+random(-20,20), height/2+random(-20,20));
  vertex(width*0.25+random(-20,20), height/2+random(-20,20));
  vertex(width*0.5+random(-20,20), height/2+random(-20,20));
  vertex(width*0.75+random(-20,20), height/2+random(-20,20));
  vertex(width+random(-20,20), height/2+random(-20,20));
  vertex(width, height/2);
  vertex(width, 0);
  vertex(0, 0);
  endShape();
}