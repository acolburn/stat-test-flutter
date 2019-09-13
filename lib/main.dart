import 'package:flutter/material.dart';
import 'questions.dart';
import 'tests.dart';

void main() {
  runApp(StatTest());
}

StatBrain statBrain = StatBrain();

class StatTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuestionPage();
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  void onTabTap(int index) {
    if (index == 0) {
      setState(
        () {
          statBrain.previousQuestion();
        },
      );
    } else if (index == 1) {
      setState(() {
        statBrain.resetTestList();
        statBrain.resetQuestionNumber();
      });
    } else if (index == 2) {
      setState(() {
        statBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _questionText = statBrain.getQuestion();
    if (_questionText == '' && testList.length == 0) {
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Results'),
                  ),
                  body: PageView(
                    children: <Widget>[
                      ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.wb_sunny),
                              title: Text(
                                  'NONE OF MY TESTS MATCH YOUR CONDITIONS.'),
                              subtitle: Text(
                                  'Try again or consult your statistical adviser.'),
                            ),
                          );
                        }, //itemBuilder
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTap,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back),
                title: Text('Back'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Start Over'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward),
                title: Text('Ignore'),
              )
            ],
          ),
        ),
      );
    } else if (_questionText == '' && testList.length > 0) {
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Results'),
                  ),
                  body: PageView(
                    children: <Widget>[
                      ListView.builder(
                        itemCount: testList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.wb_sunny),
                              title: Text(testList[index].name),
                              subtitle: Text(testList[index].description),
                            ),
                          );
                        }, //itemBuilder
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTap,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back),
                title: Text('Back'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Start Over'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward),
                title: Text('Ignore'),
              )
            ],
          ),
        ),
      );
    } else {
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
            child: Column(
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
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTap,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back),
                title: Text('Back'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Start Over'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward),
                title: Text('Ignore'),
              )
            ],
          ),
        ),
      );
    }
  }
}
