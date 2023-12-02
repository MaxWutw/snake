boolean isGameOver() {
  return (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h);
}

void gameOverScreen() {
  gameover_message();

  drawBackToHomeButton();
}

void gameover_message() {
  // fill(0);
  // stroke(255);
  // strokeWeight(2);
  // rect(width / 2 - 300, 100, 600, 500);

  fill(200, 200, 0);
  noStroke();
  textSize(30);
  textAlign(CENTER);
  text("GAME OVER\nYour Score is: "+ x.size() +"\nPress ENTER to restart", width/2, height/3);
}
