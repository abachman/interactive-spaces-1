//// LETTER FORMS

/**** R ****/

class LetterR extends LetterForm {

  LetterR(float ts, int w, color c) {
    super(ts, w, c);
  }

  float angler;
    
  void setup() {
    surface = createGraphics(600, 600);
    angler = timestamp;
  }
    
  void draw() {
    float rsin=sin(angler);
    
    angler+=0.005;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    surface.arc(0, 0, 180, 180, radians(184), radians(536));
    surface.ellipse(0, 0, 50, 50);
    surface.line(-50, 0, -135, 0);
    surface.ellipse(-90, 0, 8, 8);
    surface.pushMatrix();
    surface.rotate(radians(rsin*160));
    surface.line(0, 0, 10, 0);
    surface.ellipse(63, 0, 28, 28);
    surface.line(38, 0, 63, 0);
    surface.popMatrix();
    surface.pushMatrix();
    surface.rotate(radians(rsin*30));
    surface.ellipse(0, -63, 8, 8);
    surface.line(0, -38, 0, -63);
    surface.popMatrix();
    surface.pushMatrix();
    surface.rotate(radians(rsin*15));
    surface.ellipse(0, 63, 18, 18);
    surface.line(0, 38, 0, 63);
    surface.popMatrix();
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** U ****/

class LetterU extends LetterForm {

  LetterU(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float angleu;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    angleu = timestamp;
  }
    
  void draw() {
    float usin=sin(angleu);
    
    angleu+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.pushMatrix();
    surface.rotate(radians(45));
    surface.line(-50.91, -45.25, -53.74, -48.08);
    surface.line(-50.91+2.82, -45.25-2.82, -53.74+2.82, -48.08-2.82);
    surface.line(-50.91+2.82+2.82, -45.25-2.82-2.82, -53.74+2.82+2.82, -48.08-2.82-2.82);
    
    surface.arc(0, 0, 180, 180, radians(48), radians(402));
    
    surface.pushMatrix();
    surface.rotate(radians(usin*60-60));
    surface.arc(0, 0, 160, 160, radians(5), radians(40));
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(-usin*60+60));
    surface.arc(0, 0, 160, 160, radians(50), radians(85));
    surface.popMatrix();
    
    
    surface.pushMatrix();
    surface.rotate(radians(usin*10-10));
    surface.arc(0, 0, 140, 140, radians(70), radians(174));
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(-usin*10+10));
    surface.arc(0, 0, 140, 140, radians(276), radians(380));
    surface.popMatrix();
    
    surface.ellipse(56.35, 56.35, 9, 9);
    surface.ellipse(0, 0, 10, 10);
    
    surface.line(54.23, 54.23, 58.96, 58.96);
    surface.line(14.14, 14.14, 0, 0);
    
    surface.ellipse(0, -70, 6, 6);
    surface.ellipse(-70, 0, 6, 6);
    surface.line(-70, 0, -73, 0);
    surface.line(0, -70, 0, -73);
    surface.popMatrix();
    surface.line(0,90,0,135);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** I ****/

class LetterI extends LetterForm {

  LetterI(float ts, int w, color c) {
    super(ts, w, c);
  }

    
    
    
  void setup(){
    surface = createGraphics(600,600);
    
    
  }
    
  void draw(){
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300,300);
    
    surface.rect(-5,-67.5,10,135);
    
    //top
    surface.line(0,-67.5,0,-90);
    surface.ellipse(0,-90,10,10);
    
    //bottom
    surface.line(0,45,0,90);
    
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** N ****/

class LetterN extends LetterForm {

  LetterN(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglen;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglen = timestamp;
  }
    
  void draw() {
    float nsin=sin(anglen);
    
    anglen+=0.02;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.arc(0, 0, 180, 180, radians(92), radians(268));
    surface.arc(0, 0, 180, 180, radians(274), radians(448));
    
    surface.line(-56-nsin*10,25.5,56+nsin*10,25.5);
    surface.ellipse(53+nsin*10,25.5,6,6);
    surface.ellipse(-53-nsin*10,25.5,6,6);
    surface.ellipse(0,25.5,20,20);
    
    surface.line(0,-20,0,-54.5);
    surface.line(0,-70.5,0,-95);
    surface.line(-1.5,-54.5,1.5,-54.5);
    surface.line(-1.5,-70.5,1.5,-70.5);
    surface.line(-1.5,-54.5,-1.5,-70.5);
    surface.line(1.5,-54.5,1.5,-70.5);
    surface.line(0,71,0,135);
    surface.line(-3.5,71,3.5,71);
    surface.line(-3.5,-20,3.5,-20);
    surface.popMatrix();
    
    surface.endDraw();
  }

}


/**** G ****/

class LetterG extends LetterForm {

  LetterG(float ts, int w, color c) {
    super(ts, w, c);
  }

  float angleg;
    
  void setup() {
    surface = createGraphics(600, 600);
    
    angleg = timestamp;
  }
    
  void draw() {
    float gsin=sin(angleg);
    angleg+=0.01;
    
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    
    surface.arc(0, 0, 180, 180, radians(93), radians(447));
    
    surface.pushMatrix();
    surface.rotate(radians(45)+radians(gsin*90));
    surface.arc(0, 0, 130, 130, radians(93), radians(267));
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(45)+radians(gsin*45));
    surface.arc(0, 0, 150, 150, radians(180), radians(360));
    surface.popMatrix();
    
    
    surface.ellipse(75.05,22.37,6,6);
    surface.ellipse(-75.05,22.37,6,6);
    surface.line(75.05,19.37,75.05,25.37);
    surface.line(-72.05,22.37,-78.05,22.37);
    
    surface.line(0, 0, 0, 135);
    surface.line(-1.5,0,1.5,0);
    surface.line(-1.5,-8,1.5,-8);
    surface.line(-1.5,0,-1.5,-8);
    surface.line(1.5,0,1.5,-8);
    surface.line(0,-4,0,-24);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** Z ****/

class LetterZ extends LetterForm {

  LetterZ(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglez;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglez = timestamp;
  }
    
  void draw() {
    float zsin=sin(anglez);
    
    anglez+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.line(0,-2.09,0,3.91);
    surface.line(0,51.91,0,57.91);
    surface.line(23.78,27.91,29.78,27.91);
    surface.line(-23.78,27.91,-29.78,27.91);
    surface.line(0,-40,0,-50);
    surface.line(0,75,0,80);
    surface.line(0,-75,0,-80);
    surface.line(75,0,135,0);
    surface.line(-75,0,-135,0);
    
    surface.arc(0, 0, 180, 180, radians(2), radians(178));
    surface.arc(0, 0, 180, 180, radians(182), radians(358));
    
    surface.ellipse(0,27.91+10*zsin,10,10);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** T ****/

class LetterT extends LetterForm {

  LetterT(float ts, int w, color c) {
    super(ts, w, c);
  }

  void setup() {
    surface = createGraphics(600, 600);
  }
    
  void draw() {
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.line(0,0,0,22.5);
    surface.line(-5,22.5,5,22.5);
    surface.line(-5,17.5,5,17.5);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** S ****/

class LetterS extends LetterForm {

  LetterS(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float angles;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    angles = timestamp;
  }
    
  void draw() {
    float ssin=sin(angles);
    
    angles+=0.02;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    
    surface.pushMatrix();
    surface.rotate(radians(45));
    surface.ellipse(0, 0, 180, 180);
    
    
    surface.pushMatrix();
    surface.translate(28.19, 28.19);
    surface.rotate(radians(ssin*30));
    surface.arc(0, 0, 100, 100, radians(225), radians(405));
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.translate(-13.91, -13.91);
    surface.rotate(radians(ssin*-30));
    surface.arc(0, 0, 140, 140, radians(45), radians(225));
    surface.popMatrix();
    
    surface.ellipse(42.43, 42.43, 60, 60);
    surface.line(-3.91, -3.01, 31.93, 31.93);
    surface.line(38.51, 38.51, 63.78, 63.78);
    surface.line(-10.5, -10.5, -62, -62);
    surface.ellipse(-49.62, -49.63, -7, -7);
    surface.line(-52.11, -47.16, -47.16, -52.11);
    
    
    surface.line(-8.38, -12.63, -12.62, -8.38);
    surface.line(-1.79, -5.97, -5.97, -1.79);
    surface.line(29.81, 34.05, 34.05, 29.81);
    surface.line(36.39, 40.63, 40.63, 36.39);
    surface.popMatrix();
    surface.line(0,-92.5,0,-135);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** A ****/

class LetterA extends LetterForm {

  LetterA(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglea1;
    float anglea2;
    
    
  void setup(){
    surface = createGraphics(600,600);
    
    anglea1 = timestamp;
    anglea2=0;
  }
    
  void draw(){
    float asin1=sin(anglea1)*50;
    float asin2=sin(anglea2)*40;
    anglea1+=0.01;
    anglea2+=0.02;
    
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300,300);
    
    surface.line(0,85,0,157.5);
    
    surface.arc(0, 0, 180,180, radians(92), radians(448));
    surface.ellipse(0,-80,6,6);
    surface.arc(0, 0, 160, 160, radians(165), radians(266));
    surface.arc(0, 0, 160, 160, radians(274), radians(375));
    surface.line(74.46,20,80.46,20);
    surface.line(-74.46,20,-80.46,20);
    surface.line(13,65,62.43,65);
    surface.line(13,62,13,68);
    surface.line(-13,65,-62.43,65);
    surface.line(-13,62,-13,68);
    surface.line(0,0,0,-10);
    
    
    surface.ellipse(0,5+asin1,10,10);
    surface.ellipse(0,25+asin2,20,20);
    
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** F ****/

class LetterF extends LetterForm {

  LetterF(float ts, int w, color c) {
    super(ts, w, c);
  }

    
    
    
  void setup(){
    surface = createGraphics(600,600);
    
    
  }
    
  void draw(){
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300,300);
    
    surface.rect(-5,-67.5,10,135);
    //right
    surface.line(5,-45,90,-45);
    surface.line(90,-35,90,-55);
    //top
    surface.line(0,-57.5,0,-77.5);
    //left
    surface.line(-5,0,-95,0);
    surface.ellipse(-95,0,10,10);
    //bottom
    surface.line(0,77.5,0,97.5);
    surface.line(-5,77.5,5,77.5);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** O ****/

class LetterO extends LetterForm {

  LetterO(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float angleo;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    angleo = timestamp;
  }
    
  void draw() {
    float osin=sin(angleo);
    
    angleo+=0.002;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.arc(0, 0, 180, 180, radians(140), radians(400));
    surface.arc(0, 0, 200, 200, radians(255), radians(285));
    surface.ellipse(0, 0, 140, 140);
    
    surface.pushMatrix();
    surface.rotate(radians(osin*360));
    surface.ellipse(70, 0, 6, 6);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(osin*350));
    surface.ellipse(60.61, 35.02, 8, 8);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(osin*340));
    surface.ellipse(35, 60.62, 10, 10);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(osin*330));
    surface.ellipse(0, 70, 12, 12);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(osin*320));
    surface.ellipse(-35, 60.62, 14, 14);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(osin*310));
    surface.ellipse(-60.61, 35.02, 16, 16);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(osin*300));
    surface.ellipse(-70, 0, 18, 18);
    surface.popMatrix();
    
    surface.line(0, 47, 0, 135);
    surface.line(-7.32, 47, 7.32, 47);
    surface.line(-4.86, 43, 4.86, 43);
    surface.line(-3.86, 39, 3.86, 39);
    surface.line(-2.86, 35, 2.86, 35);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** H ****/

class LetterH extends LetterForm {

  LetterH(float ts, int w, color c) {
    super(ts, w, c);
  }

  void setup(){
    surface = createGraphics(600,600);
    
    
  }
    
  void draw(){
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300,300);
    
    surface.rect(-5,-45,10,95);
    
    //top
    surface.line(0,-35,0,-55);
    //bottom
    surface.line(-5,55,5,55);
    surface.line(0,55,0,67.5);
    surface.line(0,67.5,-15.5,67.5);
    surface.ellipse(-22.5,67.5,10,10);
    surface.line(-27.45,72.45,-45,90);
    //right
    surface.line(5,-45,41.43,-81.43);
    surface.line(12.27,-37.93,48.5,-74.36);
    surface.line(41.43,-81.43,48.5,-74.36);
    surface.line(5,-45,12.27,-37.93);
    surface.line(36.82,-69.75,57.07,-90);
    surface.line(57.07,-90,90,-90);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** M ****/

class LetterM extends LetterForm {

  LetterM(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglem;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglem = timestamp;
  }
    
  void draw() {
    float msin=sin(anglem);
    
    anglem+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.arc(0, 0, 180, 180, radians(120), radians(418));
    surface.arc(0, 0, 180, 180, radians(66), radians(85));
    surface.arc(0, 0, 180, 180, radians(95), radians(113));
    
    surface.arc(0, 0, 150, 150, radians(2), radians(178));
    surface.arc(0, 0, 150, 150, radians(182), radians(358));
    
    surface.ellipse(0,0,8,8);
    
    surface.line(10,0,32,0);
    surface.line(-10,0,-32,0);
    surface.line(10,3,10,-3);
    surface.line(-10,3,-10,-3);
    
    surface.ellipse(47,msin*30,12,12);
    surface.ellipse(-47,-msin*30,12,12);
    
    surface.line(72,0,93,0);
    surface.line(-72,0,-93,0);
    surface.line(72,3,72,-3);
    surface.line(-72,3,-72,-3);
    
    surface.line(41,77.44,41,83.44);
    surface.line(-41,77.44,-41,83.44);
    surface.line(0,90,0,135);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** J ****/

class LetterJ extends LetterForm {

  LetterJ(float ts, int w, color c) {
    super(ts, w, c);
  }

  float anglej;
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglej = timestamp;
  }
    
  void draw() {
    float jsin=sin(anglej);
    anglej+=0.005;
    
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.ellipse(0, 0, 180, 180);
    
    surface.pushMatrix();
    surface.translate(-22.5,0);
    surface.rotate(radians(jsin*180));
    surface.arc(0, 0, 135, 135, radians(-90), radians(180));
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(jsin*360));
    surface.line(-67.5, 0, 10, 0);
    surface.ellipse(-67.5, 0, 7, 7);
    surface.line(10, -3.5, 10, 3.5);
    surface.popMatrix();
    
    surface.line(0, 80, 0, -80);
    surface.line(-2.12, 82.12, 2.12, 77.88);
    surface.line(-2.12, -77.88, 2.12, -82.12);
    surface.line(-2.12, 102.12, 2.12, 97.88);
    surface.line(63.5, 0, 71.5, 0);
    surface.line(0, 100, 0, 135);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** C ****/

class LetterC extends LetterForm {

  LetterC(float ts, int w, color c) {
    super(ts, w, c);
  }

  float anglec;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglec = timestamp;
  }
    
  void draw() {
    float csin=sin(anglec);
    anglec+=0.01;
    
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    
    surface.arc(0, 0, 180, 180, radians(92), radians(448));
    surface.arc(0, 0, 120, 120, radians(-30), radians(210));
    
    surface.ellipse(0, -22.43, 4, 4);
    
    surface.pushMatrix();
    surface.rotate(radians(180)-radians(csin)*180);
    
    surface.ellipse(0, -37.42, 6, 6);
    surface.arc(0, 0, 154.48, 154.48, radians(267.5), radians(272.5));
    surface.popMatrix();
    
    
    surface.ellipse(0, -52.42, 8, 8);
    
    surface.line(0, -18.42, 0, -22.42);
    surface.line(0, -52.6, 0, -60.4);
    surface.line(0, 57, 0, 135);
    surface.line(60.8, 60.8, 66.46, 66.46);
    surface.line(-60.8, 60.8, -66.46, 66.46);
    surface.line(49.36, -27.56, 55.53, -31.5);
    surface.line(-49.36, -27.56, -55.53, -31.5);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** D ****/

class LetterD extends LetterForm {

  LetterD(float ts, int w, color c) {
    super(ts, w, c);
  }

  float angled;
    
  void setup() {
    surface = createGraphics(600, 600);
    
    angled = timestamp;
  }
    
  void draw() {
    float dsin=sin(angled);
    angled+=0.01;
    
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    
    surface.arc(0, 0, 180, 180, radians(93), radians(447));
    
    surface.pushMatrix();
    surface.rotate(radians(dsin*180));
    surface.arc(0, 0, 90, 90, radians(180), radians(270));
    surface.ellipse(-45, 0, 6, 6);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(dsin*90));
    surface.arc(0, 0, 120, 120, radians(210), radians(540));
    surface.ellipse(-51.96, -30, 8, 8);
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(-dsin*45));
    surface.arc(0, 0, 150, 150, radians(230), radians(270));
    surface.ellipse(0, -75, 10, 10);
    surface.popMatrix();
    
    
    
    surface.line(0, 0, 0, 135);
    surface.line(-6, 6, 6, 6);
    surface.line(-5, 86, -5, 92);
    surface.line(5, 86, 5, 92);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** V ****/

class LetterV extends LetterForm {

  LetterV(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglev;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglev = timestamp;
  }
    
  void draw() {
    float vsin=sin(anglev);
    
    anglev+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    
    surface.arc(0, 0, 180, 180, radians(92), radians(448));
    
    surface.ellipse(0,67.5*vsin,45,45);
    surface.ellipse(0,-45.78*vsin,20,20);
    
    surface.line(-3.5,89.90,-3.5,67.5*vsin+22.5);
    surface.line(3.5,89.90,3.5,67.5*vsin+22.5);
    surface.line(0,-10-45.78*vsin,0,67.5*vsin);
    
    surface.line(-61.5,0,61.5,0);
    surface.line(-61.5,-6,-61.5,6);
    surface.line(61.5,-6,61.5,6);
    surface.line(66.5,0,95,0);
    surface.line(-66.5,0,-95,0);
    surface.line(0,75.78,0,135);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** Q ****/

class LetterQ extends LetterForm {

  LetterQ(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglep;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglep = timestamp;
  }
    
  void draw() {
    float qsin=sin(anglep);
    
    anglep+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.pushMatrix();
    surface.rotate(radians(45));
    surface.ellipse(0, 0, 180, 180);
    surface.arc(0, 0, 170, 170, radians(135), radians(315));
    surface.line(-60.1, 60.1, -67.18, 67.18);
    surface.line(60.1, -60.1, 67.18, -67.18);
    surface.ellipse(35,35,16,16);
    
    
    surface.pushMatrix();
    surface.rotate(radians(qsin*180));
    surface.arc(0, 0, 140, 140, radians(290), radians(300));
    surface.arc(0, 0, 140, 140, radians(310), radians(320));
    surface.arc(0, 0, 140, 140, radians(330), radians(340));
    surface.arc(0, 0, 140, 140, radians(350), radians(360));
    surface.ellipse(70, 0, 5, 5);
    surface.popMatrix();
    surface.popMatrix();
    surface.line(0,50,0,135);
    
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** X ****/

class LetterX extends LetterForm {

  LetterX(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglex;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglex = timestamp;
  }
    
  void draw() {
    float xsin=sin(anglex);
    
    anglex+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.line(-3, 44.9, -3, 89.95);
    surface.line(3, 44.9, 3, 89.95);
    surface.line(-3, -44.9, -3, -89.95);
    surface.line(3, -44.9, 3, -89.95);
    
    surface.arc(0, 0, 180, 180, radians(2), radians(88));
    surface.arc(0, 0, 180, 180, radians(92), radians(178));
    surface.arc(0, 0, 180, 180, radians(182), radians(268));
    surface.arc(0, 0, 180, 180, radians(272), radians(358));
    
    surface.line(0, 36, 0, 48);
    surface.line(0, -36, 0, -48);
    
    surface.line(36, 0, 95, 0);
    surface.line(-36, 0, -95, 0);
    
    surface.line(95, 3.17, 95, -3.17);
    surface.line(-95, 3.17, -95, -3.17);
    surface.line(0, 2, 0, -2);
    
    surface.ellipse(0, 20*xsin, 40, 40);
    surface.ellipse(20*xsin, 0, 80, 80);
    
    surface.line(0,82,0,135);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** E ****/

class LetterE extends LetterForm {

  LetterE(float ts, int w, color c) {
    super(ts, w, c);
  }

    
    
    
  void setup(){
    surface = createGraphics(600,600);
    
    
  }
    
  void draw(){
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300,300);
    
    surface.rect(5,-5,90,10);
    surface.rect(-5,5,10,90);
    
    surface.line(85,0,135,0);
    surface.line(135,-5,135,5);
    
    surface.line(0,100,0,135);
    surface.line(-5,100,5,100);
    
    surface.ellipse(0,135,10,10);
    surface.ellipse(-15,135,10,10);
    surface.ellipse(-30,135,10,10);
    surface.ellipse(-90,135,10,10);
    surface.line(-15,135,-15,130);
    surface.line(-30,135,-25,135);
    surface.line(-90,135,-95,135);
    
    surface.line(-58.64,-58.64,0,0);
    surface.line(-90,-90,-67.5,-67.5);
    
    surface.line(-55.1,-62.18,-62.18,-55.1);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** B ****/

class LetterB extends LetterForm {

  LetterB(float ts, int w, color c) {
    super(ts, w, c);
  }

  float rotb;
    
    
  void setup(){
    surface = createGraphics(600,600);
    
    
  }
    
  void draw(){

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300,300);
    surface.line(0,-100,0,-157.6);
    surface.ellipse(0,0,180,180);
    surface.ellipse(0,0,100,100);
    surface.line(0,0,100,0);
    surface.line(100,-10,100,10);
    surface.line(-10,-80,10,-80);
    surface.line(-10,-100,10,-100);
    surface.pushMatrix();
    surface.rotate(rotb);
    surface.arc(50, 0, 80, 80, radians(246), radians(473));
    surface.arc(50, 0, 80, 80, radians(218), radians(228));
    surface.arc(50, 0, 80, 80, radians(188), radians(198));
    surface.arc(50, 0, 80, 80, radians(158), radians(168));
    surface.arc(50, 0, 80, 80, radians(128), radians(138));
    surface.popMatrix();
    surface.popMatrix();
    rotb+=0.01;
    surface.endDraw();
  }

}


/**** K ****/

class LetterK extends LetterForm {

  LetterK(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglek;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglek = timestamp;
  }
    
  void draw() {
    float ksin=sin(anglek);
    
    anglek+=0.01;
    
    
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.arc(0, 0, 180, 180, radians(-88), radians(27));
    surface.arc(0, 0, 180, 180, radians(33), radians(147));
    surface.arc(0, 0, 180, 180, radians(153), radians(268));
    
    surface.arc(0, 0, 169.72, 169.72, radians(150), radians(390));
    
    surface.line(0, -84.86, 0, -135);
    surface.line(-38.97, 22.5-ksin*20, -38.97, -81.12);
    surface.line(38.97, -22.5+ksin*20, 38.97, 81.12);
    
    
    surface.ellipse(38.97, -22.5+ksin*20, 10, 10);
    surface.ellipse(-38.97, 22.5-ksin*20, 10, 10);
    
    
    surface.line(0, 53.40+ksin*10, 0, 61.16+ksin*10);
    surface.line(0, -53.40-ksin*10, 0, -61.16-ksin*10);
    surface.line(53.40+ksin*10, 0, 61.16+ksin*10, 0);
    surface.line(-53.40-ksin*10, 0, -61.16-ksin*10, 0);
    
    
    surface.line(-73.49, 42.43, -82.15, 47.43);
    surface.line(73.49, 42.43, 82.15, 47.43);
    
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** L ****/

class LetterL extends LetterForm {

  LetterL(float ts, int w, color c) {
    super(ts, w, c);
  }

  void setup() {
    surface = createGraphics(600, 600);
  }
    
  void draw() {
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.pushMatrix();
    surface.rotate(radians(45));
    surface.rect(-5, -5, 10, -50);
    //top
    surface.line(-5, -65, 5, -65);
    surface.line(-5, -70, 5, -70);
    surface.ellipse(0, -80, 10, 10);
    surface.line(-5, -90, 5, -90);
    surface.line(-5, -95, 5, -95);
    surface.line(-5, -100, 5, -100);
    
    //bottom
    surface.line(0, 0, 0, -15);
    surface.line(0, 0, -63.64, 0);
    surface.popMatrix();
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** Y ****/

class LetterY extends LetterForm {

  LetterY(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float angley;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    angley = timestamp;
  }
    
  void draw() {
    float ysin=sin(angley);
    
    angley+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.line(-2.83,2.83,2.83,2.83);
    surface.line(-2.83,-2.83,2.83,-2.83);
    surface.line(2.83,2.83,2.83,-2.83);
    surface.line(-2.83,-2.83,-2.83,2.83);
    surface.line(0,-2.83,0,-25.66);
    surface.line(2.83,0,25.66,0);
    surface.line(-2.83,0,-25.66,0);
    surface.line(0,2.83,0,135);
    surface.line(84.95,0,99.95,0);
    surface.line(-84.95,-0,-99.95,0);
    
    surface.arc(0, 0, 180, 180, radians(2), radians(178));
    surface.arc(0, 0, 180, 180, radians(182), radians(358));
    
    surface.ellipse(0,-25.66+20+ysin*20,128.96,128.96);
    surface.ellipse(0,57.83-5-ysin*5,64.34,64.34);
    
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** P ****/

class LetterP extends LetterForm {

  LetterP(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglep;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglep = timestamp;
  }
    
  void draw() {
    float psin=sin(anglep);
    
    anglep+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.ellipse(0, 0, 180, 180);
    
    surface.pushMatrix();
    surface.rotate(radians(psin*180));
    surface.arc(0, 0, 105.06, 105.06, radians(-48), radians(228));
    surface.popMatrix();
    
    surface.pushMatrix();
    surface.rotate(radians(psin*-180));
    surface.arc(0, 0, 93.06, 93.06, radians(178), radians(362));
    surface.popMatrix();
    
    surface.line(0, 0, 0, 135);
    surface.line(3, 2, 44, 2);
    surface.line(-3, 2, -44, 2);
    surface.line(49, 2, 89.98, 2);
    surface.line(-49, 2, -89.98, 2);
    
    surface.line(0, -25, 0, -68);
    
    surface.ellipse(0, -25, 5, 5);
    surface.ellipse(0, -68, 12, 12);
    surface.popMatrix();
    surface.endDraw();
  }

}


/**** W ****/

class LetterW extends LetterForm {

  LetterW(float ts, int w, color c) {
    super(ts, w, c);
  }

    
  float anglew;
    
    
    
  void setup() {
    surface = createGraphics(600, 600);
    
    anglew = timestamp;
  }
    
  void draw() {
    float wsin=sin(anglew);
    
    anglew+=0.01;
    

    surface.beginDraw();
    surface.stroke(colr);
    surface.noFill();
    surface.strokeWeight(weight);
    surface.pushMatrix();
    surface.translate(300, 300);
    
    surface.line(0, -135, 0, 4);
    surface.line(-4, 0, 4, 0);
    
    surface.arc(0, 0, 180, 180, radians(47), radians(132));
    surface.arc(0, 0, 180, 180, radians(274), radians(402));
    surface.arc(0, 0, 180, 180, radians(137), radians(266));
    
    surface.ellipse(56.57*wsin, -56.57*wsin, 20, 20);
    surface.ellipse(-38.64*wsin, -10.35*wsin, 100, 100);
    surface.ellipse(28.37*wsin, 28.37*wsin, 60, 60);
    surface.ellipse(0, 50*wsin, 80, 80);
    surface.popMatrix();
    surface.endDraw();
  }

}

