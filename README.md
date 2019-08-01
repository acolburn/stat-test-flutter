## Original Python file:

class aTest: 
    def __init__(self, name, twoGroups, continuous, parametric, covariates, paired): 
        self.name = name 
        self.twoGroups = twoGroups 
        self.continuous = continuous 
        self.parametric = parametric 
        self.covariates = covariates 
        self.paired = paired 
 
 
testList = [] 
 
 
def makeList(): 
    testList.append(aTest("independent samples t-test", 1, 1, 1, 0, 0)) 
    testList.append(aTest("dependent samples t-test", 1, 1, 1, 0, 1)) 
    testList.append(aTest("Mann-Whitney U-test", 1, 1, 0, 0, 0)) 
    testList.append(aTest("Wilcoxson matched pairs test", 1, 1, 0, 0, 1)) 
    testList.append(aTest("one-way independent ANOVA", 0, 1, 1, 0, 0)) 
    testList.append(aTest("Kruskall-Wallis test", 0, 1, 0, 0, 0)) 
    testList.append(aTest("one-way repeated measures ANOVA", 0, 1, 1, 0, 1)) 
    testList.append(aTest("Friedman's ANOVA", 0, 1, 0, 0, 1)) 
    # testList.append(aTest("Chi squared test",0,0,0,0,0))...check on this 
    testList.append(aTest("ANCOVA", -1, 1, 1, 1, 0)) 


def printList():
    if len(testList) == 0:
        print("No tests match all the given criteria.")
    else:
        for test in testList:
            print(test.name)


def isParametric():
    for test in list(testList):
        if test.parametric == False:
            testList.remove(test)


def isNotParametric():
    for test in list(testList):
        if test.parametric == True:
            testList.remove(test)


def isTwoGroups():
    for test in list(testList):
        if test.twoGroups == False:
            testList.remove(test)


def isNotTwoGroups():
    for test in list(testList):
        if test.twoGroups == True:
            testList.remove(test)


def hasCovariate():
    for test in list(testList):
        if test.covariates == False:
            testList.remove(test)


def hasNoCovariate():
    for test in list(testList):
        if test.covariates == True:
            testList.remove(test)


def isPaired():
    for test in list(testList):
        if test.paired == False:
            testList.remove(test)


def isNotPaired():
    for test in list(testList):
        if test.paired == True:
            testList.remove(test)
