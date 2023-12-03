float titleX = screenWidth / 2;
float titleY = 200;

float homeButtonWidth  = 200;
float homeButtonHeight = 50;
float homeButtonSpace  = 10;

float homeButtonX = screenWidth / 2 - homeButtonWidth / 2;
float homeButtonY = 300;

int homeButtonAmount = 3;

String[] homeButtonString = {"Play", "Help", "About Us"};

void homeScreen() {
  drawMessage("SNAKE 15 PRO MAX", titleX, titleY, 60, #ffffff);

  for (int i = 0; i < homeButtonAmount; i++) {
    float btnX = homeButtonX;
    float btnY = homeButtonY + (homeButtonHeight + homeButtonSpace) * i;

    drawButton(homeButtonString[i], btnX, btnY, homeButtonWidth, homeButtonHeight);
  }
}

/**
 * Check if the cursor position's is on home buttons.
 * @return the index of buttons, -1 if not on buttons.
 */
int onHomeButton() {
  for (int i = 0; i < homeButtonAmount; i++) {
    float x1 = homeButtonX;
    float x2 = homeButtonX + homeButtonWidth;
    float y1 = homeButtonY + (homeButtonHeight + homeButtonSpace) * i;
    float y2 = homeButtonY + (homeButtonHeight + homeButtonSpace) * i + homeButtonHeight;

    if (mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2) {
      return i;
    }
  }

  return -1;
}
