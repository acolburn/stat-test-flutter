import 'package:flutter/material.dart';

class aTest {
  String name;
  bool twoGroups;
  bool continuous;
  bool parametric;
  bool covariates;
  bool paired;

  aTest(
      {this.name,
      this.twoGroups,
      this.continuous,
      this.parametric,
      this.covariates,
      this.paired});
} //end aTest

List<aTest> originalList = testList;
List<aTest> testList = [
  aTest(
      name: "independent samples t-test",
      twoGroups: true,
      continuous: true,
      parametric: true,
      covariates: false,
      paired: false),
  aTest(
    name: "dependent samples t-test",
    twoGroups: true,
    continuous: true,
    parametric: true,
    covariates: false,
    paired: true,
  ),
  aTest(
    name: "Mann-Whitney U-test",
    twoGroups: true,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: false,
  ),
  aTest(
    name: "Wilcoxson matched pairs test",
    twoGroups: true,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: true,
  ),
  aTest(
    name: "one-way independent ANOVA",
    twoGroups: false,
    continuous: true,
    parametric: true,
    covariates: false,
    paired: false,
  ),
  aTest(
    name: "Kruskall-Wallis test",
    twoGroups: false,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: false,
  ),
  aTest(
    name: "one-way repeated measures ANOVA",
    twoGroups: false,
    continuous: true,
    parametric: true,
    covariates: false,
    paired: true,
  ),
  aTest(
    name: "Friedman's ANOVA",
    twoGroups: false,
    continuous: true,
    parametric: false,
    covariates: false,
    paired: true,
  ),
  aTest(
    name: "ANCOVA",
    continuous: true,
    parametric: true,
    covariates: true,
    paired: false,
  ),
  aTest(
    name: "Chi square",
    continuous: false,
    parametric: false,
    covariates: false,
  )
];

String printList() {
  String result = 'Test(s) to Consider:\n\n';
  if (testList.length == 0) {
    result = "No tests match all the given criteria.";
  } else {
    testList.forEach((element) => result += '\n' + element.name);
  }
  return result;
}

void isParametric(bool value) {
  List<aTest> newList = [];
  for (aTest test in testList) {
    if (test.parametric == value || test.parametric == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void isTwoGroups(bool value) {
  List<aTest> newList = [];
  for (aTest test in testList) {
    if (test.twoGroups == value || test.twoGroups == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void hasCovariate(bool value) {
  List<aTest> newList = [];
  for (aTest test in testList) {
    if (test.covariates == value || test.covariates == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void isPaired(bool value) {
  List<aTest> newList = [];
  for (aTest test in testList) {
    if (test.paired == value || test.paired == null) {
      newList.add(test);
    }
  }
  testList = newList;
}

void isContinuous(bool value) {
  List<aTest> newList = [];
  for (aTest test in testList) {
    if (test.continuous == value || test.continuous == null) {
      newList.add(test);
    }
  }
  testList = newList;
}
