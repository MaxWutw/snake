ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();

int w = 72, h = 37, blocks = 20;

/**
 * Definition of direction
 * 0: Down
 * 1: Up
 * 2: Right
 * 3: Left
 */
int direction = 0;
int[]x_direction = {0, 0, 1, -1}, y_direction = {1, -1, 0, 0}; //direction for x and y

int blockMinY = 7;

float speed = 10, dSpeed = 0.5;
float counter = 0, maxCounter = 100;

int score = 0;
int correct   = 0, correctCheck   = 10;
int incorrect = 0, incorrectCheck = 3;

float infoSize  = 24;
color infoColor = 255;

float scoreInfoX = blocks * 2;
float scoreInfoY = blocks + blocks * (blockMinY - 1) / 3;

float speedInfoX = blocks * 2;
float speedInfoY = blocks + blocks * (blockMinY - 1) / 3 * 2;

float comboInfoX = blocks * 12;
float comboInfoY = blocks + blocks * (blockMinY - 1) / 3;

float bonusInfoX = blocks * 12;
float bonusInfoY = blocks + blocks * (blockMinY - 1) / 3 * 2;

void gameScreen() {
  drawInfo();
  drawSnake();
  drawFood();
  drawObstacles();

  if (isGameOver()) {
    screen = 4;
  }

  counter += speed;
  if (counter < maxCounter) {
    return;
  }

  increaseSnakeLength();

  int check = checkEatenFood();
  if (check != -1) {
    int boost = (isPointBoosted() ? 2 : 1);

    if (isCorrectAnswer(check)) {
      score += 3 * (correct / 5 + 1) * boost;
      speed += dSpeed * boost;

      correct++;
      incorrect = 0;
    } else {
      // Add length if the answer is incorrect
      increaseSnakeLength();

      score -= 1 * (incorrect / 3 + 1) * boost;
      speed += dSpeed * 2 * boost;

      incorrect++;
      correct = 0;

      if ((incorrect % incorrectCheck == 0) && enableAdvertise()) {
        screen = 5;
      }
    }

    updateQuestion();
    updateFood();
    updateObstacles();
  }
  else {
    decreaseSnakeLength();
  }

  counter -= maxCounter;
}

void drawInfo() {
  drawQuestion();
  drawSkillPanel();
  drawCombo();

  String scoreInfo = "Score: " + score;
  String speedInfo = "Speed: " + String.format("%.1f", speed);

  drawInfo(scoreInfo, scoreInfoX, scoreInfoY, infoSize, infoColor);
  drawInfo(speedInfo, speedInfoX, speedInfoY, infoSize, infoColor);

  // Straight line
  stroke(255);
  strokeWeight(2);
  line(0, blocks * blockMinY, width, blocks * blockMinY);
}

void drawCombo() {
  int boost = (isPointBoosted() ? 2 : 1);

  if (incorrect > 0) {
    String comboInfo = "Combo × " + incorrect * boost;
    String bonusInfo = "Score × " + -(incorrect / 5 + 1) * boost;

    drawInfo(comboInfo, comboInfoX, comboInfoY, infoSize, #ff0000);
    drawInfo(bonusInfo, bonusInfoX, bonusInfoY, infoSize, #ff0000);
  }

  if (correct > 0) {
    String comboInfo = "Combo × " + correct * boost;
    String bonusInfo = "Score × " + (correct / 5 + 1) * boost;

    color comboInfoColor = 0;

    if (correct >= correctCheck) {
      comboInfoColor = rgbColor(1);
    } else {
      comboInfoColor = #00ff00;
    }

    drawInfo(comboInfo, comboInfoX, comboInfoY, infoSize, comboInfoColor);
    drawInfo(bonusInfo, bonusInfoX, bonusInfoY, infoSize, comboInfoColor);
  }
}

color rgbColor(int index) {
  float ang  = TWO_PI * (float(index) - float((millis() / 120))) / 24.0;
  float rsin = sin(1.0 * ang / 1.0 + int(TWO_PI / 1.0));
  float gsin = sin(2.0 * ang / 3.0 + int(TWO_PI / 3.0));
  float bsin = sin(4.0 * ang / 5.0 + int(TWO_PI / 6.0));

  rsin = int(map(rsin, -1.0, 1.0, 64, 255));
  gsin = int(map(gsin, -1.0, 1.0, 64, 255));
  bsin = int(map(bsin, -1.0, 1.0, 64, 255));

  return color(rsin, gsin, bsin);
}

void initSnake() {
  x.clear();
  y.clear();

  x.add(36);
  y.add(blockMinY);

  direction = 0;
}

void drawSnake() {
  for (int i = x.size() - 1; i >= 0; i--) {
    if (i == 0) {
      // White head
      fill(#ffffff);
    } else if (correct >= correctCheck) {
      // RGB body
      fill(rgbColor(i));
    } else {
      // Green body
      fill(#00ff00);
    }

    noStroke();
    rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks);
  }
}

void increaseSnakeLength() {
  x.add(0, x.get(0) + x_direction[direction]);
  y.add(0, y.get(0) + y_direction[direction]);
}

void decreaseSnakeLength() {
  x.remove(x.size() - 1);
  y.remove(y.size() - 1);
}

int newDirection() {
  if (keyCode == DOWN && (direction != 1 || x.size() == 1)) {
    return 0;
  } else if (keyCode == UP && (direction != 0 || x.size() == 1)) {
    return 1;
  } else if (keyCode == RIGHT && (direction != 3 || x.size() == 1)) {
    return 2;
  } else if (keyCode == LEFT && (direction != 2 || x.size() == 1)) {
    return 3;
  }

  return -1;
}

void resetGame() {
  initSnake();

  resetFoodPositions();

  clearObstacles();

  //init_arraylist_for_debug(5);

  speed = 10;

  score = 0;
  correct   = 0;
  incorrect = 0;

  resetCooldown();

  drawGameOverOnce = true;
}
