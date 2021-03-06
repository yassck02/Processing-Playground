Circle[] myCircles = new Circle[30];
Circle currentCircle = new Circle();

boolean shouldDraw = true;

void setup() {
  size(1000, 750);
  //noStroke();
  stroke(0, 0, 0);

  colorMode(HSB);

  for (int i = 0; i < myCircles.length; i++) {
    myCircles[i] = new Circle();
  }
}

void draw() {

  //background(0,0,255);

  for (int i = 0; i < myCircles.length; i++) {
    currentCircle = myCircles[i];
    currentCircle.renderCircle();
    currentCircle.updateCirclePos();
  }
}

class Circle {
  float x;
  float y;
  float sx;
  float sy;
  float r = random(10, 25);
  color randColor  = color(random(0, 255), 255, 255);
  ;

  Circle() {

    x = random(r, width-r);
    y = random(r, height-r);
    do {
      sx = round(random(-5, 5));
    } while (sx == 0); //select a random x speed until its not equal to zero
    do {
      sy = round(random(-5, 5));
    } while ((sy == 0)||(sy == sx));//select a random y speed until its not equal to zero AND the x speed
  }

  void renderCircle() {
    fill(randColor);
    ellipse(x, y, r*2, r*2);
  }

  void updateCirclePos() {
    x += sx;
    y += sy;

    if ((x <= 0+r)||(x >= width-r)) {
      sx *= -1;
    }
    if ((y <= 0+r)||(y >= height-r)) {
      sy *= -1;
    }
  }
}

void mousePressed() { //press the mouse to pause/resume the program
  shouldDraw = !shouldDraw;
  if (shouldDraw == false) {
    noLoop();
  } else {
    loop();
  }
}
