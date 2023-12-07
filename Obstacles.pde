ArrayList<Integer> obstaclesX = new ArrayList<Integer>();
ArrayList<Integer> obstaclesY = new ArrayList<Integer>();

void drawObstacles() {
  if (isObstaclesPurified()) {
    hideObstacles();
    return;
  }

  noStroke();
  fill(#cccccc);

  for (int i = 0; i < obstaclesX.size(); i++) {
    float currX = obstaclesX.get(i) * blocks;
    float currY = obstaclesY.get(i) * blocks;

    rect(currX, currY, blocks, blocks);
  }
}

boolean isObstableHit() {
  for (int i = 0; i < obstaclesX.size(); i++) {
    if (x.get(0) == obstaclesX.get(i) && y.get(0) == obstaclesY.get(i)) {
      return true;
    }
  }

  return false;
}

void updateObstacles() {
  while (x.size() / 10 > obstaclesX.size() / 3) {
    obstaclesX.add(0, 0);
    obstaclesY.add(0, 0);
  }

  for (int i = 0; i < obstaclesX.size(); i++) {
    int tempX = 0, tempY = 0;
    boolean isBadPosition = true;

    while (isBadPosition) {
      isBadPosition = false;
      tempX = (int) random(0, w);
      tempY = (int) random(blockMinY, h);

      int headX = x.get(0);
      int headY = y.get(0);

      // Prevent close spawn to head of snake
      if (headX - 5 <= tempX && tempX <= headX + 5 &&
          headY - 5 <= tempY && tempY <= headY + 5) {
        isBadPosition = true;
        continue;
      }

      // Prevent spawn on snake
      for (int j = 0; j < x.size(); j++) {
        if (tempX == x.get(j) && tempY == y.get(j)) {
          isBadPosition = true;
          break;
        }
      }

      // Prevent spawn on food
      for (int j = 0; j < 4; j++) {
        if (tempX == foodPos[j][0] && tempY == foodPos[j][1]) {
          isBadPosition = true;
          break;
        }
      }
    }

    obstaclesX.set(i, tempX);
    obstaclesY.set(i, tempY);
  }
}

void hideObstacles() {
  for (int i = 0; i < obstaclesX.size(); i++) {
    obstaclesX.set(i, 500);
    obstaclesY.set(i, 500);
  }
}

void clearObstacles() {
  obstaclesX.clear();
  obstaclesY.clear();
}
