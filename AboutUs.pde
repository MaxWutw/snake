String teamMemberString = "吳振榮\n廖俊翔\n張呈義\n侯宇宸\n韓欣劭\n田多多\n詹博宇\n黃寶儀";

String rightsTerm = "copyright © All Rights Reserved.\n本作品不做任何商業用途，僅供教學與學習使用。";

float aboutUsMessageX = screenWidth / 2;

float aboutUsHeaderSize  = 36;
float aboutUsContentSize = 24;

void aboutUsScreen() {
  drawMessage("= 團隊 =", aboutUsMessageX, 100, aboutUsHeaderSize, #ffffff);
  drawMessage(teamMemberString, aboutUsMessageX, 250, aboutUsContentSize, #999999);

  drawMessage("= 版權宣告 =", aboutUsMessageX, 430, aboutUsHeaderSize, #ffffff);
  drawMessage(rightsTerm, aboutUsMessageX, 490, aboutUsContentSize, #999999);

  drawButton("Home", backToHomeButtonX, backToHomeButtonY,
    backToHomeButtonWidth, backToHomeButtonHeight);
}
