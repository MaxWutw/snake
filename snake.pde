import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

PFont TCfont;
PImage img;
JSONArray questions;

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

  questions = loadJSONArray("data/questions.json");
  //init_arraylist_for_debug(5);
}

void draw() {
  background(0);
  setCursor();

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
    case 0:
    default:
      homeScreen();
  }
}
