void show_question(boolean first){
  fill(200, 0, 200);
  textSize(30); 
  textAlign(CENTER); 
  textFont(TCfont);
  if(first) q_num = int(random(0, questions.size()));
  JSONObject question1 = questions.getJSONObject(q_num);
  String questionText = question1.getString("question");
  text(questionText, width / 2, height * 2 / 3);
  String ans = question1.getString("answer");
}
