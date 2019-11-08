//import 'package:flutter/material.dart';

class Test {
  String name;
  String description;
  String url;
  bool twoGroups;
  bool continuous;
  bool parametric;
  bool covariates;
  bool paired;

  Test(
      {this.name,
      this.description,
      this.url,
      this.twoGroups,
      this.continuous,
      this.parametric,
      this.covariates,
      this.paired});
} //end aTest

List<Test> originalList = testList;
List<Test> testList = [
  Test(
      name: "independent samples t-test",
      description: "A parametric test comparing two independent sample means",
      url:
          "https://statistics.laerd.com/statistical-guides/independent-t-test-statistical-guide.php",
      twoGroups: true,
      continuous: true,
      parametric: true,
      covariates: false,
      paired: false),
  Test(
    name: "dependent samples t-test",
    description: "A parametric test comparing two matched sample means",
    url:
        'https://statistics.laerd.com/statistical-guides/dependent-t-test-statistical-guide.php',
    twoGroups: true,
    continuous: true,
    parametric: true,
    covariates: false,
    paired: true,
  ),
  Test(
    name: "Mann-Whitney U-test",
    description:
        "A nonparametric test comparing two independent sample medians",
    url:
        'https://statistics.laerd.com/spss-tutorials/mann-whitney-u-test-using-spss-statistics.php',
    twoGroups: true,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: false,
  ),
  Test(
    name: "Wilcoxson matched pairs test",
    description: "A nonparametric test comparing two matched sample medians",
    url:
        'https://statistics.laerd.com/spss-tutorials/wilcoxon-signed-rank-test-using-spss-statistics.php',
    twoGroups: true,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: true,
  ),
  Test(
    name: "one-way independent ANOVA",
    description: "A parametric test comparing independent sample means",
    url:
        'https://statistics.laerd.com/statistical-guides/one-way-anova-statistical-guide.php',
    twoGroups: false,
    continuous: true,
    parametric: true,
    covariates: false,
    paired: false,
  ),
  Test(
    name: "Kruskall-Wallis test",
    description:
        "A nonparametric test comparing three or more independent samples",
    url:
        'https://statistics.laerd.com/spss-tutorials/kruskal-wallis-h-test-using-spss-statistics.php',
    twoGroups: false,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: false,
  ),
  Test(
    name: "one-way repeated measures ANOVA",
    description: "A parametric test comparing three or more matched samples",
    url:
        'https://statistics.laerd.com/statistical-guides/repeated-measures-anova-statistical-guide.php',
    twoGroups: false,
    continuous: true,
    parametric: true,
    covariates: false,
    paired: true,
  ),
  Test(
    name: "Friedman's ANOVA",
    description: "A nonparametric test comparing three or more matched samples",
    url:
        'https://statistics.laerd.com/spss-tutorials/friedman-test-using-spss-statistics.php',
    twoGroups: false,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: true,
  ),
  Test(
    name: "ANCOVA",
    description:
        "A parametric test comparing independent samples, controlling for a pre-existing covariate",
    url:
        'https://statistics.laerd.com/spss-tutorials/ancova-using-spss-statistics.php',
    continuous: true,
    parametric: true,
    covariates: true,
    paired: false,
  ),
  Test(
    name: "Chi square",
    description: "A nonparametric test comparing samples with categorical data",
    url:
        'https://statistics.laerd.com/spss-tutorials/chi-square-test-for-association-using-spss-statistics.php',
    continuous: false,
    parametric: false,
    covariates: false,
  )
];

//String printList() {
//  String result = 'Test(s) to Consider:\n\n';
//  if (testList.length == 0) {
//    result = "No tests match all the given criteria.";
//  } else {
//    testList.forEach((element) => result += '\n' + element.name);
//  }
//  return result;
//}

//void createResultsPage() {
//  Navigator.push(
//    context,
//    MaterialPageRoute<void>(builder: (BuildContext context) {
//      return PageView(
//        children: <Widget>[
//          ListView.builder(
//            itemCount: testList.length,
//            itemBuilder: (context, index) {
//              return Card(
//                child: ListTile(
//                  leading: Icon(Icons.wb_sunny),
//                  title: Text(testList[index].name),
//                  subtitle: Text('Details about the test would go here.'),
//                ),
//              );
//            }, //itemBuilder
//          )
//        ],
//      );
//    } //builder
//        ),
//  ); //Navigator.push
//}

void isParametric(bool value) {
  List<Test> newList = [];
  for (Test test in testList) {
    if (test.parametric == value || test.parametric == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void isTwoGroups(bool value) {
  List<Test> newList = [];
  for (Test test in testList) {
    if (test.twoGroups == value || test.twoGroups == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void hasCovariate(bool value) {
  List<Test> newList = [];
  for (Test test in testList) {
    if (test.covariates == value || test.covariates == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void isPaired(bool value) {
  List<Test> newList = [];
  for (Test test in testList) {
    if (test.paired == value || test.paired == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void isContinuous(bool value) {
  List<Test> newList = [];
  for (Test test in testList) {
    if (test.continuous == value || test.continuous == null) {
      newList.add(test);
    }
  }
  testList = newList;
}
