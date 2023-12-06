import processing.video.*;

Movie mov;

int curr = 0;

void movieEvent(Movie m) {
  m.read();
}

void videoScreen(){
  // image(mov, 0, 0, 1440, 740);
  adver();

  println("curr:" + curr);

  if ((curr + mov.duration() * 1000) <= millis()) {
    screen = 1;
    curr = 0;
    mov.stop();
  }
}

int adver() {
  mov.play();

  image(mov, 0, 0, 1440, 740);

  if (curr == 0) {
    curr = millis();
  }

  return 0;
}

void videoSetup(){
  translate(0, 0);
  background(0);
  mov = new Movie(this, "spongbob.mp4");
  mov.speed(0);
  mov.volume(100);
}
