import processing.video.*;

Movie mov;

void movieEvent(Movie m) {
  m.read();
}

void videoScreen(){
   image(mov, 0, 0, 1440, 740);
}

int adver(){
  frameRate(30);
  translate(0, 0);
  background(0);
  mov = new Movie(this, "spongbob.mp4");
  mov.play();
  mov.speed(0);
  mov.volume(100);
  image(mov, 0, 0, 1440, 740);
  delay((int)(mov.duration() * 1000));
  frameRate(60);
  return 0;
}

void videoSetup(){
  translate(0, 0);
  background(0);
  mov.speed(0);
  mov.volume(100);
}
