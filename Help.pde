String helpMessage = "Ut labore qui cillum excepteur laborum et eiusmod in irure irure aliquip nostrud amet.\n Quis ullamco dolor laborum est id labore ullamco proident est ea ullamco duis anim consequat.\n Proident adipisicing excepteur est ea veniam ut proident.\n In mollit pariatur veniam.\n Mollit laborum dolor veniam nisi tempor voluptate excepteur minim sint veniam ea duis qui.\n";

float helpMessageX = screenWidth / 2;
float helpMessageY = 200;

// float backToHomeX

void helpScreen() {
  drawHelpMessage(helpMessage, helpMessageX, helpMessageY);
}

void drawHelpMessage(String name, float x, float y) {
  pushMatrix();

  translate(x, y);

  fill(255);
  textSize(30);
  textAlign(CENTER, CENTER);
  text(name, 0, 0);

  popMatrix();
}

