String teamMemberHeader  = "= 團隊 =";
String teamMemberContent = "吳振榮\n廖俊翔\n張呈義\n侯宇宸\n韓欣劭\n田多多\n詹博宇\n黃寶儀";

String rightsTermHeader  = "= 版權宣告 =";
String rightsTermContent = "copyright © All Rights Reserved.\n本作品不做任何商業用途，僅供教學與學習使用。";

float aboutUsMessageX = screenWidth / 2;

float teamMemberHeaderY  = 100;
float teamMemberContentY = 250;

float rightsTermHeaderY  = 430;
float rightsTermContentY = 490;

float aboutUsHeaderSize  = 36;
float aboutUsContentSize = 24;

void aboutUsScreen() {
  drawMessage(teamMemberHeader,  aboutUsMessageX, teamMemberHeaderY,  aboutUsHeaderSize,  #ffffff);
  drawMessage(teamMemberContent, aboutUsMessageX, teamMemberContentY, aboutUsContentSize, #999999);

  drawMessage(rightsTermHeader,  aboutUsMessageX, rightsTermHeaderY,  aboutUsHeaderSize,  #ffffff);
  drawMessage(rightsTermContent, aboutUsMessageX, rightsTermContentY, aboutUsContentSize, #999999);

  drawHomeButton();
}
