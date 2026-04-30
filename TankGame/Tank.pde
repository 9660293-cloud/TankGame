class Tank {
  int x, y, w, h, speed, health;
  PImage iTankf, iTankl, iTankr, iTankd;
  char idir;
  int turretCount, laserCount;

  // Constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 15;
    health = 100;
    iTankf = loadImage("tankf.png");
    iTankl = loadImage("tankl.png");
    iTankr = loadImage("tankr.png");
    iTankd = loadImage("tankd.png");
    idir = 'w';
    turretCount = 1;
    laserCount = 44;
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankf, x, y);
    } else if (idir == 'a') {
      image(iTankl, x, y);
    } else if (idir == 's') {
      image(iTankd, x, y);
    } else if (idir == 'd') {
      image(iTankr, x, y);
    }
    if (health < 0) {
      gameOver();
    }
  }

  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 's') {
      idir = 's';
      y = y + speed;
    } else if (dir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (dir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }

  void fire() {
  }

  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }
}
