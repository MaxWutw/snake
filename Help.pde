String helpMessage = "Ut labore qui cillum excepteur laborum et eiusmod in irure irure aliquip nostrud amet.\n";

float helpMessageX = screenWidth / 2;
float helpMessageY = 100;

float backToHomeButtonWidth  = 200;
float backToHomeButtonHeight = 50;

float backToHomeButtonX = screenWidth / 2 - backToHomeButtonWidth / 2;
float backToHomeButtonY = 600;

void helpScreen() {
  drawMessage(helpMessage, helpMessageX, helpMessageY, 28);

  drawBackToHomeButton();
}

void drawMessage(String name, float x, float y, float fontSize) {
  pushMatrix();

  translate(x, y);

  fill(255);
  textSize(fontSize);
  textAlign(CENTER, TOP);
  text(name, 0, 0);

  popMatrix();
}

void drawBackToHomeButton() {
  pushMatrix();

  translate(backToHomeButtonX, backToHomeButtonY);

  stroke(255);
  strokeWeight(2);
  fill(255);

  rect(0, 0, backToHomeButtonWidth, backToHomeButtonHeight);

  fill(0);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("Return", backToHomeButtonWidth / 2, backToHomeButtonHeight / 2);

  popMatrix();
}

boolean onBackToHomeButton() {
  float x1 = backToHomeButtonX;
  float x2 = backToHomeButtonX + backToHomeButtonWidth;
  float y1 = backToHomeButtonY;
  float y2 = backToHomeButtonY + backToHomeButtonHeight;

  return (mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2);
}
