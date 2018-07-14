class Obstacle {
  int posx, posy, lx, ly, dx, dy, dirx, diry;
  boolean movx, movy;
  
  Obstacle(int posx, int posy, int lx, int ly) {
    this.posx = posx;
    this.posy = posy;
    this.lx = lx;
    this.ly = ly;
    this.movx = false;
    this.movy = false;
    this.dirx = 0;
    this.diry = 0;
  }
  
  Obstacle(int posx, int posy, int lx, int ly, boolean movx, boolean movy, int speedx, int speedy) {
    this.posx = posx;
    this.posy = posy;
    this.lx = lx;
    this.ly = ly;
    this.movx = movx;
    this.movy = movy;
    this.dirx = speedx;
    this.diry = speedy;
  }
  
  void show() {
    rect(posx+dx, posy+dy, lx, ly);
    if (posx+dx < 0 || posx+lx+dx > width) {
      dirx *= -1;
    }
    if (posy+dy < 0 ||posy+ly+dy > width) {
      diry *= -1;
    }
    
    if (movx) {
      dx+=dirx;
    }
    if (movy) {
      dy+=diry;
    }
  }
  
  boolean checkCollision(Dot d) {
    if (d.pos.x > posx+dx && d.pos.x < posx+lx+dx && d.pos.y > posy+dy && d.pos.y < posy+ly+dy) {
      return true;
    }
    return false;
    
  }
  void refresh(){
    dx = 0;
    dy = 0;
  }
  
}
