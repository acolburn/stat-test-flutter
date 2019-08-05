import 'package:flutter/material.dart';
import 'stat_brain.dart';
import 'tests.dart';

void main() {
  runApp(StatTest());
}

StatBrain statBrain = StatBrain();

class StatTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
//              borderRadius: BorderRadius.all(
//                Radius.circular(8.0),
//              ),
            ),
            child: Center(
              child: Text(
                statBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  statBrain.yesTap();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  statBrain.noTap();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                RaisedButton(
//                  color: Colors.grey[700],
//                  child: Text(
//                    '<- Back',
//                    style: TextStyle(
//                      fontSize: 20.0,
//                      color: Colors.white,
//                    ),
//                  ),
//                  onPressed: () {
//                    setState(() {
//                      statBrain.previousQuestion();
//                    });
//                  },
//                ),
                FlatButton(
                  color: Colors.grey[300],
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back),
                      Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      statBrain.previousQuestion();
                    });
                  },
                ),
                FlatButton(
                  color: Colors.grey[300],
                  child: Text(
                    'Start Over',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      statBrain.resetTestList();
                      statBrain.resetQuestionNumber();
                    });
                  },
                ),
                FlatButton(
                  color: Colors.grey[300],
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Ignore',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      statBrain.nextQuestion();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
