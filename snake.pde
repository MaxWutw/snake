import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

PFont TCfont;
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w = 72, h = 37, blocks = 20, direction = 2, speed = 8, fc1 = 255, fc2 = 255, fc3 = 255; 
int[]x_direction = {0, 0, 1, -1}, y_direction = {1, -1, 0, 0}; //direction for x and y
boolean gameover = false;
PImage img;
JSONArray questions;
boolean first_show_question = true;
int foodx = 15, foody = 15;
int q_num;
//int foodx[] = new int[5], foody[] = new int[5];

int screenWidth = 1440;
int screenHeight = 750;

/**
 * Definiton of Screen ID
 * 0: Home screen
 * 1: Game screen
 * 2: Help screen
 * 3: About us screen
 */
int screen = 0;

void setup() { 
  size(1440, 750); 
  x.add(0); //snake start position
  y.add(15);
  img = loadImage("image/apple.png");
  TCfont = createFont("./Noto_Sans_TC/static/NotoSansTC-Black.ttf", 28);
  questions = loadJSONArray("data/questions.json");
  //init_arraylist_for_debug(5);
}

void draw() {
  background(0);
  setCursor();

  switch (screen) {
    case 1:
      startGame();
      break;
    case 2:
      helpScreen();
      break;
    case 0:
    default:
      homeScreen();
  }
  // startGame();
  // homeScreen();
}
