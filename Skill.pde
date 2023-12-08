float reverseCD = 10 * int(frameRate);
float currReverseCD = 0;

float purifyCD = 40 * int(frameRate);
float currPurifyCD = 0;

float purifyDuration = 10 * int(frameRate);
float currPurifyDuration = 0;

float skillCDWidth  = blocks * 4;
float skillCDHeight = blocks * 4;

float skillCDY = blocks;

void drawSkillPanel() {
  drawSkillCooldown("REVERSE", "W", currReverseCD, 0, blocks * 60, skillCDY);

  if (x.size() >= 10) {
    drawSkillCooldown("PURIFY", "R", currPurifyCD, currPurifyDuration, blocks * 65, skillCDY);
  }
}

void skillCooldownTimer() {
  if (currReverseCD > 0) {
    currReverseCD--;
  }

  if (currPurifyCD > 0) {
    currPurifyCD--;
  }

  if (currPurifyDuration > 0) {
    currPurifyDuration--;
  }

  // if (frameCount % 60 == 0) println("cd: " + currReverseCD);
}

void resetCooldown() {
  currReverseCD = 0;
  currPurifyCD = 0;
  currPurifyDuration = 0;
}

void checkSkillKeyPressed() {
  if (screen != 1) {
    return;
  }

  if (key == 'w' || key == 'W') {
    reverseSnake();
  }

  if (key == 'r' || key == 'R') {
    purifyObstacles();
  }
}

void reverseSnake() {
  if (x.size() <= 1 || currReverseCD != 0) {
    return;
  }

  int lastX  = x.get(x.size() - 1);
  int last2X = x.get(x.size() - 2);

  int lastY  = y.get(y.size() - 1);
  int last2Y = y.get(y.size() - 2);

  if (lastX == last2X) {
    direction = (lastY > last2Y) ? 0 : 1;
  } else {
    direction = (lastX > last2X) ? 2 : 3;
  }

  Collections.reverse(x);
  Collections.reverse(y);

  // delay(100);

  currReverseCD = reverseCD;
}

void purifyObstacles() {
  if (x.size() < 10 || currPurifyCD != 0) {
    return;
  }

  currPurifyCD = purifyCD;
  currPurifyDuration = purifyDuration;
}

boolean isObstaclesPurified() {
  return (currPurifyDuration != 0);
}

void drawSkillCooldown(String skillName, String skillKey, float skillCooldown, float skillDuration, float skillX, float skillY) {
  String skillMessage = "";
  color skillColor = 0;

  if (skillDuration > 0) {
    skillMessage = Integer.toString(int(skillDuration / 60) + 1);
    skillColor   = #00ffff;
  } else if (skillCooldown > 0) {
    skillMessage = Integer.toString(int(skillCooldown / 60) + 1);
    skillColor   = #999999;
  } else {
    skillMessage = "Ready";
    skillColor   = #ffd700;
  }

  pushMatrix();

  translate(skillX, skillY);

  stroke(skillColor);
  strokeWeight(2);
  noFill();

  rect(0, 0, skillCDWidth, skillCDHeight);

  textSize(16);
  textAlign(CENTER, CENTER);

  fill(skillColor);
  text(skillName, skillCDWidth / 2, skillCDHeight / 3);

  fill(skillColor);
  text(skillMessage, skillCDWidth / 2, skillCDHeight / 3 * 2);

  fill(skillColor);
  text(skillKey, skillCDWidth / 2, skillCDHeight + 18);

  popMatrix();
}
