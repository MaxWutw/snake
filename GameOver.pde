void gameover_message() {
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
