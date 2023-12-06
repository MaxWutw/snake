import processing.video.*;

Movie mov;

int curr = 0;
boolean movie_update = true;

void movieEvent(Movie m) {
  m.read();
}

void videoScreen(){
  // image(mov, 0, 0, 1440, 740);
  adver();

  //println("curr:" + curr);

  if ((curr + mov.duration() * 1000) <= millis()) {
    screen = 1;
    curr = 0;
    mov.stop();
    movie_update = true;
  }
}

void movie_decision(){
  JSONArray video = loadJSONArray("data/video.json");
  int video_num = int(random(0, video.size()));
  JSONObject cur_video = video.getJSONObject(video_num);
  
  mov = new Movie(this, cur_video.getString("video"));
  mov.speed(0);
  mov.volume(100); 
}

int adver() {
  if(movie_update){
    movie_decision();
    movie_update = false;
  }
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
