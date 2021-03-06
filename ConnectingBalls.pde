Circle[] myCircles = new Circle[20];
Circle currentCircle = new Circle();
Circle selectedCircle = new Circle();

boolean shouldDraw = true;
boolean shouldInvertColors = false;


void mousePressed() { //press the mouse to pause/resume the program
  shouldDraw = !shouldDraw;
  if (shouldDraw == false) {
    noLoop();
  } else {
    loop();
  }
}

void keyPressed() {
  shouldInvertColors = !shouldInvertColors;
}


void setup() {
  size(1000, 700);
  stroke(0, 0, 0); //0 = black - 255 = white
  colorMode(HSB);
  for (int i = 0; i < myCircles.length; i++) {//populate array of circles
    myCircles[i] = new Circle();
  }
}

void draw() {
  if (shouldInvertColors == true) {
    filter(INVERT);
  }

  background(0, 0, 255); //0 = black - 255 = white

  for (int i = 0; i < myCircles.length; i++) {
    currentCircle = myCircles[i];
    currentCircle.renderCircle();
    currentCircle.updateCirclePos();
    currentCircle.drawLine();
  }
}

class Circle {
  float x;
  float y;
  float sx;
  float sy;
  float r;
  color randColor = color(random(0, 255), 255, 255, 50); //last number is transparency

  Circle() {
    r = 50; //every circles radius
    randomPos(); //gives circle random position using randomPos function
  }

  void renderCircle() { 
    fill(randColor);
    ellipse(x, y, r*2, r*2); //display circle on screen
  }

  void updateCirclePos() {
    x += sx;
    y += sy;

    if ((x > width+r)||(x < 0-r)) {
      randomPos(); //reset the Circle if it goes off the left or right of the screen
    }
    if ((y > height+r)||(y < 0-r)) {
      randomPos(); //reset the circle if it goes off the top or bottom of the screen
    }
  }

  void randomPos() {
    x = random(r, width-r); //random width
    y = random(r, height-r); //random height

    if (x > width/2) { //sets x position off of the screen
      x = width+r;
    } else if (x < width/2) {
      x = 0-r;
    }

    if (x < width/2) { //sets x speed based onside of screen
      sx = random(1, 3);
    } else if (x > width/2) {
      sx = random(-3, -1);
    }
    sy = random(-1, 1); //sets random y speed
  }

  void drawLine() {
    for (int z = 0; z < myCircles.length; z++) {
      selectedCircle = myCircles[z];
      if (dist(x, y, selectedCircle.x, selectedCircle.y) <= 200) {
        line(x, y, selectedCircle.x, selectedCircle.y);
      }
    }
  }
}
