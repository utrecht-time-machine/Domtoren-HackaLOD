int levelCounts[] = { 35, 47, 56, 46 };
PImage bg, logo;
float rotx = 0;
float roty = PI/4;
int SIDES = 9;
PImage t[][] = new PImage[4][SIDES];
ArrayList<PVector> dots = new ArrayList(); 

PImage randomImage(int level) {
  return loadImage("level"+level+"/"+int(random(levelCounts[level])+1)+".png");
}

void setup() {
  size(450, 800, P3D);
  logo = loadImage("bghackalod.png");

  textFont(loadFont("Blackout2AM-48.vlw"));

  for (int level=0; level<4; level++) {
    for (int side=0; side<SIDES; side++) {
      t[level][side] = randomImage(level);
    }
  }

  textureMode(NORMAL);
  fill(255);
  stroke(color(44, 48, 32));
  textSize(25);
  background(0);
  //image(logo, 0, 0);
  //fill(255);
  //text("59\ndays\n15\nhours\n11\nminutes\n"+(59-second())+"\nseconds", 13, 540);
  //filter(INVERT);
}

void draw() {
  roty-=.005; //25;

  hint(DISABLE_DEPTH_TEST);
  fill(0, 50);
  rect(0, 0, width, height);
  tint(255);
  image(logo, 0, 0);
  fill(255);
  text("59\ndays\n15\nhours\n11\nminutes\n"+(59-second())+"\nseconds", 13, 540);
  
  while (dots.size()>20) {
    dots.remove(0);
  }
  
  stroke(255,3);
  beginShape(LINES);
  for (PVector a:dots) {
    for (PVector b:dots) {
      vertex(a.x,a.y);
      vertex(b.x,b.y);
    }
  }
  endShape();
  
  stroke(255);
  beginShape(POINTS);
  for (PVector dot:dots) {
    vertex(dot.x,dot.y);
  }
  endShape();
  
  hint(ENABLE_DEPTH_TEST);

  noStroke();
  translate(width/2.0+65, height/2.0+350, -250);
  rotateX(rotx);
  rotateY(roty);
  tint(255, 175);
  domtoren_level(0, 0, 0, 0, 90, 130, 90);
  domtoren_level(1, 0, -250, 0, 80, 120, 80);
  domtoren_level(2, 0, -460, 0, 65, 100, 65);
  domtoren_level(3, 0, -625, 0, 55, 70, 55);

  if (random(1)<.15) {
    int level = int(random(4));
    int side = int(random(SIDES));
    t[level][side] = randomImage(level);
    
    //float a=noise(frameCount/100.); //random(TWO_PI); //noise(frameCount/100.); //random(TWO_PI);
    //float x=sin(a)*random(width/2)+10;
    //float y=cos(a)*random(width/2)+100;
    //dots.add(new PVector(x,y));
  }

  if (frameCount>40) saveFrame("output/"+(frameCount-40)+".tif");
}

void domtoren_level(int level, float x, float y, float z, float sx, float sy, float sz) {
  pushMatrix();
  translate(x, y, z);
  scale(sx, sy, sz);
  if (level<3) TexturedCube(level);
  else TexturedPyramid(level);
  popMatrix();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
