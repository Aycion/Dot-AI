class Buttons {
 ArrayList<Button> obs; 
 
  
  Buttons() {
    obs = new ArrayList<Button>();
  }
  
  
  void add(Button b) {
    obs.add(b);
  }
  
  
  void show() {
    for (Button b : obs) {
      b.show();
    }
  }
  
  
  Button checkMouseOver() {
    for (Button b : obs) {
      if (b.isMouseOver()) {
        return b;
      }
    }
    return null;
  }
}
