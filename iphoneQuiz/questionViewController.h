//
//  questionViewController.h
//  iphoneQuiz
//
//  Created by Ivan Seto on 7/13/14.
//  Copyright (c) 2014 Ivan Seto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface questionViewController : UIViewController {
    NSString *wholeQuestion;
    NSString *question;
    NSString *answer;
    int currentQuestion;
    bool gotAnswerCorrect;
}

@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
@property (weak, nonatomic) IBOutlet UITextField *answerInputTextfield;

@end
