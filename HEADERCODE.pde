import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

void keyPressed() {
  if (newDirection() != -1) {
    direction = newDirection();
  }

  if (screen == 4 && keyCode == ENTER) {
    resetGame();
    screen = 1;
  }

  checkSkillKeyPressed();
}

void mousePressed() {
  if ((onHomeButton() != -1) && (screen == 0)) {
    screen = onHomeButton() + 1;
  } else if ((onBackToHomeButton()) && (screen == 2 || screen == 3 || screen == 4)) {
    resetGame();
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

void init_arraylist_for_debug(int number){
  for(int i = 0;i < number;i++){
    x.add(0, x.get(0) + x_direction[direction]); //make snake longer
    y.add(0, y.get(0) + y_direction[direction]);
  }
}
