// Ole Leimbach | Apr 14 2026 | TankGame
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  //obstacles.add(new Obstacle(250, 100));
  //obstacles.add(new Obstacle(50, 450));
  //obstacles.add(new Obstacle(350, 275));
  score = 0;
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}


void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  // Add Timer to distribute obstacles
  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height))));
    objTimer.start();
    // Restart Timer
    objTimer.start();
  }
  // Add Timer to distribute powerups
  if (puTimer.isFinished()) {
    // Add powerup
    powerups.add(new PowerUp(int(random(width)), -100));
    puTimer.start();
    // Restart Timer
    puTimer.start();
  }

  // Display and remove powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(i);
    }
    if (pu.intersect(tank1)) {
      if (pu.type == 'h') {
        tank1.health = tank1.health + 15;
        powerups.remove(i);
      } else if (pu.type == 'a') {
        tank1.laserCount = tank1.laserCount + 13;
        powerups.remove(i);
      } else if (pu.type == 't') {
        tank1.turretCount = tank1.turretCount + 13;
        powerups.remove(i);
      }
    }
    continue;
  }
  //obstacles.add(new Obstacle(350, 250));

  // Displaying and removes obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
    // detect collision to tank
    if (tank1.intersect(o)) {
      //impact to change score, health, and obstacle (remove it)
      tank1.health = tank1.health - 10;
      obstacles.remove(i);
    }
  }
  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        projectiles.remove(i);
        obstacles.remove(j);
        score = score + 15;
        continue;
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  tank1.display();

  scorePanel();
  println("Objects in Memory:"+obstacles.size());
  println("Projectiles in Memory:"+projectiles.size());
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
}


void scorePanel() {
  fill(#FF0D00, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 48);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, 49, 35);
  text("Health:" + tank1.health, width/2, 35);
  text("Ammo:" + tank1.laserCount, width/2 + 150, 35);
}

void keyPressed() {
  if (key == 'w') {
    tank1.move('w');
  } else if (key == 's') {
    tank1.move('s');
  } else if (key == 'd') {
    tank1.move('d');
  } else if (key == 'a') {
    tank1.move('a');
  }
}

void mousePressed() {
  if (tank1.turretCount == 1) {
    projectiles.add(new Projectile(tank1.x, tank1.y));
  } else if (tank1.turretCount == 1) {
    projectiles.add(new Projectile(tank1.x, tank1.y));
    projectiles.add(new Projectile(tank1.x, tank1.y));
  } else {
    projectiles.add(new Projectile(tank1.x, tank1.y));
    projectiles.add(new Projectile(tank1.x, tank1.y));
    projectiles.add(new Projectile(tank1.x, tank1.y));
    projectiles.add(new Projectile(tank1.x, tank1.y));
  }
  //projectiles.add(new Projectile(tank1.x, tank1.y));
}
