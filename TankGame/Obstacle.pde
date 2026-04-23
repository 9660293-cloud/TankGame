class Obstacle {
  int x, y, w, h, speed, health;
  PImage obst1;

  // Constructor
  Obstacle(int x, int y) {
    this.x=x;
    this.y=y;
    w = 50;
    h = 50;
    speed = 5;
    health = 50;
    obst1 = loadImage("Snek.png");
  }

  void display() {
    imageMode(CENTER);
    image(obst1, x, y);
  }

  void move() {
    x = x + speed;
    if (y<0) {
      y = height;
    }
    if (y>height) {
      y = 0;
    }
    if (x<0) {
      x = height;
    }
    if (x>height) {
      x = 0;
    }
  }
}
