class Obstacles {
  ArrayList<Obstacle> obs;
  
  Obstacles() {
    obs = new ArrayList<Obstacle>();
  }
  
  void add(Obstacle o) {
    obs.add(o);
  }
  
  void show() {
    for (Obstacle o : obs) {
      o.show();
    }
  }
  
  boolean checkCollisions(Dot d) {
    for (Obstacle o : obs) {
      if (o.checkCollision(d)) {
        return true;
      }
    }
    return false;
  }
  
  void refreshAll() {
    for (Obstacle o : obs) {
      o.refresh();
    }
  }
  
}
