int SIZE = 50; //max number of letters on the screen at a time

Letter[] myLetters = new Letter[SIZE]; //array of stacks of letters
Letter currentLetter = new Letter(); 

boolean shouldDraw = true;

void setup() {
  size(1000, 700);
  colorMode(HSB);
  frameRate(10); //speed
  for (int i = 0; i < myLetters.length; i++) { //populate array with letters
    myLetters[i] = new Letter();
  }
}


void draw() {
  background(0, 0, 0); //255 = white // 0 = black

  for (int i = 0; i < myLetters.length; i++) { //cycle through each stack of letters
    currentLetter = myLetters[i];  
    currentLetter.updatePosition(); //update the stacks position (move it down the screen)
    currentLetter.renderLetter(); //show the stack on the screen
  }
}

class Letter {
  char c; //letter or symbol to be displayed
  float x; //x position of the stackstack  (left to right)
  float y = random(-500,0); //y position of stack (0 is at the top of the screen) -100 is used so that not all the stacks dropp at the same time
  float s; //text size (height - in pixels)

  float h = 100; //hue (color)
  //neon green = 75-100
  //yellowGreen = 50
  //neon blue = 120-130
  //bright red = 230-245
  //purple = 200

  float t; //transplarency of color
  float v; //velocity of the letter stack
  float num = 20; //number of characters to dislplay in the trail

  Letter() {
    s = random(5, 25); //random letter size (smaller = father away / bigger = closer)
    v = s; //velocity based of size of the letter (smaller letters move slower, bigger move faster)
    randomPosition(); //give the letter stack a random start position
    randomChar(); //give the stack a random letter assignment
  }

  void renderLetter() { 
    textSize(s); 
    for (int z = 0; z <= num; z++) { //draw each letter in the stack starting at the bottom and moving up
      randomChar(); //give each char in the stack a random Assignment
      fill(h, 255, 255, (255*(1-(z/num)))); //set color (transparency based on position in stack from front)
      text(c, x, y-(z*s));
    }
  }

  void updatePosition() {
    y += v; //increase y position of stack

    if (y >= height+(num*s)) { //if the front of the stack is lower than the bottom of the screen + height of the stack
      resetPosition(); 
    }
  }

  void randomPosition() {
    x = random(0, width); //random width position
  }

  void randomChar() {
    c = char(int(random(63, 95))); //generates random int and comverts to ASCII
  }

  void resetPosition() {
    x = random(0, width); //random width position
    y = 0; //reset y position to the top of the screen
  }
}


void mousePressed() { //press the mouse to pause/resume the program
  shouldDraw = !shouldDraw;
  if (shouldDraw == false) {
    noLoop(); //pause
  } else {
    loop(); //resume
  }
}
