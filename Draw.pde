void drawButton(String name, float btnX, float btnY, float btnW, float btnH) {
  boolean onButton = (mouseX >= btnX && mouseX <= btnX + btnW && mouseY >= btnY && mouseY <= btnY + btnH);

  pushMatrix();

  translate(btnX, btnY);

  stroke(255);
  strokeWeight(2);
  fill(onButton ? 255 : 0);
  rect(0, 0, btnW, btnH);

  fill(onButton ? 0 : 255);
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

void drawInfo(String message, float messageX, float messageY, float fontSize, color fontColor) {
  pushMatrix();

  translate(messageX, messageY);

  fill(fontColor);
  textSize(fontSize);
  textAlign(LEFT, CENTER);
  text(message, 0, 0);

  popMatrix();
}
