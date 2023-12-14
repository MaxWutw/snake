String howToPlayHeader  = "= 游戲説明 =";
String[] howToPlayContent = {
  "使用方向鍵以控制貪吃蛇。游戲中會有選擇題，一個選擇對應一個食物，吃正確的食物會獲",
  "得分數，反之減少分數。因為蛇太貪吃了，如果不小心吃到墻壁或自己就會死亡。吃到錯誤",
  "的食物并不會讓蛇死亡，反而會因此而讓蛇變得更長。蛇吃得越多越有力量，因此蛇的速度",
  "會根據蛇的長度成正比。蛇到了一定長度，將獲得强大的技能。讓蛇更容易吃更多食物。",
};

String skillHeader = "= 技能説明 =";
String[] skillContent = {
  "倒轉 REVERSE (W 鍵，長度 ≧ 2)：蛇的頭和尾互換",
  "淨化 PURIFY (R 鍵，長度 ≧ 11)：將場上的障礙物清空",
  "增幅 BOOST (C 鍵，長度 ≧ 11)：獲得的分數及蛇的增長速度翻倍，無論答對或答錯"
};

float howToPlayHeaderX   = screenWidth / 2;
float howToPlayHeaderY   = 100;
float howToPlayContentX  = screenWidth / 2;
float howToPlayContentY  = 140;
float howToPlayContentdY = 35;

float skillHeaderX   = screenWidth / 2;
float skillHeaderY   = 300;
float skillContentX  = 200;
float skillContentY  = 340;
float skillContentdY = 35;

float helpHeaderSize  = 36;
float helpContentSize = 24;

void helpScreen() {
  drawMessage(howToPlayHeader, howToPlayHeaderX, howToPlayHeaderY, helpHeaderSize, #ffffff);

  for (int i = 0; i < howToPlayContent.length; i++) {
    float contentY = howToPlayContentY + howToPlayContentdY * i;
    drawMessage(howToPlayContent[i], howToPlayContentX, contentY, helpContentSize, #999999);
  }

  drawMessage(skillHeader, skillHeaderX, skillHeaderY, helpHeaderSize, #ffffff);

  for (int i = 0; i < skillContent.length; i++) {
    float contentY = skillContentY + skillContentdY * i;
    drawInfo(skillContent[i], skillContentX, contentY, helpContentSize, #999999);
  }

  drawHomeButton();
}

boolean onBackToHomeButton() {
  float x1 = toHomeButtonX;
  float x2 = toHomeButtonX + toHomeButtonWidth;
  float y1 = toHomeButtonY;
  float y2 = toHomeButtonY + toHomeButtonHeight;

  return (mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2);
}
