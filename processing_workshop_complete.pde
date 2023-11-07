// The Ant class encapsulates the properties and behaviors of an ant.
class Ant {
  
  float x, y;
  float size;
  color antColor;


  /*
  This is a helpful analogy to describe the relationship between class member variables (above) and constructor
  arguments (below). 

  The constructor arguments inputX and inputY are the short term memory of the ant and it is passed to the long term memory
  x and y in the class. The class is like the brain of the ant that defines how it should move and what colour it 
  should have. Depending on different inputs to the body, the brain responds in different ways. We may change direction
  or colour, for example. To modify our behaviour we have to pass the events that happen in short term memory
  by storing it in long term memory. This is what we do when we say the x = inputX. We say the short-term
  memory inputX is stored in the long-term memory x. 

  This only helps define the RELATIONSHIP beween class member variables (x) and constructor arguments (inputX).
  The PURPOSE of constructor arguments is to create new ants from a template but with a little individuality.
  Anything which is not an input variable is given to each ant , exactly the same. 
  For example, every ant , when it is created, will be made with the same size (10) and color(91,197,255).

  An excercise would be to consider: 
  a) how could we generatively set the ant size and color using random
  b) how could we create some inputs for colour and size to define the ant at construction. 
 

  */


  // Constructor: Initializes ant properties such as position and color
  Ant(float inputX, float inputY) {
    x = inputX;
    y = inputY;
    size = 10;
    antColor = color(91, 197, 255);
  }

  // move method: Defines the logic to update the ant's position
  void move() {
    float choice = random();

    if (choice > 0.5) {
      x+= random(-3, 3);
    } else {
      y+= random(-3, 3);
    }
  }

  // display method: Defines how the ant should be drawn on the canvas
  void display() {
    fill(antColor);
    circle(x, y, size);
  }
}


// -- all global variabls -- //

Ant oneAnt;
Ant [] antHill;
float xPosition, yPosition;

// --------------------------//


// setup function: Runs once at the start, used to set initial environment properties
void setup() {
  size(600, 600);
  background(127,197,255);
  xPosition = width /2;
  yPosition = height/2;
  oneAnt = new Ant(xPosition, yPosition);
  antHill = new Ant[10];

  for (int i = 0; i < antHill.length; i++) {
    antHill[i] = new Ant(xPosition, yPosition);
  }
}

// draw function: Runs continuously after setup, used for animation and continuously updating the canvas
void draw() {

  for (Ant ants : antHill) {
    ants.display();
    ants.move();
  }
  oneAnt.display();
  oneAnt.move();
}

// mousePressed function: Called once after every time the mouse is pressed
void mousePressed() {
  for (Ant ants : antHill) {
    float r = random(191, 255);
    float g = random(127, 255);
    float b = random(127, 255);
    float size = random(5, 20);
    ants.c = color(r, g, b);
    ants.size = size;
  }
}

// keyPressed function: Called once after a key on the keyboard is pressed
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame();
    exit();
  }
}
