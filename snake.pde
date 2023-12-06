import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

PFont TCfont;
PImage img;

int screenWidth = 1440;
int screenHeight = 740;

/**
 * Definiton of Screen ID
 * 0: Home screen
 * 1: Game screen
 * 2: Help screen
 * 3: About us screen
 * 4: Game over screen
 */
int screen = 0;

void setup() {
  size(1440, 740);

  x.add(0); //snake start position
  y.add(15);

  img = loadImage("image/apple.png");
  TCfont = createFont("./Noto_Sans_TC/static/NotoSansTC-Black.ttf", 28);

  textFont(TCfont);
  //videoSetup();
  initQuestion();

  videoSetup();

  //init_arraylist_for_debug(5);
}

void draw() {
  setCursor();

  skillCooldownTimer();

  if (screen != 4) {
    background(0);
  }
  
  //image(mov, 0, 0, width, height);
  //delay((int)(mov.duration() * 1000));
  //frameRate(60);
  switch (screen) {
    case 1:
      gameScreen();
      break;
    case 2:
      helpScreen();
      break;
    case 3:
      aboutUsScreen();
      break;
    case 4:
      gameOverScreen();
      break;
    case 5:
      videoScreen();
      break;
    case 0:
    default:
      homeScreen();
  }
}
