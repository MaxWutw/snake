ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();

// int w = 72, h = 37, blocks = 20, direction = 2, speed = 8, fc1 = 255, fc2 = 255, fc3 = 255; 
int w = 72, h = 37, blocks = 20, direction = 2, speed = 8; 
int[]x_direction = {0, 0, 1, -1}, y_direction = {1, -1, 0, 0}; //direction for x and y

int blockMinY = 3;

// boolean gameover = false;
boolean first_show_question = true;

// int foodx = 15, foody = 15;
int q_num;

int[] foodX = {15, 30, 45, 60}, foodY = {20, 20, 20, 20};
int[] foodColorR = {255, 255, 0, 0}, foodColorG = {0, 255, 255, 0}, foodColorB = {0, 0, 0, 255};

void gameScreen() {
  if (isGameOver()) {
    screen = 4;
  }

  drawInfo();

  drawSnake();

  drawFood();

  if(frameCount % speed == 0){
    // println(y.get(0));
    // if(key == 'a'){
    //   for(int i = 0;i < x.size();i++) print(x.get(i) + " ");
    //   delay(10000);
    // }

    x.add(0, x.get(0) + x_direction[direction]); //make snake longer
    y.add(0, y.get(0) + y_direction[direction]);

    if (isFoodEaten()) { //new food if we touch
      updateSpeed();
      updateFood();
    }
    else { 
      x.remove(x.size() - 1);
      y.remove(y.size() - 1);
    }
  }
}

void drawInfo() {
  show_question(first_show_question);
  first_show_question = false;

  String scoreMessage = "Score: " + x.size();
  drawMessage(scoreMessage, blocks * blockMinY, blocks * blockMinY / 2, 25, 255);

  // Straight line
  stroke(255);
  strokeWeight(2);
  line(0, blocks * blockMinY, width, blocks * blockMinY);
}

void drawSnake() {
  for(int i = 0; i < x.size(); i++){
    if(i == 0) fill(255, 0, 0); // RED
    else fill(0, 255, 0); // GREEN

    stroke(255);
    strokeWeight(1.5);
    rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks);
  }
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

void reverse_snake(){
  Collections.reverse(x);
  Collections.reverse(y);
  //for (int i = 0; i < x.size(); i++){
  //  if(i == 0) fill(255, 0, 0); // RED
  //  else fill(0, 255, 0); // GREEN
  //  rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks);
  //}
  direction = (direction == 0 ? 1 : (direction == 1 ? 0 : (direction == 2 ? 3 : direction == 3 ? 2 : 0)));
}

void drawFood() {
  stroke(255);
  strokeWeight(1);

  for (int i = 0; i < 4; i++) {
    float currX = foodX[i] * blocks + blocks / 2;
    float currY = foodY[i] * blocks + blocks / 2;

    fill(foodColorR[i], foodColorG[i], foodColorB[i]);
    circle(currX, currY, 20);
  }
}

boolean isFoodEaten() {
  for (int i = 0; i < 4; i++) {
    if (x.get(0) == foodX[i] && y.get(0) == foodY[i]) {
      return true;
    }
  }

  return false;
}

void updateFood() {
  for (int i = 0; i < 4; i++) {
    int tempX = 0, tempY = 0;
    boolean isBadPosition = true;

    while (isBadPosition) {
      isBadPosition = false;
      tempX = (int) random(0, w);
      tempY = (int) random(blockMinY, h);

      int headX = x.get(0);
      int headY = y.get(0);

      // Prevent close spawn to head of snake
      if (headX - 2 <= tempX && tempX <= headX + 2 &&
          headY - 2 <= tempY && tempY <= headY + 2) {
        isBadPosition = true;
        continue;
      }

      // Prevent duplicate food position
      for (int j = 0; j < i; j++) {
        if (tempX == foodX[j] && tempY == foodY[j]) {
          isBadPosition = true;
          break;
        }
      }
    }

    foodX[i] = tempX;
    foodY[i] = tempY;
  }
}

void updateSpeed() {
  if(x.size() % 5 == 0 && speed >= 2) {
    speed -= 1;  // every 5 points speed increase
  }
}

void resetGame() {
  x.clear();
  y.clear();

  x.add(0);
  y.add(15);

  foodX[0] = 15;
  foodX[1] = 30;
  foodX[2] = 45;
  foodX[3] = 60;

  foodY[0] = 20;
  foodY[1] = 20;
  foodY[2] = 20;
  foodY[3] = 20;

  //init_arraylist_for_debug(5);

  direction = 2;
  speed = 8;

  drawGameOverOnce = true;
}
