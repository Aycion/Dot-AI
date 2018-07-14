import g4p_controls.*;

Population test;
PVector goal = new PVector(400, 10);
Button start, pause, reset;
Obstacles obstacles;
Buttons buttons;

final int stateWait = 0;
final int stateRun = 1;
final int statePause = 2;
int state = stateWait;
int startx = width/2, starty = height/2, startWidth = 65, startHeight = 15;
int currentBest;

/******************** TO-DO ******************
 * 
 *
 *
 */

void setup() {
  
  buttons = new Buttons();
  obstacles = new Obstacles();
  
  size(700,700);
  test = new Population(1000);
  
  // instantiate the button and specify that the click action will be to begin the simulation.
  start = new Button(width/2, height/2, 100, 30, 120, 120, 120, true, 26, "Click to Start!"){
    public void pressAction() {
      state = stateRun;
      this.shown = false;
      pause.shown = true;
      reset.shown = true;
    }
  };
  
  pause = new Button(width-50, height-50, 40, 40, 120, 120, 120, false, 20, "Pause") {
    public void pressAction() {
      if (state == stateRun) {
        state = statePause;
      } else {
        state = stateRun;
      }
      
    }
  };
  
  reset = new Button(width-140, height-50, 40, 40, 120, 120, 120, false, 20, "Reset") {
    public void pressAction() {
      reset();
    }
  };
  
  // add all buttons to the collection of buttons
  buttons.add(start);
  buttons.add(pause);
  buttons.add(reset);
  
  obstacles.add(new Obstacle(0,200,437,10));
  obstacles.add(new Obstacle(263,500,437,10));
  obstacles.add(new Obstacle(263,360,10,140));
  obstacles.add(new Obstacle(427,210,10,140));
}

//Called every frame, so every frame we want to move the dot and then show the dot
void draw() {
  if (state == stateWait) {
    
    background(220);
    buttons.show();
  } else {
    
    background(255);
    textSize(26);
    
    // Display text
    fill(0,0,0);
    text("Gen "+test.gen, 10, 26);
    textSize(20);
    text("Current Best:\n  " + test.minStep + " steps", width-150, 26);
    
    // Display goal
    fill(255,0,0);
    ellipse(goal.x, goal.y, 10, 10);
    
    // Display buttons
    buttons.show();
    
    // Display obstacles
    fill(255,0,0);
    obstacles.show();
    
    
    
    
    if(test.allDotsDead()) {
      
      //genetic algorithm
      test.calculateFitness();
      test.naturalSelection();
      test.mutateChildren();
      obstacles.refreshAll();
      
    } else {
      // If the state is pause, the dots will not update, staying in the same place while still being drawn
      if (state == stateRun) {
        test.update();
      }
      test.show();
    }
  }
}

void reset() {
  test = new Population(1000);
}

void mousePressed() {
  Button pressed;
  pressed = buttons.checkMouseOver();
  if (pressed != null) {
    pressed.pressAction();
  }
}
