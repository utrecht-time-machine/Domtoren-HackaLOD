void TexturedCube(int level) {
  int side=0;

  // +Z "front" face
  pushMatrix();
  beginShape(TRIANGLE);
  texture(t[level][side++]); // tex[int(random(tex.length))]);
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  endShape();
  popMatrix();

  pushMatrix();
  beginShape(TRIANGLE);
  texture(t[level][side++]);
  vertex(-1, -1, 1, 0, 0);
  vertex(-1, 1, 1, 0, 1);
  vertex(1, 1, 1, 1, 1);
  endShape();
  popMatrix();


  // -Z "back" face
  pushMatrix();
  beginShape(TRIANGLE);
  texture(t[level][side++]); // tex[int(random(tex.length))]);
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  endShape();
  popMatrix();

  pushMatrix();
  beginShape(TRIANGLE);
  texture(t[level][side++]);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, 1, -1, 0, 1);
  vertex(1, 1, -1, 1, 1);
  endShape();
  popMatrix();

  // +X "right" face
  pushMatrix();
  //translate(0, 0, ff);
  beginShape(QUADS);
  //texture(tex[int(random(tex.length))]);
  texture(t[level][side++]);
  vertex( 1, -1, 1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex( 1, 1, 1, 0, 1);
  endShape();
  popMatrix();

  // -X "left" face
  pushMatrix();
  //translate(0, 0, ff);
  beginShape(QUADS);
  //texture(tex[int(random(tex.length))]);
  texture(t[level][side++]);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();
  popMatrix();

  // +Y "bottom" face
  pushMatrix();
  beginShape(QUADS);
  texture(t[level][side++]);
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();
  popMatrix();

  // -Y "top" face
  pushMatrix();
  beginShape(QUADS);
  texture(t[level][side++]);
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);
  endShape();
  popMatrix();
}

void TexturedPyramid(int level) {
  beginShape(QUADS);
  //texture(tex);
  int side=0;
  
  texture(t[level][side++]);

  // +Z "front" face
  vertex(0, -1, 0, .5, 0);
  vertex(0, -1, 0, .5, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  // -Z "back" face
  vertex( 0, -1, 0, .5, 0);
  vertex( 0, -1, 0, .5, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex( 1, 1, -1, 0, 1);


  //// +X "right" face
  vertex( 0, -1, 0, .5, 0);
  vertex( 0, -1, 0, .5, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex( 1, 1, 1, 0, 1);

  //// -X "left" face
  vertex(0, -1, 0, .5, 0);
  vertex(0, -1, 0, .5, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  endShape();
}
