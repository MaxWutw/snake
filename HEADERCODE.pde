import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

void keyPressed(){ 
  int newdir = keyCode == DOWN ? 0 : (keyCode == UP ? 1 : (keyCode == RIGHT ? 2 : (keyCode == LEFT ? 3 : -1)));
  if(newdir != -1) direction = newdir;
  if(key == 'w' || key == 'W'){
    reverse_snake();
    delay(100);
  } else if (screen == 4 && keyCode == ENTER) {
    resetGame();
    screen = 1;
  }
}

void mousePressed() {
  if (((onHomeButton() != -1) && (screen == 0))) {
    screen = onHomeButton() + 1;
  } else if (((onBackToHomeButton()) && (screen == 2 || screen == 3 || screen == 4))) {
    if (screen == 4) resetGame();
    screen = 0;
  }
}

void setCursor() {
  if (((onHomeButton() != -1) && (screen == 0)) ||
      ((onBackToHomeButton()) && (screen == 2 || screen == 3 || screen == 4))) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void reverse_snake(){
  Collections.reverse(x);
  Collections.reverse(y);
  //for (int i = 0; i < x.size(); i++){
  //  if(i == 0) fill(255, 0, 0); // RED
  //  else fill(0, 255, 0); // GREEN
  //  rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks);
  //}
  direction = (direction == 0 ? 1 : (direction == 1 ? 0 : (direction == 2 ? 3 : direction == 3 ? 2 : 0)));
}

void snake_head(){
  for(int i = 0; i < x.size(); i++){
    if(i == 0) fill(255, 0, 0); // RED
    else fill(0, 255, 0); // GREEN

    stroke(255);
    strokeWeight(1.5);
    rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks);
  }
}

void init_arraylist_for_debug(int number){
  for(int i = 0;i < number;i++){
    x.add(0, x.get(0) + x_direction[direction]); //make snake longer
    y.add(0, y.get(0) + y_direction[direction]);
  }
}
