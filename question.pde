float questionWidth  = screenWidth / 2;
float questionHeight = blocks * 3 / 2;

void show_question(boolean first){
  if(first) q_num = int(random(0, questions.size()));
  JSONObject question1 = questions.getJSONObject(q_num);

  String questionText = question1.getString("question");
  drawMessage(questionText, questionWidth, questionHeight, 30, #ff00ff);

  String ans = question1.getString("answer");
}
