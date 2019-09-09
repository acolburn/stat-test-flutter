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
    String _questionText = statBrain.getQuestion();
    if (_questionText == '') {
      Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
          return PageView(
            children: <Widget>[
              ListView.builder(
                itemCount: testList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text(testList[index].name),
                      subtitle: Text('Details about the test would go here.'),
                    ),
                  );
                }, //itemBuilder
              )
            ],
          );
        } //builder
            ),
      ); //Navigator.push
    }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
//                  statBrain.getQuestion(),
                  _questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  statBrain.getSubheading(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Material(
              elevation: 5.0,
              color: Colors.green,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    statBrain.yesTap();
                  });
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Material(
                elevation: 5.0,
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      statBrain.noTap();
                    });
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
