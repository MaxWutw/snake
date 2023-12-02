String helpMessage = "Ut labore qui cillum excepteur laborum et eiusmod in irure irure aliquip nostrud amet.\n";

float helpMessageX = screenWidth / 2;
float helpMessageY = 100;
float helpMessageSize = 28;

float backToHomeButtonWidth  = 200;
float backToHomeButtonHeight = 50;

float backToHomeButtonX = screenWidth / 2 - backToHomeButtonWidth / 2;
float backToHomeButtonY = 600;

void helpScreen() {
  drawMessage(helpMessage, helpMessageX, helpMessageY, helpMessageSize, #ffffff);

  drawButton("Home", backToHomeButtonX, backToHomeButtonY,
    backToHomeButtonWidth, backToHomeButtonHeight);
}

boolean onBackToHomeButton() {
  float x1 = backToHomeButtonX;
  float x2 = backToHomeButtonX + backToHomeButtonWidth;
  float y1 = backToHomeButtonY;
  float y2 = backToHomeButtonY + backToHomeButtonHeight;

  return (mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2);
}
