class Population {
  Dot[] dots;
  float fitnessSum;
  int gen = 1;
  int bestDot = 0;
  int minStep = 400;

  Population(int size) {
    dots = new Dot[size]; 
    for (int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }

  //---------------------------------------------------------------
  void show() {
    for (int i = 1; i < dots.length; i++) {
      dots[i].show();
    }
    dots[0].show();
  }

  //---------------------------------------------------------------
  void update() {
    for (Dot d : dots) {
      if (d.brain.step > minStep) {
        d.dead = true;
      } else {
        d.update();
      }
    }
  }

  void calculateFitness() {
    for (Dot d : dots) {
      d.calculateFitness();
    }
  }

  //-----------------------------------------------------------------
  boolean allDotsDead() {
    for (Dot d : dots) {
      if (!(d.dead || d.reachedGoal)) {
        return false;
      }
    }
    return true;
  }


  //---------------------------------------------------------------
  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    calculateFitnessSum();
    
    newDots[0] = dots[bestDot].getABeb();
    newDots[0].isBest = true;

    for (int i = 1; i < newDots.length; i++) {
      //select parent based on fitness
      Dot parent = selectParent();

      //get baby from them
      newDots[i] = parent.getABeb();
    }
    
    dots = newDots.clone();
    gen++;
  }

  //----------------------------------------------------------------
  void calculateFitnessSum() {
    fitnessSum = 0;
    for (Dot d : dots) {
      fitnessSum+=d.fitness;
    }
  }
  
  //----------------------------------------------------------------
  Dot selectParent() {
    float rand = random(fitnessSum);

    float runningSum = 0;

    for (Dot d : dots) {
      runningSum += d.fitness;
      if (runningSum > rand) {
        return d;
      }
    }

    //shouldn't get here
    return null;
  }
  
  //-----------------------------------------------------------------
  void mutateChildren() {
    for(int i = 1; i < dots.length; i++) {
      dots[i].brain.mutate();
    }
  }
  
  //------------------------------------------------------------------
  void setBestDot() {
    //make the best dot immortal
    float max = 0;
    int maxIndex = 0;
    for(int i = 0; i < dots.length; i++) {
      if (dots[i].fitness > max) {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDot = maxIndex;
    
    if(dots[bestDot].reachedGoal) {
      minStep = dots[bestDot].brain.step;
      println("Step: ", minStep);
    }
  }
}
