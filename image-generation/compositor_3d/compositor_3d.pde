import java.io.PrintWriter;

final boolean CONTROL_POSITION = false;
final boolean DEBUG = false;
boolean ONE_SHOT = false;

final boolean MULTI_SHOT = true;

// how many images to generate per-run
final int IMAGE_GENERATION_COUNT = 10;

final boolean RERENDER_FIRST_FRAME = true; // rerender the first frame to avoid blobby text

final boolean SKIP_DONUT = false;
final boolean SKIP_CLOTH = false;
final boolean SKIP_PLANETS = false;
final boolean SKIP_TEXT = false;
final boolean SKIP_WORDS =  false;
final boolean SKIP_SPLASH = false;
final boolean SKIP_WEATHER = false;
final boolean SKIP_LOGO = false;
final boolean SKIP_PATHS = false;
final boolean SKIP_TIME = false;
final boolean SKIP_COUNTER = false;

final color BACKGROUND = color(255, 255, 255);

float bleed = 3; // mm
float pageWidth = 165; // mm
float spineWidth = 13; // mm
float coverWidth  = (pageWidth * 2) + spineWidth + (bleed * 2); // mm
float coverHeight = 235 + (bleed * 2); // mm
float dpmm = 11.811;

int coverFinalWidth  = round(coverWidth * dpmm);
int coverFinalHeight = round(coverHeight * dpmm);

DataLoader dload;
FloatList sound1Scores;
FloatList sound2Scores;
FloatList weatherScores;
FloatList motionScores;

IntList moodValues;

// ring
SparkleDonut toroid;
PShape donut;

// planet
Planet planet;
PShape orb;

// background
ClothShape cloth;
ClothTexture tex;
PShape fabric;

//splash-- using motion scores
SplashMotion explosion;
PShape splash;

//weather
WeatherGraph weather;
PShape [] weatherObjects;

PShape MICA_logo;

// utility text
TextParagraph textPara;

//timestamp class
TimeStamp timestamp;

TextCounter counter;

// 4 words
MoodWords wordart;

long now;
int index;
int starting_index;

//triangular paths
Point origin, p1, p2, squareOrigin, ps1, ps2, ps3;
PolygonPath triangle, square, zigzag;

String[] weatherData;
String[] sound1Data;
String[] sound2Data;
String[] moodData;
String[] motionData;

int MAX_COUNTER = 68000;

PShape arrow;

PImage typeset;

float DonutMultiplier = 13023;
float SplashMultiplier = 1732;
float PlanetMultiplier = 1550;
float TextBoxMultiplier = 853;
float MoodWordMultiplier = 108;

//zigzag points
Point [] zig_points = new Point [11];

void settings() {
  size(coverFinalWidth, coverFinalHeight, P3D); //renders
  smooth(8);
}

PGraphics canvas;

void setup() {
  getOneShotFromArgs();

  // loading data
  dload = new DataLoader(this);
  starting_index = getIndexFromArgs();
  index = starting_index;
  resetDataAndObjects();
  generatePaths(); // create paths but don't draw them
}

void resetDataAndObjects() {
  now = getTimestampFromIndex(index);
  println("PREPARING IMAGE", index, "AT", now);

  // debugDataLoader(dload);

  sound1Scores  = dload.getSound1Scores(now);
  sound2Scores  = dload.getSound2Scores(now);
  moodValues    = dload.getMoodValues(now);
  motionScores  = dload.getMotionScores(now);
  weatherScores = dload.getWeatherScores(now);

  float sound1avg = average(sound1Scores)*10000;
  float sound2avg = average(sound2Scores)*10000;
  float motionavg = average(motionScores);

  //println("sound1avg:" + sound1avg);
  //println("sound2avg:" + sound2avg);
  //println("motionMax:" + motionMax);
  //println("motionAvg:" + motionavg); //gives more dynamic change to cloth width

  background(255, 255, 0);

  canvas = createGraphics(coverFinalWidth, coverFinalHeight, P3D);
  canvas.beginDraw();
  canvas.smooth(8);
  canvas.hint(ENABLE_STROKE_PURE);
  canvas.background(0, 0);

  if (!SKIP_CLOTH) {
    // w h amp detail
    // more amp -> bigger hills
    // more detail -> tighter hills
    int clothWidth = int(map(motionavg, 0, 30, width*0.55, height*5)); //map avg motion val to cloth thickness
    cloth = new ClothShape(floor(width * 0.5), floor(height * 3), clothWidth, 200);
    fabric = cloth.create(moodValues, this);
  }

  if (!SKIP_DONUT) {
    float size = map(sound1avg, 200, 10000, width*0.1, width*0.672); //map avg sound1 val to torus radius
    toroid = new SparkleDonut(size); //size
    donut = toroid.create(sound1Scores, this);
  }

  if (!SKIP_PLANETS) {
    float spacing = map(sound2avg, 200, 1000, 5, 60);
    planet = new Planet(height * 0.03, spacing, now, this);
  }

  if (!SKIP_WORDS) {
    wordart = new MoodWords(width * 0.6, height * 0.1, moodValues);
  }

  if (!SKIP_WEATHER) {
    WeatherGraph weather = new WeatherGraph();
    weatherObjects = weather.create(weatherScores, 2, this);
  }

  if (!SKIP_SPLASH) {
    explosion = new SplashMotion(500);
    int splashWidth = int(map(motionavg, 0, 30, width*0.1, width*0.4)); //map avg motion val to splash radius
    int spokes = int(map(motionavg, 0, 30, 30, 70));
    splash = explosion.create(spokes, 20, splashWidth, this); //change to higher number for funky glitches
  }

  if (!SKIP_TEXT) {
    // textPara = new TextParagraph(width*0.43, height*0.5);
    typeset = loadImage("typeset4.png");
  }

  if (!SKIP_LOGO) {
    MICA_logo = loadShape("mica_logo_new.svg");

    // we want the height of the logo shape to be 11mm
    int target_height = floor(11 * dpmm);
    // the logo appears 81px wide in the current sketch without scaling
    float scale_factor = target_height / 81.0;

    MICA_logo.disableStyle();
    MICA_logo.setFill(255);
    MICA_logo.scale(scale_factor);
  }

  if (!SKIP_TIME) {
    timestamp = new TimeStamp(int(width*0.18), int(height*0.016));
  }

  if (!SKIP_COUNTER) {
    counter = new TextCounter(int(width*0.16), int(height*0.0166));
  }
}

void generatePaths() {
  arrow = createShape();
  arrow.scale(3);
  arrow.beginShape();
  arrow.noStroke();
  arrow.vertex(0, 0);
  arrow.vertex(7, 7);
  arrow.vertex(0, 14);
  arrow.endShape();
  arrow.disableStyle();

  // ZIGZAG
  for (int lp = 0; lp <9; lp+=2) {
    float spacing = height*0.1;
    float offset = height*0.1;
    zig_points[lp] = new Point(width*0.1, offset +lp*spacing);
  }
  for (int rp = 1; rp <9; rp+=2) {
    float spacing = height*0.1;
    float offset = height*0.1;
    zig_points[rp] = new Point(width*0.8, offset + rp*spacing);
  }

  zig_points[9] = new Point(width*0.9, height*0.9);
  zig_points[10] = new Point(width*0.9, height*0.1);
  zigzag = new PolygonPath(zig_points, MAX_COUNTER);

  //TRIANGLE STUFF
  origin = new Point(width*0.12, height*0.97); //bottom left pt
  p1 = new Point(width*0.5, height*0.03);//top middle pt
  p2 = new Point(width*0.88, height*0.97);//bottom right pt
  triangle = new PolygonPath(new Point[]{ origin, p1, p2 }, MAX_COUNTER);
  //TRIANGLE STUFF

  //SQUARE STUFF
  squareOrigin = new Point(width*0.12, height*0.03); //top left pt
  ps1 = new Point(width*0.88, height*0.03);//top right pt
  ps2 = new Point(width*0.88, height*0.97);//bottom right pt
  ps3 = new Point(width*0.12, height*0.97);//bottom left pt
  square = new PolygonPath(new Point[]{ squareOrigin, ps1, ps2, ps3 }, MAX_COUNTER);
  // SQUARE STUFF
}

void draw() {
  canvas.background(BACKGROUND);
  canvas.directionalLight(200, 200, 200, 0, 0, -1);
  canvas.directionalLight(180, 180, 180, 1, 0, -1);
  canvas.directionalLight(18, 18, 18, -1, 0, 0);
  canvas.lights();

  hint(ENABLE_STROKE_PURE);

  if (!SKIP_CLOTH) {
    drawCloth();
  }

  if (!SKIP_DONUT) {
    drawDonut(now);
  }

  if (!SKIP_PLANETS) {
    drawPlanets(now);
  }

  if (!SKIP_SPLASH) {
    drawSplash();
  }

  if (!SKIP_WEATHER) {
    drawWeatherGraph();
  }

  if (!SKIP_PATHS) {
    drawPathsandArrows();
  }

  canvas.noLights();

  if (!SKIP_TEXT) {
    drawText();
  }

  canvas.endDraw();

  // canvas.hint(DISABLE_DEPTH_TEST); // draw on top of all the other stuff
  PGraphics cover = createGraphics(coverFinalWidth, coverFinalHeight, P3D);
  cover.beginDraw();
  cover.smooth(8);
  cover.background(255, 0);

  // hint(DISABLE_DEPTH_TEST);
  cover.image(canvas, 0, 0);

  if (!SKIP_WORDS) {
    drawWords(cover);
  }

  if (!SKIP_TIME) {
    drawTimestamp(now, cover);
  }

  if (!SKIP_COUNTER) {
    drawCounter(cover);
  }

  if (!SKIP_LOGO) {
    drawLogo(now, cover);
  }

  // canvas.hint(ENABLE_DEPTH_TEST); // stop drawing on top of all the other stuff (close loop)
  // hint(ENABLE_DEPTH_TEST);

  // canvas.endDraw();

  // save image of the current frame
  if (!RERENDER_FIRST_FRAME || frameCount > 1) {
    String filename = String.format("output/%s_%d_%d_%d.tif", now, index, width, height);
    println("@" + filename);
    cover.save(filename);
    // canvas.save(filename);

    if (ONE_SHOT) {
      println("compositor_3d is done");
      exit();
    }

    index++;
  }

  if (index < starting_index + IMAGE_GENERATION_COUNT && index <= MAX_COUNTER) {
    resetDataAndObjects();
  } else {
    println("compositor_3d is done");
    exit();
  }
}

void drawDonut(long ts) {
  Point donut_center = getEllipsePoint(int(index*DonutMultiplier) % MAX_COUNTER, height*0.5, 1.0, 0.5);

  canvas.pushMatrix();
  canvas.translate(width*0.5+donut_center.x, height*0.8, donut_center.y);
  canvas.rotateX(index * 0.2);
  canvas.rotateZ(index * 0.3);
  canvas.noStroke();
  canvas.textureMode(NORMAL);
  canvas.scale(1);
  canvas.shape(donut);
  canvas.popMatrix();
}

void drawPlanets(long ts) {
  Point planets_center = getEllipsePoint(int(index*PlanetMultiplier) % MAX_COUNTER, width*0.27, 0.4, 1.0);

  canvas.pushMatrix();
  canvas.noStroke();
  canvas.translate(width*0.7 + planets_center.x, height*0.5 + planets_center.y, 40);

  orb = planet.create();
  for (int n=0; n < planet.offsets.size(); n++) {
    canvas.pushMatrix();
    canvas.rotateX(PI);
    canvas.rotateZ(planet.rotations.get(n) + (index * 0.01));
    canvas.translate(planet.offsets.get(n), 0, 0);
    canvas.scale(planet.scales.get(n));
    canvas.shape(orb);
    canvas.popMatrix();
  }

  canvas.popMatrix();
}

void drawCloth() {
  canvas.pushMatrix();
  canvas.translate(width * 0.49, height*0.125, -width*0.42);
  canvas.rotateY(-1.649); //rotate it sideways
  canvas.rotateX(2.989);
  canvas.noStroke();
  canvas.textureMode(NORMAL);
  canvas.shape(fabric);
  canvas.popMatrix();
}

void drawText() {
  Point text_center = getEllipsePoint(int(index*TextBoxMultiplier) % MAX_COUNTER, width*0.27, 0.1, 0.45); //create points
  canvas.pushMatrix();
  canvas.translate(width*0.12, height*0.25, 1); //  z
  canvas.scale(1);
  canvas.imageMode(CORNER);
  canvas.image(typeset, text_center.x, text_center.y); // from image
  canvas.popMatrix();
  canvas.noStroke();
}



void drawSplash() {
  Point splash_center = getMoebiusPoint(int(index*SplashMultiplier) % MAX_COUNTER, width*0.25);

  canvas.pushMatrix();
  canvas.translate(width*0.5+splash_center.x, height*0.5+splash_center.y, splash_center.z);
  canvas.rotateY(index * 0.4);
  canvas.rotateZ(index * 0.6);
  canvas.rotateX(index * 0.8);
  canvas.scale(0.8);
  //specular(255, 255, 255);
  canvas.directionalLight(255, 255, 255, 0, -1, -1);
  canvas.shape(splash);

  //specular(30,30,30);
  canvas.popMatrix();
  canvas.fill(255);
}


void drawWeatherGraph() {
  canvas.noStroke();

  //relative adjustments for weathergraph
  float tolerance1 = (weatherScores.get(0)-weatherScores.get(1))/2;
  float tolerance2 = (weatherScores.get(1)-weatherScores.get(2))/2;
  float tolerance3 = (weatherScores.get(2)-weatherScores.get(3))/2;
  float tolerance4 = (weatherScores.get(3)-weatherScores.get(4))/2;
  float tolerance5 = ((weatherScores.get(4))/2);

  Point weather_center = getEllipsePoint(index % MAX_COUNTER, width*0.35, 1, 0.65);

  canvas.pushMatrix();
  // primary positioning
  canvas.translate(width/2+ weather_center.x, height/2 + weather_center.y, width*0.05);
  canvas.scale(2.5);
  canvas.rotateX(index * 0.2);
  canvas.rotateZ(index * 0.1);

    canvas.pushMatrix();
    // draw each shape
    canvas.shape(weatherObjects[0]);
    canvas.translate(20, tolerance1);
    canvas.shape(weatherObjects[1]);
    canvas.translate(20, tolerance2);
    canvas.shape(weatherObjects[2]);
    canvas.translate(20, tolerance3);
    canvas.shape(weatherObjects[3]);
    canvas.translate(20, tolerance4);
    canvas.shape(weatherObjects[4]);
    canvas.rotateZ(radians(90));
    canvas.translate(tolerance5, 40);
    canvas.shape(weatherObjects[5]);
    canvas.popMatrix();

  canvas.popMatrix();
}

void drawWords(PGraphics cvs) {
  Point zig_center = zigzag.point(int(index*MoodWordMultiplier) % MAX_COUNTER);  //create zigzag points
  cvs.pushMatrix();
  cvs.imageMode(CORNER);
  cvs.scale(1);
  cvs.image(wordart.draw(), zig_center.x - width*0.05, zig_center.y + height*0.01);
  cvs.popMatrix();
  cvs.noStroke();
}

void drawTimestamp(long ts, PGraphics cvs) {
  Point tri_center = triangle.point(index % MAX_COUNTER);
  timestamp.draw(ts);
  cvs.pushMatrix();
  //translate(width*0.17,height*0.17, width*0.2);
  cvs.imageMode(CENTER);
  cvs.scale(1);
  cvs.image(timestamp.surface, tri_center.x, tri_center.y);
  cvs.popMatrix();
}

void drawCounter(PGraphics cvs) {
  Point square_center = square.point(index % MAX_COUNTER);
  counter.draw(index);
  cvs.pushMatrix();
  //translate(width*0.17,height*0.19, width*0.2);
  cvs.imageMode(CENTER);
  cvs.scale(1);
  cvs.image(counter.surface, square_center.x, square_center.y);
  cvs.popMatrix();
}

void drawLogo(long ts, PGraphics cvs) {
  cvs.pushMatrix();
  cvs.translate(width*0.5, height*0.5, width*0.4); // FIXME: scaling is funny because there's a Z-axis translation here
  cvs.shapeMode(CENTER);
  cvs.rotate(radians(90));
  cvs.shape(MICA_logo);
  cvs.popMatrix();
  cvs.shapeMode(CORNER);
}

void drawPathsandArrows() {
  PFont font;
  font = createFont("Pitch-Bold.otf", 10);
  canvas.noStroke();
  canvas.shapeMode(CENTER); //for arrows

  canvas.pushMatrix();
  canvas.translate(-width*0.1, -height*0.1, -width*0.1);
  canvas.scale(1.2);

  //ZIGZAG
  zigzag = new PolygonPath(zig_points, MAX_COUNTER);
  canvas.textFont(font, 20);

  for (int i=1; i<MAX_COUNTER; i+=1) {
    Point zig_center = zigzag.point(i);
    canvas.pushMatrix();
    canvas.fill(#10069f);
    canvas.translate(zig_center.x, zig_center.y);
    canvas.rect(0, 0, width*0.0007, width*0.0007);
    if (i == 61820) {
      canvas.pushMatrix();
      canvas.rotate(radians(90));
      canvas.text("IMAGE DESCRIPTORS", 0, -10);
      canvas.popMatrix();
    }
    canvas.popMatrix();
  }

  for (int i=1; i< MAX_COUNTER; i+=1) {

    Point weather_center = getEllipsePoint(i, width*0.5, 0.85, 0.5);
    Point donut_center = getEllipsePoint(i, height*0.5, 1.0, 0.5);
    Point planets_center = getEllipsePoint(i, width*0.27, 0.4, 1.0);
    Point splash_center = getMoebiusPoint(i, width*0.25);

    canvas.noStroke();
    //weather path
    canvas.fill(#2dc84d);
    canvas.pushMatrix();
    canvas.translate(width*0.5 + weather_center.x, height*0.5 + weather_center.y);
    canvas.rect(0, 0, width*0.0007, width*0.0007);
    if (i == 61000) {
      canvas.pushMatrix();
      canvas.rotate(radians(39));
      canvas.text("WEATHER", 0, -10);
      canvas.popMatrix();
    }
    canvas.popMatrix();

    //donut path
    canvas.fill(#fe5000);
    canvas.pushMatrix();
    canvas.translate(width*0.5 + donut_center.x, height*0.8, donut_center.y);
    canvas.rect(0, 0, width*0.0007, width*0.0007);
    if (i == MAX_COUNTER*0.192) {
      canvas.pushMatrix();
      canvas.rotate(-radians(8));
      canvas.scale(0.8);
      canvas.text("SOUND: LOCATION #1", 0, 25);
      canvas.popMatrix();
    }
    canvas.popMatrix();

    //planets path
    canvas.fill(#fedb00);
    canvas.pushMatrix();
    canvas.translate(width*0.7 + planets_center.x, height*0.5 + planets_center.y);
    canvas.rect(0, 0, width*0.0007, width*0.0007);
    if (i == 67300) {
      canvas.pushMatrix();
      canvas.rotate(radians(90));
      canvas.text("SOUND: LOCATION #2", 0, -10);
      canvas.popMatrix();
    }
    canvas.popMatrix();

    //moebius path, splash
    canvas.pushMatrix();
    canvas.fill(#e10098);
    canvas.translate(width*0.5+splash_center.x, height*0.5+splash_center.y, splash_center.z );
    canvas.rect(0, 0, width*0.0007, width*0.0007);
    if (i == 14700) {
      canvas.pushMatrix();
      canvas.rotate(radians(28));
      canvas.scale(0.6);
      canvas.text("MOTION", 0, -10);
      canvas.popMatrix();
    }
    canvas.popMatrix();

    canvas.fill(255);
  }
  canvas.textMode(SHAPE);
  canvas.fill(#10069f);
  Point Zarrow_center = zigzag.point((int(index*MoodWordMultiplier)+1) % MAX_COUNTER);
  Point Znext_center = zigzag.point((int(index*MoodWordMultiplier)+2) % MAX_COUNTER);
  float angZ = atan2(Znext_center.y - Zarrow_center.y, Znext_center.x - Zarrow_center.x);
  canvas.pushMatrix();
  canvas.translate(Zarrow_center.x, Zarrow_center.y);
  canvas.rotate(angZ);
  canvas.shape(arrow, 0, 0);
  canvas.popMatrix();

  canvas.fill(#2dc84d);
  Point Warrow_center = getEllipsePoint((index+300) % MAX_COUNTER, width*0.5, 0.85, 0.5);
  Point Wnext_center = getEllipsePoint((index+301) % MAX_COUNTER, width*0.5, 0.85, 0.5);
  float angW = atan2(Wnext_center.y - Warrow_center.y, Wnext_center.x - Warrow_center.x);
  canvas.pushMatrix();
  canvas.translate(width*0.5 +  Warrow_center.x, height*0.5 + Warrow_center.y);
  canvas.rotate(angW);
  canvas.shape(arrow, 0, 0);
  canvas.popMatrix();

  canvas.fill(#fe5000);
  Point Darrow_center = getEllipsePoint((int(index*DonutMultiplier)+100) % MAX_COUNTER, height*0.5, 1.045, 0.197);
  Point Dnext_center = getEllipsePoint((int(index*DonutMultiplier)+101) % MAX_COUNTER, height*0.5, 1.045, 0.197);
  //debug
  /*for (int i=1; i<MAX_COUNTER; i+=1) {
    fill(150);
    pushMatrix();
    Point D = getEllipsePoint(i, height*0.5, 1.045, 0.197 );
    rect(width/2 + D.x, height*0.83 +D.y, 2, 2);
    popMatrix();}*/
  //debug
  float angD = atan2(Dnext_center.y - Darrow_center.y, Dnext_center.x - Darrow_center.x);
  canvas.pushMatrix();
  canvas.translate(width/2 + Darrow_center.x, height*0.83 + Darrow_center.y);
  canvas.rotate(angD);
  canvas.fill(#fe5000);
  canvas.shape(arrow, 0, 0);
  canvas.popMatrix();

  canvas.fill(#fedb00);
  Point Parrow_center = getEllipsePoint((int(index*PlanetMultiplier)+2200) % MAX_COUNTER, width*0.27, 0.4, 1.0);
  Point Pnext_center = getEllipsePoint((int(index*PlanetMultiplier)+2201) % MAX_COUNTER, width*0.27, 0.4, 1.0);
  float angP = atan2(Pnext_center.y - Parrow_center.y, Pnext_center.x - Parrow_center.x);
  canvas.pushMatrix();
  canvas.translate(width*0.7 + Parrow_center.x, height*0.5 + Parrow_center.y);
  canvas.rotate(angP);
  canvas.shape(arrow, 0, 0);
  canvas.popMatrix();

  canvas.fill(#e10098);
  Point Marrow_center = getMoebiusPoint((int(index*SplashMultiplier)+800) % MAX_COUNTER, width*0.25);
  Point Mnext_center =getMoebiusPoint((int(index*SplashMultiplier)+801) % MAX_COUNTER, width*0.25);
  float angM = atan2(Mnext_center.y - Marrow_center.y, Mnext_center.x - Marrow_center.x);
  canvas.pushMatrix();
  canvas.translate(width*0.5+ Marrow_center.x, height*0.5 + Marrow_center.y, Marrow_center.z);
  canvas.rotate(angM);
  canvas.scale(0.95);
  canvas.shape(arrow, 0, 0);
  canvas.popMatrix();

  canvas.fill(255);//reset
  canvas.shapeMode(CORNER);//reset

  canvas.  popMatrix();
}

float R = 100.0;

Point getEllipsePoint(long counter, float radius, float wide, float flat) {
  float progress = map(counter, 0, MAX_COUNTER, 0, TWO_PI);
  //        > 1.0 means wider
  float x = wide * radius * cos(progress);
  //        < 1.0 means flatter
  float y = flat * radius * sin(progress);
  return new Point(x, y);
}

Point getMoebiusPoint(float counter, float radius) {
  float progress = map(counter, 0, MAX_COUNTER, 0, radians(720));
  float y = cos(progress) + radius*(cos(progress/2));
  float x = sin(progress) + radius*(sin(progress/1));
  float z = radius*sin(0.5*progress);
  return new Point(x, y, z);
}
