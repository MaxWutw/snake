JSONArray questions;
JSONObject currQuestion;

ArrayList<Integer> answeredQuestions = new ArrayList<Integer>();

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

void initQuestion() {
  questions = loadJSONArray("data/questions.json");

  int randomNum = int(random(0, questions.size()));
  currQuestion = questions.getJSONObject(randomNum);
}

void drawQuestion() {
  String questionText = currQuestion.getString("question");
  drawMessage(questionText, questionWidth, questionHeight, questionSize, questionColor);

  JSONObject questionOptions = currQuestion.getJSONObject("option");
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
}

void updateQuestion() {
  if (answeredQuestions.size() == questions.size()) {
    answeredQuestions.clear();
  }

  int questionID = currQuestion.getInt("id");
  answeredQuestions.add(questionID);

  boolean isRepeatQuestion = true;
  int randomNum = -1;

  while (isRepeatQuestion) {
    isRepeatQuestion = false;

    randomNum = int(random(0, questions.size()));

    for (int i = 0; i < answeredQuestions.size(); i++) {
      if (randomNum == answeredQuestions.get(i)) {
        isRepeatQuestion = true;
        break;
      }
    }
  }

  currQuestion = questions.getJSONObject(randomNum);
}

boolean isCorrectAnswer(int option) {
  String answerString = currQuestion.getString("answer");
  int answer = -1;

  switch (answerString) {
    case "A":
    answer = 0; break;
    case "B":
    answer = 1; break;
    case "C":
    answer = 2; break;
    case "D":
    answer = 3; break;
    default:
    answer = -1;
  }

  return (option == answer);
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
