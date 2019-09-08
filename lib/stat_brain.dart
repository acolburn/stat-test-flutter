import 'tests.dart';

class Question {
  String question;
  String subheading;
  bool response;

  Question(String q, String sh) {
    question = q;
    subheading = sh;
  }
}

class StatBrain {
  int _questionNumber = 0;

  List<Question> questionList = [
    Question('Is your data numerical?',
        'Tap YES if your data is numerical, NO if it\'s categorical.'),
    Question('Are you comparing two sets of data?',
        'Tap YES if you have two data sets, NO if you have three or more sets.'),
    Question('Are your groups paired?',
        'Tap YES if the data is from paired or matched groups, NO if they are unpaired.'),
    Question('Is your data parametric?',
        'Tap YES if your data is parametric, NO if it is not.'),
    Question('Are you working with a covariate?',
        'Tap YES if you are working with a covariate, NO if you are not.')
  ];

  String getQuestion() {
    String result;
    if (_questionNumber < questionList.length) {
      result = questionList[_questionNumber].question;
    } else {
      result = printList();
    }
    return result;
  }

  String getSubheading() {
    String result;
    if (_questionNumber < questionList.length) {
      result = questionList[_questionNumber].subheading;
    } else {
      result = '';
    }
    return result;
  }

  void nextQuestion() {
    if (_questionNumber < questionList.length) {
      _questionNumber++;
    }
  }

  void resetQuestionNumber() {
    _questionNumber = 0;
  }

  void yesTap() {
    int i = _questionNumber;
    questionList.elementAt(i).response = true;
    updateTestList();
    nextQuestion();
  }

  void noTap() {
    int i = _questionNumber;
    questionList.elementAt(i).response = false;
    updateTestList();
    nextQuestion();
  }

  void previousQuestion() {
    if (_questionNumber > 0) {
      _questionNumber--;
    }
  }

  void resetTestList() {
    for (Question item in questionList) {
      item.response = null;
    }
    updateTestList();
    printList();
  }

  void updateTestList() {
    testList = originalList;
    //is data numerical
    if (questionList[0].response == true) {
      isContinuous(true);
    } else if (questionList[0].response == false) {
      isContinuous(false);
    }
    //does data come from two groups
    if (questionList[1].response == true) {
      isTwoGroups(true);
    } else if (questionList[1].response == false) {
      isTwoGroups(false);
    }
    //are groups paired
    if (questionList[2].response == true) {
      isPaired(true);
    } else if (questionList[2].response == false) {
      isPaired(false);
    }
    //is data parametric
    if (questionList[3].response == true) {
      isParametric(true);
    } else if (questionList[3].response == false) {
      isParametric(false);
    }
    //has covariate
    if (questionList[4].response == true) {
      hasCovariate(true);
    } else if (questionList[4].response == false) {
      hasCovariate(false);
    }
  }
}
