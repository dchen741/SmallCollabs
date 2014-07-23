//
//  questionCorrectViewController.m
//  iphoneQuiz
//
//  Created by Ivan Seto on 7/13/14.
//  Copyright (c) 2014 Ivan Seto. All rights reserved.
//

#import "questionCorrectViewController.h"

@interface questionCorrectViewController ()

@end

@implementation questionCorrectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)nextViewControllerButton:(id)sender {
    if (JOL == 0){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"You must rate this question before moving on"
                              delegate:nil //or self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        
        [alert show];
    }
    else{
        if ((int)self.questionProgressBar.progress == 1){
            [self performSegueWithIdentifier:@"finishSegue" sender:sender];
        }
        else [self performSegueWithIdentifier:@"nextQuestionSegue" sender:sender];
    }
}

- (IBAction)b1:(id)sender {
    JOL = 1;
    self.b1.alpha = 1;
    self.b2.alpha = .3;
    self.b3.alpha = .3;
    self.b4.alpha = .3;
    self.b5.alpha = .3;
}
- (IBAction)b2:(id)sender {
    JOL = 2;
    self.b1.alpha = .3;
    self.b2.alpha = 1;
    self.b3.alpha = .3;
    self.b4.alpha = .3;
    self.b5.alpha = .3;
}
- (IBAction)b3:(id)sender {
    JOL = 3;
    self.b1.alpha = .3;
    self.b2.alpha = .3;
    self.b3.alpha = 1;
    self.b4.alpha = .3;
    self.b5.alpha = .3;
}
- (IBAction)b4:(id)sender {
    JOL = 4;
    self.b1.alpha = .3;
    self.b2.alpha = .3;
    self.b3.alpha = .3;
    self.b4.alpha = 1;
    self.b5.alpha = .3;
}
- (IBAction)b5:(id)sender {
    JOL = 5;
    self.b1.alpha = .3;
    self.b2.alpha = .3;
    self.b3.alpha = .3;
    self.b4.alpha = .3;
    self.b5.alpha = 1;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.questionProgressBar.progress = self.progressBarFill + 0.2;
    self.progressLabel.text = [NSString stringWithFormat:@"%i of 5 questions answered",(int)(self.questionProgressBar.progress * 5)];

    if (self.gotAnswerCorrect == true){
        self.correctWrongLabel.text = @"Correct";
        self.checkCrossImageView.image = [UIImage imageNamed:@"checkmark.png"];
    }
    else{
        self.correctWrongLabel.text = @"Wrong";
        self.checkCrossImageView.image = [UIImage imageNamed:@"xmark.png"];
    }
    self.answerTextView.text = self.correctAnswerString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
