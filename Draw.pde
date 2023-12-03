void drawButton(String name, float btnX, float btnY, float btnW, float btnH) {
  pushMatrix();

  translate(btnX, btnY);

  stroke(255);
  strokeWeight(2);
  fill(255);

  rect(0, 0, btnW, btnH);

  fill(0);
  textSize(28);
  textAlign(CENTER, CENTER);
  text(name, btnW / 2, btnH / 2);

  popMatrix();
}

void drawMessage(String message, float messageX, float messageY, float fontSize, color fontColor) {
  pushMatrix();

  translate(messageX, messageY);

  fill(fontColor);
  textSize(fontSize);
  textAlign(CENTER, CENTER);
  text(message, 0, 0);

  popMatrix();
}
