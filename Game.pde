void startGame() {
  show_question(first_show_question);
  first_show_question = false;
  
  snake_head();
  //fill(0, 255, 0); //snake color green
  //for (int i = 0; i < x.size(); i++)
  //  rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks); //snake
  
  if(!gameover){
    stroke(255);
    strokeWeight(1);
    fill(fc1, fc2, fc3); //food color red
    //ellipse(foodx*blocks+10, foody*blocks+10, blocks, blocks); //food
    
    // rect(foodx*blocks, foody*blocks, 20, 20);
    circle(foodx * blocks + blocks / 2, foody * blocks + blocks / 2, 20);

    // image(img, foodx*blocks, foody*blocks, 30, 30);
    //image(a, foodx*blocks, foody*blocks, 30, 30);
    //image(b, foodx*blocks, foody*blocks, 30, 30);
    //image(c, foodx*blocks, foody*blocks, 30, 30);
    //image(d, foodx*blocks, foody*blocks, 30, 30);

    // textAlign(LEFT); //score
    textAlign(LEFT, CENTER); //score
    textSize(25);
    fill(255);
    // text("Score: " + x.size(), 10, 10, width - 20, 50);
    text("Score: " + x.size(), 10, 20);

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
      else { 
        x.remove(x.size() - 1); 
        y.remove(y.size() - 1);
      }
    }
  }
  else gameover_message();
}