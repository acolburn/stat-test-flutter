class Question {
  String question;

  Question(String q) {
    question = q;
  }
}

class QuizBrain {
  int _questionNumber = 0;

  List<Question> questions = [
    Question('Is your data numerical (rather than categorical?'),
    Question('Does your data come from two groups?'),
    Question('Are the groups separate and independent of each other?'),
    Question('Is your data parametric?'),
    Question('Are you working with a covariate?')
  ];

  String getQuestion() {
    return questions[_questionNumber].question;
  }

  void nextQuestion() {
    if (_questionNumber < questions.length - 1) {
      _questionNumber++;
    }
  }
}
