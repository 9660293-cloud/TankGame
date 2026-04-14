class Tank {
  int x, y, w, h, speed, health;
  PImage t1;

  // Constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 15;
    health = 100;
    t1 = loadImage("tank.png");
  }

  void display() {
    imageMode(CENTER);
    image(t1, x, y);
  }

  void move() {
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


    if (key == 'w' || key == 'W') {
      y = y - speed;
    } else if (key == 's' || key == 'S') {
      y = y + speed;
    } else if (key == 'a' || key == 'A') {
      x = x - speed;
    } else if (key == 'd' || key == 'D') {
      x = x + speed;
    }
  }
}
