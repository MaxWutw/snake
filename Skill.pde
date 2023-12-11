final int REVERSE = 0;
final int PURIFY  = 1;
final int BOOST   = 2;

final String[] skillName = {"Reverse", "Purify", "Boost"};
final char[] skillKey    = {'W', 'R', 'C'};

final int[] minSnakeLength = {2, 11, 11};

final int[] skillCD  = {10, 40, 60};
int[] currSkillCD    = {0, 0, 0};

final int[] skillDur = {0, 10, 20};
int[] currSkillDur   = {0, 0, 0};

final float skillCDWidth  = blocks * 4;
final float skillCDHeight = blocks * 4;

final float[][] skillPos = {
  {blocks * 65, blocks},
  {blocks * 60, blocks},
  {blocks * 55, blocks},
};

void drawSkillPanel() {
  for (int i = 0; i < skillName.length; i++) {
    if (x.size() >= minSnakeLength[i]) {
      drawSkillCooldown(skillName[i], skillKey[i], currSkillCD[i], currSkillDur[i], skillPos[i][0], skillPos[i][1]);
    }
  }
}

void skillCooldownTimer() {
  for (int i = 0; i < skillName.length; i++) {
    if (currSkillCD[i] > 0) {
      currSkillCD[i]--;
    }

    if (currSkillDur[i] > 0) {
      currSkillDur[i]--;
    }
  }
}

void resetCooldown() {
  for (int i = 0; i < skillName.length; i++) {
    currSkillCD[i]  = 0;
    currSkillDur[i] = 0;
  }
}

void checkSkillKeyPressed() {
  if (screen != 1) {
    return;
  }

  int offset = 'a' - 'A';

  if (key == skillKey[REVERSE] || key == skillKey[REVERSE] + offset) {
    reverseSnake();
  }

  if (key == skillKey[PURIFY] || key == skillKey[PURIFY] + offset) {
    purifyObstacles();
  }

  if (key == skillKey[BOOST] || key == skillKey[BOOST] + offset) {
    boostPoints();
  }
}

int startTimer(int dur) {
  return dur * int(frameRate);
}

void reverseSnake() {
  if (x.size() < minSnakeLength[REVERSE] || currSkillCD[REVERSE] != 0) {
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

  currSkillCD[REVERSE] = startTimer(skillCD[REVERSE]);
}

void purifyObstacles() {
  if (x.size() < minSnakeLength[PURIFY] || currSkillCD[PURIFY] != 0) {
    return;
  }

  currSkillCD[PURIFY]  = startTimer(skillCD[PURIFY]);
  currSkillDur[PURIFY] = startTimer(skillDur[PURIFY]);
}

boolean isObstaclesPurified() {
  return (currSkillDur[PURIFY] != 0);
}

void boostPoints() {
  if (x.size() < minSnakeLength[BOOST] || currSkillCD[BOOST] != 0) {
    return;
  }

  currSkillCD[BOOST]  = startTimer(skillCD[BOOST]);
  currSkillDur[BOOST] = startTimer(skillDur[BOOST]);
}

boolean isPointBoosted() {
  return (currSkillDur[BOOST] != 0);
}

void drawSkillCooldown(String skillName, char skillKey, float skillCooldown, float skillDuration, float skillX, float skillY) {
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
