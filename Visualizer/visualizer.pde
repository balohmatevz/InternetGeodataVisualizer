// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="bot1.svg"; */ 

PShape europe;
int W = 640;
int H = 480;
int oX = 0;
int oY = 0;

int countryColumn = 1;
int column = 2;

String lines[];

int minR = 0;
int minG = 0;
int minB = 0;
int minA = 255;

int maxR = 255;
int maxG = 0;
int maxB = 0;
int maxA = 255;
float minVal = -50;
float maxVal = 10;







FloatDict data;
StringDict countries;

String toAlpha(String str){
  if(str == null){
    return null;
  }
  String r = "";
  for (char c : str.toCharArray()) {
    if (Character.isLetter(c)){
      r += c;  
    }
  }
  return r;
}

String toNum(String str){
  if(str == null){
    return null;
  }
  String r = "";
  for (char c : str.toCharArray()) {
    if (Character.isDigit(c) || c == '.'){
      r += c;  
    }
  }
  return r;
}

void setup() {
  data = new FloatDict();
  countries = new StringDict();
  background(80, 80, 255, 255);
  size(W, H);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  europe = loadShape("europe.svg");
  
  lines = loadStrings("countries.csv");
  for (int i = 0; i < lines.length; i++) {
    String line = lines[i].trim();
    String[] pts = line.split("\",\"");
    if(pts.length >= 5){
      String name = toAlpha(pts[4].toLowerCase().replaceAll("\"","").trim());
      String code = toAlpha(pts[0].toLowerCase().replaceAll("\"","").trim());
      countries.set(name, code);
      //println(code);
    }
  }
  
  lines = loadStrings("data.txt");
  for (int i = 0; i < lines.length; i++) {
    String line = lines[i].trim();
    if(line.startsWith("#") == true){
      //Comment
      continue;
    }
    if(line.startsWith("%") == true){
      line = line.replaceAll("%", "").trim();
      //Setup variable
      String[] pts = line.split("=");
      if(pts.length == 2){
        String var = pts[0].trim().toUpperCase();
        String val = pts[1].trim();
        if(var.equals("MAXR")){
          maxR = parseInt(val);
        }else if(var.equals("MAXG")){
          maxG = parseInt(val);
        }else if(var.equals("MAXB")){
          maxB = parseInt(val);
        }else if(var.equals("MAXA")){
          maxA = parseInt(val);
        }else if(var.equals("MINR")){
          minR = parseInt(val);
        }else if(var.equals("MING")){
          minG = parseInt(val);
        }else if(var.equals("MINB")){
          minB = parseInt(val);
        }else if(var.equals("MINA")){
          minA = parseInt(val);
        }else if(var.equals("MINVAL")){
          minVal = parseFloat(val);
        }else if(var.equals("MAXVAL")){
          maxVal = parseFloat(val);
        }else if(var.equals("COUNTRYCOL")){
          countryColumn = parseInt(val);
        }else if(var.equals("DATACOL")){
          column = parseInt(val);
        }else{
          println("Unknown variable: '"+var+"' with value '"+val+"'");
        }
      }else{
        println("Variable not set properly. Line = '"+line+"'");
      }
      continue;
    }
    String[] pts = line.split("\t");
    if(pts.length >= column){
      String countryName = toAlpha(pts[countryColumn].toLowerCase().replaceAll("\"","").trim());
      String countryCode = toAlpha(countries.get(countryName));
      float value = parseFloat(toNum(pts[column]));
      if(value != Float.NaN){
        if(countryCode != null){
          data.set(countryCode, value);
        }
      }
      //println(countryCode+" : "+countryName+" = "+value+" (from "+pts[column]+")");
    }
  }
} 

void draw(){
  background(80, 80, 160, 255);
  
  //Draw Europe
  shape(europe, oX, oY, W, H);
  
  for(String k : data.keys()){
    PShape country = europe.getChild(k);
    float value = max(0, min(1, (data.get(k) - minVal) / (maxVal - minVal)));
  
    // Disable the colors found in the SVG file
    if(country != null){
      country.disableStyle();
      int R = max(0, min(255, round(minR + value * (maxR-minR))));
      int G = max(0, min(255, round(minG + value * (maxG-minG))));
      int B = max(0, min(255, round(minB + value * (maxB-minB))));
      int A = max(0, min(255, round(minA + value * (maxA-minA))));
      
      fill(R, G, B, A);
      noStroke();
      shape(country, oX, oY, W, H);
    }
  }
  
}
