import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

PFont TCfont;
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w = 72, h = 37, blocks = 20, direction = 2, foodx = 15, foody = 15, speed = 8, fc1 = 255, fc2 = 255, fc3 = 255; 
int[]x_direction={0, 0, 1, -1}, y_direction={1, -1, 0, 0}; //direction for x and y
boolean gameover = false;
PImage img;

void setup(){ 
  size(1440, 750); 
  x.add(0); //snake start position
  y.add(15);
  img = loadImage("image/apple.png");
  TCfont = createFont("./Noto_Sans_TC/static/NotoSansTC-Black.ttf", 28);
  init_arraylist_for_debug(5);
}


void draw(){  
  background(0);
  question();
  snake_head();
  //fill(0, 255, 0); //snake color green
  //for (int i = 0; i < x.size(); i++)
  //  rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks); //snake
  //if(key == 'w' || key == 'W'){
  //  reverse_snake();
  //  delay(1000);
  //}
  if(!gameover){
    fill(fc1, fc2, fc3); //food color red
    //ellipse(foodx*blocks+10, foody*blocks+10, blocks, blocks); //food
    image(img, foodx*blocks, foody*blocks, 30, 30);
    textAlign(LEFT); //score
    textSize(25);
    fill(255);
    text("Score: " + x.size(), 10, 10, width - 20, 50);
    if(frameCount % speed == 0){
      println(y.get(0));
      if(key == 'a'){
        for(int i = 0;i < x.size();i++) print(x.get(i) + " ");
        delay(10000);
      }
      x.add(0, x.get(0) + x_direction[direction]); //make snake longer
      y.add(0, y.get(0) + y_direction[direction]);
      if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true; 
      //for(int i = 1;i < x.size();i++){
      //  if(x.get(0) == x.get(i) && y.get(0) == y.get(i))
      //    gameover = true;
      //}
      if(x.get(0) == foodx && y.get(0) == foody){ //new food if we touch
         if(x.size() % 5 == 0 && speed >= 2) speed -= 1;  // every 5 points speed increase
        foodx = (int)random(0, w); //new food
        foody = (int)random(0, h);
        fc1 = (int)random(255); fc2 = (int)random(255); fc3 = (int)random(255); // new food color
      }
      else{ 
        x.remove(x.size() - 1); 
        y.remove(y.size() - 1);
      }
    }
  }
  else gameover_message();
}
