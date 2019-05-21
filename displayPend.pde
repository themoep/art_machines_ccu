float r1 = 100; // radii
float r2 = 150;
float m1 = 40;
float m2 = 40;
float a1 = PI/2; // angle
float a2 = PI/2;
float a1_v = 0; // angular velocity!
float a2_v = 0;
float g = 1;

float px2 = -1;
float py2 = -1;
float cx, cy;

void displayPendulum() {
  imageMode(CORNER);
  image(canvas, 0, 0, width, height);
  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a = (num1 + num2 + num3*num4) / den;

  num1 = 2 * sin(a1-a2);
  num2 = (a1_v*a1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v*a2_v*r2*m2*cos(a1-a2);
  den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float a2_a = (num1*(num2+num3+num4)) / den;

  pushMatrix();
  translate(s.getArrayValue()[0], s.getArrayValue()[1]);
  rotate(rotation);
  stroke(255);
  strokeWeight(2);
  

  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);

  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);

  if (drawPendulum) {
    fill(255);
    line(0, 0, x1, y1);
    line(x1, y1, x2, y2);

    fill(255);
    noStroke();
    ellipse(x1, y1, 10, 10);
    
  }
  fill(lightColor);
    ellipse(x2, y2, map(focus, 1, 10, 1, 20)*2, map(focus, 1, 10, 1, 20)*2);

  //a1_v += a1_a;
  a1_v = 0.01;

  a1_v = speed/100.0;

  a2_v += a2_a;

  a1 += a1_v;
  a2 += a2_v;

  // a1_v *= 0.99;
  // a2_v *= 0.99;

  if (record) {
    canvas.beginDraw();
    //canvas.background(0, 1);
    canvas.translate(s.getArrayValue()[0], s.getArrayValue()[1]);
    canvas.rotate(rotation);
    canvas.stroke(lightColor, map(focus, 1, 10, 255, 120));
    canvas.strokeWeight(map(focus, 1, 10, 1, 20));
    if (frameCount > 1) {
      canvas.line(px2, py2, x2, y2);
    }
    canvas.endDraw();
  }
  popMatrix();

  px2 = x2;
  py2 = y2;
}
