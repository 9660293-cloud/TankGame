class PowerUp {
  int x, y, w, h, speed;
  char type;
  //PImage obst1;
  //char idir;

  // Constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    w = 100;
    h = 100;
    speed = 4;
    if (int(random(4)) ==  2) {
      type = 'h'; // H is for health
    } else if (int(random(2)) ==  1) {
      type = 't'; // T is for Turret
    } else {
      type = 'a'; // A is for ammo
    }
  }

  void display() {
    if (type == 'a') {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Ammo", x, y);
    } else if (type == 'h') {
      fill(0, 200, 0);
      fill(#550808);
      text("Health", x, y);
      ellipse(x, y, w, h);
    } else {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(#2453B4);
      text("Turret", x, y);
    }
  }

  void move() {
    y = y + speed;
  }

  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedEdge() {

    // Logic for when to return true

    return x >= width+150 || x <= -150 || y > height +150 || y < -150;
  }
}
