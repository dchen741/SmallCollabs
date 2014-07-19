//
//  questionCorrectViewController.h
//  iphoneQuiz
//
//  Created by Ivan Seto on 7/13/14.
//  Copyright (c) 2014 Ivan Seto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface questionCorrectViewController : UIViewController

@property (strong, nonatomic) NSString *correctAnswerString;
@property (nonatomic, assign) BOOL gotAnswerCorrect;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;
@property (weak, nonatomic) IBOutlet UILabel *correctWrongLabel;

@end
