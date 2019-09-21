import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'questions.dart';
import 'tests.dart';

void main() {
  runApp(StatTest());
}

StatBrain statBrain = StatBrain();
String url = '';
//WebViewController _controller;
bool isLandscape;

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
  String _questionText = '';

  @override
  Widget build(BuildContext context) {
    _questionText = statBrain.getQuestion();
    if (_questionText == '' && testList.length == 0) {
      return portraitResultsPage(noMatches());
    } else if (_questionText == '' && testList.length > 0) {
      return buildResponsiveLayout();
    } else {
      return questionPage();
    }
  }

  OrientationBuilder buildResponsiveLayout() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          isLandscape = true;
          return LandscapeResultsPage(matchList());
        } else {
          isLandscape = false;
          return portraitResultsPage(matchList());
        }
      },
    );
  }

  Material decisionButton(Color btnColor, Function btnPressed, String btnText) {
    return Material(
      elevation: 5.0,
      color: btnColor,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: btnPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  void noBtnPressed() {
    setState(() {
      statBrain.noTap();
    });
  }

  void yesBtnPressed() {
    setState(() {
      statBrain.yesTap();
    });
  }

  MaterialApp questionPage() {
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
                  child: decisionButton(Colors.green, yesBtnPressed, 'Yes'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: decisionButton(Colors.red, noBtnPressed, 'No'),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: navBar(),
      ),
    );
  }

  List<Widget> noMatches() {
    return <Widget>[
      ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('NONE OF MY TESTS MATCH YOUR CONDITIONS.'),
              subtitle: Text('Try again or consult your statistical adviser.'),
            ),
          );
        }, //itemBuilder
      )
    ];
  }

  List<Widget> matchList() {
    return <Widget>[
      ListView.builder(
        itemCount: testList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text(testList[index].name),
              subtitle: Text(testList[index].description),
              onTap: () {
                if (isLandscape) {
                  setState(() {
                    url = testList[index].url;
                  });
                } else {
                  setState(
                    () {
                      url = testList[index].url;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LearnMoreScreen();
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          );
        }, //itemBuilder
      )
    ];
  }

//  MaterialApp landscapeResultsPage(List<Widget> matches) {
//    return MaterialApp(
//      home: SafeArea(
//        child: Scaffold(
//          backgroundColor: Colors.grey.shade900,
//          appBar: AppBar(
//            title: const Text('Results'),
//          ),
//          body: Row(
//            children: <Widget>[
//              Expanded(
//                flex: 3,
//                child: PageView(
//                  children: matches,
//                ),
//              ),
//              Expanded(
//                flex: 7,
//                child: LearnMoreScreen(),
//              ),
//            ],
//          ),
//          bottomNavigationBar: navBar(),
//        ),
//      ),
//    );
//  }

  MaterialApp portraitResultsPage(List<Widget> matches) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: const Text('Results'),
          ),
          body: PageView(
            children: matches,
          ),
          bottomNavigationBar: navBar(),
        ),
      ),
    );
  }

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

  BottomNavigationBar navBar() {
    return BottomNavigationBar(
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
    );
  }
}

class LearnMoreScreen extends StatefulWidget {
  @override
  _LearnMoreScreenState createState() => _LearnMoreScreenState();
}

class _LearnMoreScreenState extends State<LearnMoreScreen> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withZoom: true,
      appBar: AppBar(title: Text('Learn More About Your Test')),
    );
  }
}

class LandscapeResultsPage extends StatefulWidget {
  final List<Widget> matches;
  LandscapeResultsPage(this.matches);
  @override
  _LandscapeResultsPageState createState() => _LandscapeResultsPageState();
}

class _LandscapeResultsPageState extends State<LandscapeResultsPage> {
  @override
  Widget build(BuildContext context) {
    var matches = widget.matches;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: const Text('Results'),
          ),
          body: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView(
                  children: matches,
                ),
              ),
              Expanded(
                flex: 7,
                child: LearnMoreScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
