# Ant Simulation in Processing

## Introduction

This repository contains a simple ant simulation sketch written in Processing. It serves as an educational example for teaching generative design, object-oriented programming (OOP), animation basics, and event-driven programming. 

## How to Use

1. Install Processing from [Processing.org](https://processing.org/)
2. Clone this repository or download the `.pde` file.
3. Open the `.pde` file in the Processing editor and click the "Run" button.

## In-Depth Structure Explanation

### Class Definitions and Object-Oriented Programming (OOP)

The `Ant` class demonstrates OOP by encapsulating the properties and behaviors of an ant.

```java
class Ant {
  float x, y;
  float size;
  color c;
  //...
}
```

### Initialization and Constructors

The `Ant` class constructor allows for flexibility in setting the initial `x` and `y` positions for each ant object.

### Movement and Behavior

The `move()` method uses `random()` and `if` statements to give ants a random direction of movement.

```java
void move() {
  int choice = int(random(2));
  if (choice == 0) {
    x += random(-3, 3);
  } else {
    y += random(-3, 3);
  }
  //...
}
```

### Displaying Ants

The `display()` method uses the Processing `fill` and `circle` functions to display each ant object on the screen.

### Loops

- `for (int i = 0; i<10; i+=1)`: Demonstrates a standard for-loop to initialize multiple ant objects.
- `for (Ant ants : antHill)`: Demonstrates a for-each loop to iterate over each ant object for moving and displaying.
- `antHill.length`: a more effecient way of getting the size of an array

### Data Structures

The code utilizes an array (`antHill`) to manage multiple ant instances efficiently.

### Randomness

The `random()` function is extensively used for varying ant movements, sizes, and colors.

### Event-Driven Programming

- `mousePressed()`: Changes ant colors and sizes based on user mouse clicks.
- `keyPressed()`: Saves the current frame when the 'S' key is pressed.

```java
void mousePressed() {
  // ...
  float r = random(128, 255);
  // ...
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame();
    exit();
  }
}
```
