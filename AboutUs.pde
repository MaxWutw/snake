String teamMemberString = "吳振榮\n廖俊翔\n張呈義\n侯宇宸\n韓欣劭\n田多多\n詹博宇\n黃寶儀";

String rightsTerm = "copyright © All Rights Reserved.\n本作品不做任何商業用途，僅供教學與學習使用。";

float aboutUsMessageX = screenWidth / 2;

float aboutUsHeaderFontSize  = 36;
float aboutUsContentFontSize = 24;

void aboutUsScreen() {
  drawMessage("= 團隊 =", aboutUsMessageX, 100, aboutUsHeaderFontSize);
  drawMessage(teamMemberString, aboutUsMessageX, 150, aboutUsContentFontSize);

  drawMessage("= 版權宣告 =", aboutUsMessageX, 430, aboutUsHeaderFontSize);
  drawMessage(rightsTerm, aboutUsMessageX, 480, aboutUsContentFontSize);

  drawBackToHomeButton();
}

