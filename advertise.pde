import processing.video.*;

Movie mov;

int movieStartMillis = 0;
boolean movie_update = true;

boolean enableAdvertise() {
  return false;
}

void movieEvent(Movie m) {
  m.read();
}

void videoScreen(){
  // image(mov, 0, 0, 1440, 740);
  adver();

  //println("movieStartMillis:" + movieStartMillis);

  if (millis() >= (movieStartMillis + mov.duration() * 1000)) {
    screen = 1;
    movieStartMillis = 0;
    mov.stop();
    movie_update = true;
  }
}

void movie_decision(){
  JSONArray video = loadJSONArray("data/video.json");
  int video_num = int(random(0, video.size()));
  JSONObject cur_video = video.getJSONObject(video_num);

  mov = new Movie(this, cur_video.getString("video"));
}

int adver() {
  if(movie_update){
    movie_decision();
    movie_update = false;
  }
  mov.volume(0.5);
  mov.play();

  image(mov, 0, 0, 1440, 740);

  if (movieStartMillis == 0) {
    movieStartMillis = millis();
  }

  return 0;
}

void videoSetup(){
  mov = new Movie(this, "spongbob.mp4");
}
