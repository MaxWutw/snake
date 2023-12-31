import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

void keyPressed(){ 
  int newdir = keyCode == DOWN ? 0 : (keyCode == UP ? 1 : (keyCode == RIGHT ? 2 : (keyCode == LEFT ? 3 : -1)));
  if(newdir != -1) direction = newdir;
  if(key == 'w' || key == 'W'){
    reverse_snake();
    delay(100);
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
    rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks);
  }
}

void gameover_message(){
  fill(200, 200, 0); 
  textSize(30); 
  textAlign(CENTER); 
  text("GAME OVER \n Your Score is: "+ x.size() +"\n Press ENTER", width/2, height/3);
  if(keyCode == ENTER){ 
    x.clear(); 
    y.clear(); 
    x.add(0);  
    y.add(15);
    //init_arraylist_for_debug(5);
    direction = 2;
    speed = 8;
    gameover = false;
  }
}

void init_arraylist_for_debug(int number){
  for(int i = 0;i < number;i++){
    x.add(0, x.get(0) + x_direction[direction]); //make snake longer
    y.add(0, y.get(0) + y_direction[direction]);
  }
}
