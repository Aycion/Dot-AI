abstract class Button {
  
  int posx, posy, sx, sy, r, g, b, fontSize;
  String text;
  boolean hover = false;
  
  // shown will be used to determine if the button should be drawn
  boolean shown;
  
  Button(int posx, int posy, int sx, int sy, int r, int g, int b, boolean shown, int fontSize, String text) {
    this.posx = posx;
    this.posy = posy;
    this.sx = sx;
    this.sy = sy;
    this.r = r;
    this.g = g;
    this.b = b;
    this.fontSize = fontSize;
    this.text = text;
    this.shown = shown;
  }
  
  Button(int posx, int posy, int sx, int sy, int r, int g, int b, boolean shown) {
    this.posx = posx;
    this.posy = posy;
    this.sx = sx;
    this.sy = sy;
    this.r = r;
    this.g = g;
    this.b = b;
    this.shown = shown;
  }
  
  
  void show() {
    if (shown) {
      textSize(fontSize);
      rectMode(RADIUS);
      textAlign(CENTER);
      strokeWeight(3);
      fill(r,g,b);
      if (mouseX > posx-sx && mouseX < posx+sx && mouseY > posy-sy && mouseY < posy+sy) {
        hover = true;
        stroke(0);
      } else {
        stroke(r,g,b);
        hover = false;
      }
      rect(posx,posy,sx,sy);
      fill(255);
      text(text,posx,posy+(fontSize/2));
      stroke(0);
      strokeWeight(1);
      rectMode(CORNER);
      textAlign(LEFT);
    }
  }
  
  void isVisible(boolean visible) {
    this.shown = visible;
  }
  
  boolean isMouseOver() {
    // button can only be clicked if the mouse is over it and the button is visible
    return hover && shown;
  }
  
  abstract void pressAction();
}
