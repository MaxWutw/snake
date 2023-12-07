ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();

int w = 72, h = 37, blocks = 20;

/**
 * Definition of direction
 * 0: Down
 * 1: Up
 * 2: Right
 * 3: Left
 */
int direction = 2;
int[]x_direction = {0, 0, 1, -1}, y_direction = {1, -1, 0, 0}; //direction for x and y

int blockMinY = 7;

float speed = 10, dSpeed = 0.4;
float counter = 0, maxCounter = 100;

int score = 0;

int[][] foodPos = {
  {15, 20},
  {30, 20},
  {45, 20},
  {60, 20}
};
int[][] foodColor = {
  {255, 0, 0},    // Red
  {255, 255, 0},  // Yellow
  {0, 255, 0},    // Green
  {0, 0, 255}     // Blue
};

void gameScreen() {
  drawInfo();
  drawSnake();
  drawFood();

  counter += speed;
  if (isGameOver()) {
    screen = 4;
  }

  if (counter >= maxCounter) {
    // println(y.get(0));
    // if(key == 'a'){
    //   for(int i = 0;i < x.size();i++) print(x.get(i) + " ");
    //   delay(10000);
    // }

    increaseSnakeLength();

    int check = checkEatenFood();
    if (check != -1) {
      // Add length if the answer is incorrect
      if (addScore(check) == 0) {
        increaseSnakeLength();
        screen = 5;
      }

      score += addScore(check);

      updateQuestion();
      updateSpeed(check);
      updateFood();
    }
    else {
      decreaseSnakeLength();
    }

    counter -= maxCounter;
  }
}

void drawInfo() {
  drawQuestion();

  drawSkillPanel();

  String scoreMessage = "Score: " + score;
  drawMessage(scoreMessage, blocks * 4, blocks * blockMinY / 2, 25, 255);

  String speedMessage = "Speed: " + String.format("%.1f", speed);
  drawMessage(speedMessage, blocks * 14, blocks * blockMinY / 2, 25, 255);

  // Straight line
  stroke(255);
  strokeWeight(2);
  line(0, blocks * blockMinY, width, blocks * blockMinY);
}

void drawSnake() {
  for (int i = x.size() - 1; i >= 0; i--) {
    if (i == 0) fill(255, 0, 0); // RED
    else fill(0, 255, 0); // GREEN

    stroke(255);
    strokeWeight(1.5);
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

void updateSpeed(int option) {
  if (isCorrectAnswer(option)) {
    speed += dSpeed;
  }

  speed += dSpeed * 2;
}

int addScore(int option) {
  if (isCorrectAnswer(option)) {
    return 3;
  }

  return 0;
}

void resetGame() {
  x.clear();
  y.clear();

  x.add(0);
  y.add(15);

  foodPos[0][0] = 15;
  foodPos[1][0] = 30;
  foodPos[2][0] = 45;
  foodPos[3][0] = 60;

  foodPos[0][1] = 20;
  foodPos[1][1] = 20;
  foodPos[2][1] = 20;
  foodPos[3][1] = 20;

  //init_arraylist_for_debug(5);

  direction = 2;
  speed = 10;

  score = 0;

  resetCooldown();

  drawGameOverOnce = true;
}
