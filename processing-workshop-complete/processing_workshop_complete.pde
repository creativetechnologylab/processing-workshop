// The Ant class encapsulates the properties and behaviors of an ant.
class Ant {
  
  float x, y;
  float size;
  color bodyColor;


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
    bodyColor = color(91, 197, 255);
  }

  // move method: Defines the logic to update the ant's position
  void move() {
    float choice = random(1);

    if (choice < 0.5) {
      x+= random(-3, 3);
    } else {
      y+= random(-3, 3);
    }
    
    /*
    the choice < 0.5 gives "TRUE" 50% of the time
    because 0.5 == 50%
    we can manipulate the direction of the ant by changing this value 
    if choice < 0.9 for example means the ant has a 90% chance of moving left or right
    and only 10% chance of moving up or down. 
    */
  
    if(x>width) x = 0;
    if(y>height) y = 0;
    if(y<0) y = height;
    if(x<0) x = width;
    
    /*
    the conditional statements above keep the ants within the boarder of the canvas.
    if the ant goes to far right, over the width or height (x > 400, y > 400) then we reset the ant to the other end.
    like wise, if the ant goes to far left, behind the width or height (x < 0, y < 0), then we wrap it around to the other end. 
    
    */
    
  }

  // display method: Defines how the ant should be drawn on the canvas
  void display() {
    fill(bodyColor);
    circle(x, y, size);
  }
}


// -- all global variabls -- //

Ant randy;
Ant [] antHill;
float xPosition, yPosition;

// --------------------------//


// setup function: Runs once at the start, used to set initial environment properties
void setup() {
  size(600, 600);
  background(127,197,255);
  xPosition = width /2;
  yPosition = height/2;
  randy = new Ant(xPosition, yPosition);
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
  randy.display();
  randy.move();
}

// mousePressed function: Called once after every time the mouse is pressed
void mousePressed() {
  for (Ant ants : antHill) {
    float r = random(191, 255);
    float g = random(127, 255);
    float b = random(127, 255);
    float size = random(5, 20);
    ants.bodyColor = color(r, g, b);
    ants.size = size;
  }
  
  /*
  challenge : change this "for loop" into the other "for loop".
  the advantage of the other for loop would be in saying you only
  want to affect certain ants with a certain color range
  i.e. antHill[0] to antHill[3] could all be red and antHill[4] could be blue, 
  and antHill[5] to antHill[9] could be green. 
  */
}

// keyPressed function: Called once after a key on the keyboard is pressed
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame();
    exit();
  }
}
