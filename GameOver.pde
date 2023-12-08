String gameOverMessage;

float gameOverMessageX = screenWidth / 2;
float gameOverMessageY = screenHeight / 3;

float gameOverBlockX = screenWidth / 2 - 200;
float gameOverBlockY = screenHeight / 3 - 75;
float gameOverBlockWidth  = 400;
float gameOverBlockHeight = 150;

boolean drawGameOverOnce = true;

boolean isGameOver() {
  int headX = x.get(0);
  int headY = y.get(0);

  if (headX < 0 || headY < blockMinY || headX >= w || headY >= h) {
    return true;
  }

  for (int i = 1; i < x.size(); i++) {
    if (headX == x.get(i) && headY == y.get(i)) {
      return true;
    }
  }

  if (isObstableHit()) {
    return true;
  }

  return false;
}

void gameOverScreen() {
  if (drawGameOverOnce) {
    // return;
    stroke(255);
    strokeWeight(2);
    fill(70);
    rect(gameOverBlockX, gameOverBlockY, gameOverBlockWidth, gameOverBlockHeight);

    gameOverMessage = "GAME OVER\nYour Score is: " + score + "\nPress ENTER to restart";
    drawMessage(gameOverMessage, gameOverMessageX, gameOverMessageY, 28, #C8C800);

    drawGameOverOnce = false;
  }

  drawButton("Home", backToHomeButtonX, backToHomeButtonY,
    backToHomeButtonWidth, backToHomeButtonHeight);
}
