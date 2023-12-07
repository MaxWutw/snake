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

void drawFood() {
  stroke(255);
  strokeWeight(1);

  for (int i = 0; i < 4; i++) {
    float currX = foodPos[i][0] * blocks + blocks / 2;
    float currY = foodPos[i][1] * blocks + blocks / 2;

    fill(foodColor[i][0], foodColor[i][1], foodColor[i][2]);
    circle(currX, currY, 20);
  }
}

/**
 * Check if the food is eaten.
 * @return index of eaten food, -1 if none is eaten.
 */
int checkEatenFood() {
  for (int i = 0; i < 4; i++) {
    if (x.get(0) == foodPos[i][0] && y.get(0) == foodPos[i][1]) {
      return i;
    }
  }

  return -1;
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
        if (tempX == foodPos[j][0] && tempY == foodPos[j][1]) {
          isBadPosition = true;
          break;
        }
      }
    }

    foodPos[i][0] = tempX;
    foodPos[i][1] = tempY;
  }
}

void resetFoodPositions() {
  foodPos[0][0] = 15;
  foodPos[1][0] = 30;
  foodPos[2][0] = 45;
  foodPos[3][0] = 60;

  foodPos[0][1] = 20;
  foodPos[1][1] = 20;
  foodPos[2][1] = 20;
  foodPos[3][1] = 20;
}
