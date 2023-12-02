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
  drawTitle("SNAKE 15 PRO MAX", titleX, titleY);

  for (int i = 0; i < homeButtonAmount; i++) {
    float w = homeButtonX;
    float h = homeButtonY + (homeButtonHeight + homeButtonSpace) * i;

    drawHomeScreenButton(homeButtonString[i], w, h);
  }
}

void drawTitle(String name, float x, float y) {
  pushMatrix();

  translate(x, y);

  fill(255);
  textSize(60);
  textAlign(CENTER, CENTER);
  text(name, 0, 0);

  popMatrix();
}

void drawHomeScreenButton(String name, float x, float y) {
  pushMatrix();

  translate(x, y);

  stroke(255);
  strokeWeight(2);
  fill(255);

  rect(0, 0, homeButtonWidth, homeButtonHeight);
  // drawWord(name, homeButtonWidth/2, homeButtonHeight/2, 20, #000000);

  fill(0);
  textSize(30);
  textAlign(CENTER, CENTER);
  text(name, homeButtonWidth/2, homeButtonHeight/2);

  popMatrix();
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
