JSONArray questions;

int questionNum = 0;

float questionWidth  = screenWidth / 2;
float questionHeight = blocks * 3 / 2;
float questionSize   = 30;
color questionColor  = #ff00ff;

float optionWidth  = 200;
float optionHeight = 30;
float optionSpace  = 20;

float optionLeftX   = screenWidth / 2 - 200 - optionSpace;
float optionRightX  = screenWidth / 2 + optionSpace;
float optionTopX    = blocks * 3;
float optionBottomX = blocks * 5;

float[][] optionPos = {
  {optionLeftX,  optionTopX},
  {optionRightX, optionTopX},
  {optionLeftX,  optionBottomX},
  {optionRightX, optionBottomX}
};

// boolean drawNewQuestion = true;

void initQuestion() {
  questions   = loadJSONArray("data/questions.json");
  questionNum = int(random(0, questions.size()));
}

void drawQuestion() {
  // if(drawNewQuestion) {
  //   questionNumber = int(random(0, questions.size()));
  // }

  JSONObject question = questions.getJSONObject(questionNum);

  String questionText = question.getString("question");
  drawMessage(questionText, questionWidth, questionHeight, questionSize, questionColor);

  JSONObject questionOptions = question.getJSONObject("option");
  String[] options = new String[4];
  options[0] = questionOptions.getString("A");
  options[1] = questionOptions.getString("B");
  options[2] = questionOptions.getString("C");
  options[3] = questionOptions.getString("D");
  // println(optionA + " " + optionB + " " + optionC + " " + optionD);

  for (int i = 0; i < 4; i++) {
    color optionColor = color(foodColor[i][0], foodColor[i][1], foodColor[i][2]);
    drawOption(options[i], optionPos[i][0], optionPos[i][1], optionColor);
  }

  // String ans = question.getString("answer");

  // drawNewQuestion = false;
}

boolean isCorrectAnswer(int ans) {
  return true;
}

void drawOption(String optionText, float optionX, float optionY, color backgroundColor) {
  pushMatrix();

  translate(optionX, optionY);

  stroke(backgroundColor);
  strokeWeight(2);
  fill(backgroundColor, 128);
  rect(0, 0, optionWidth, optionHeight);

  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(optionText, optionWidth / 2, optionHeight / 2);

  popMatrix();
}
