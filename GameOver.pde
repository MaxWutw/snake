String gameOverMessage;

float gameOverMessageX = screenWidth / 2;
float gameOverMessageY = screenHeight / 3;

boolean isGameOver() {
  return (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h);
}

void gameOverScreen() {
  gameOverMessage = "GAME OVER\nYour Score is: "+ x.size() +"\nPress ENTER to restart";
  drawMessage(gameOverMessage, gameOverMessageX, gameOverMessageY, 30, #C8C800);

  drawButton("Home", backToHomeButtonX, backToHomeButtonY,
    backToHomeButtonWidth, backToHomeButtonHeight);
}
