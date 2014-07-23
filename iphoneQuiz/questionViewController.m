//
//  questionViewController.m
//  iphoneQuiz
//
//  Created by Ivan Seto on 7/13/14.
//  Copyright (c) 2014 Ivan Seto. All rights reserved.
//

#import "questionViewController.h"
#import "questionCorrectViewController.h"
#import "AppDelegate.h"

@interface questionViewController ()

@end

@implementation questionViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view."
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    currentQuestion = appDelegate.questionNumber;
    progressBarFill = (float) currentQuestion/5;
    self.progressLabel.text = [NSString stringWithFormat:@"%i of 5 questions answered",currentQuestion];
    self.questionProgressBar.progress = progressBarFill;
    appDelegate.questionNumber++;
    NSArray *questionArray = [NSArray arrayWithObjects:@"The [thoracic] and [sacral] portions of the vertebral column are considered [kyphotic] curves.",@"The [cervical] and [lumbar] portions of the vertebral column are considered [lordotic] curves.",@"The most lateral projection of the [scapula] is the [acromion].",@"The [coracoid] is the most anterior projection of the [scapula].",@"The lateral antebrachial cutaneous nerve is a branch off the [musculocutaneous] nerve from the [lateral] cord of the brachial plexus.",nil];
    
    int numberBrackets = 0;
    for (int i=0;i<[questionArray[currentQuestion] length];i++){
        unichar ch = [questionArray[currentQuestion] characterAtIndex:i];
        //NSLog(@"%C",ch);
        if (ch == '['){
            numberBrackets++;
        }
    }
    //NSLog(@"brackets %i",numberBrackets);
    int rndQuestion = (arc4random()%(numberBrackets))+1;
    //NSLog(@"rnd %i",rndQuestion);
    
    numberBrackets = 0;
    int leftBracketIndex;
    int rightBracketIndex;
    for (int i=0;i<[questionArray[currentQuestion] length];i++){
        unichar ch = [questionArray[currentQuestion] characterAtIndex:i];
        if (ch == '['){
            numberBrackets++;
            if (numberBrackets == rndQuestion){
                leftBracketIndex = i;
                //NSLog(@"left %i",leftBracketIndex);
            }
        }
        else if (ch == ']'){
            if (numberBrackets == rndQuestion){
                rightBracketIndex = i;
                //NSLog(@"right %i",rightBracketIndex);
            }
        }
    }
    
    wholeQuestion = questionArray[currentQuestion];
    answer = [questionArray[currentQuestion] substringWithRange:NSMakeRange(leftBracketIndex+1, rightBracketIndex-leftBracketIndex-1)];
    //NSLog(answer);
    //NSLog(wholeQuestion);
    question = [questionArray[currentQuestion] stringByReplacingCharactersInRange:NSMakeRange(leftBracketIndex, rightBracketIndex-leftBracketIndex+1) withString:@"_______"];
    
    for (int i=0;i<[question length];i++){
        unichar ch = [question characterAtIndex:i];
        if ((ch == '[') || (ch == ']')){
            question = [question stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@""];
        }
    }

    for (int i=0;i<[wholeQuestion length];i++){
        unichar ch = [wholeQuestion characterAtIndex:i];
        if ((ch == '[') || (ch == ']')){
            wholeQuestion = [wholeQuestion stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@""];
        }
    }

    self.questionTextView.text = question;
}

- (IBAction)hideKeyboard:(id)sender {
    [sender resignFirstResponder];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([self.answerInputTextfield.text isEqualToString:answer]){
        gotAnswerCorrect = true;
    }
    else gotAnswerCorrect = false;
    questionCorrectViewController *transferViewController = segue.destinationViewController;
    if([segue.identifier isEqualToString:@"questionSegue"])
    {
        transferViewController.correctAnswerString = wholeQuestion;
        transferViewController.gotAnswerCorrect = gotAnswerCorrect;
        transferViewController.progressBarFill = progressBarFill;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
