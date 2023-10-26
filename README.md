
## Ant Simulation in Processing: README

### Introduction

This repository contains a simple ant simulation sketch written in Processing. This is a great beginner-level example to understand generative design, object-oriented programming (OOP) paradigms, animation basics, and event-driven programming.

### How to Use

1. Install Processing from [Processing.org](https://processing.org/)
2. Clone this repository or download the `.pde` file
3. Open the `.pde` file in the Processing editor and click the "Run" button.

### Structure Explanation

#### Class Definitions

The `Ant` class is an example of OOP. It allows us to encapsulate the properties (`x, y, size, c`) and behaviors (`move()`, `display()`) of an ant. 

```java
class Ant {
  float x, y;
  float size;
  color c;
  //...
}
```

#### Initialization and Constructors

The `Ant` class constructor (`Ant(float inputX, float inputY)`) initializes the ant at a given `x, y` coordinate. This makes it flexible to place ants at different initial positions.

#### Movement and Display Methods

The `move()` and `display()` methods define the ant's behavior. `move()` updates the ant's position, and `display()` shows it on the canvas.

#### Arrays for Multiple Ants

Using an array of `Ant` objects (`antHill`) is idiomatic to Processing and animation languages to manage multiple instances easily.

#### Event-Driven Programming

The `mousePressed()` and `keyPressed()` functions react to user input, changing ant properties or saving frames respectively.
