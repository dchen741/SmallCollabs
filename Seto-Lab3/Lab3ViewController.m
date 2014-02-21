//
//  Lab3ViewController.m
//  Seto-Lab3
//
//  Created by Labuser on 2/19/14.
//  Copyright (c) 2014 Labuser. All rights reserved.
//

//Followed tutorial found online for help.  http://www.bhecker.com/workshops/wsoc-tictactoe.pdf

#import "Lab3ViewController.h"

@interface Lab3ViewController ()

@end

@implementation Lab3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startUp];
	oImg = [UIImage imageNamed:@"o.jpeg"];
	xImg = [UIImage imageNamed:@"x.jpeg"];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startUp{
	UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Setup"
			message:@"Who will go first?"
			delegate:self
			cancelButtonTitle:@"Random"
			otherButtonTitles:@"X",@"O",nil];
[theAlert show];
}

-(IBAction)buttonPressed:(id)sender{
	UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Setup"
			message:@"Who will go first?"
			delegate:self
			cancelButtonTitle:@"Random"
			otherButtonTitles:@"X",@"O",nil];
	
	[theAlert show];
 }

 -(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex   
{
	if (buttonIndex == 0)
	{
		NSLog(@"user pressed Button Indexed 0");
		int rnd = (arc4random()%2+1);
		playerToken = rnd;
	}
	else if (buttonIndex == 1)
	{
		NSLog(@"user pressed Button Indexed 1");
		playerToken = 1;
	}
	else if (buttonIndex == 2)
	{
		NSLog(@"user pressed Button Indexed 2");
		playerToken = 2;
	}
	if (playerToken==1) self.whoseTurn.text =@"X goes first";
	else self.whoseTurn.text =@"O goes first";
}

- (void) updatePlayerInfo{
	if(playerToken == 1) {
		playerToken = 2;
		self.whoseTurn.text = @"It is O turn";
	NSLog(@"playerToken = %d", playerToken); }
	else if(playerToken == 2) {
		playerToken = 1;
		self.whoseTurn.text =@"It is X turn";
	NSLog(@"playerToken = %d", playerToken); }
	if ([self checkForWin]) {
		if (playerToken == 1){
			UIAlertView *someonewon = [[UIAlertView
			alloc]initWithTitle:@"There's a winner!" message:@"O Won." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[someonewon show];}
		else if (playerToken == 2){
			UIAlertView *someonewon = [[UIAlertView
			alloc]initWithTitle:@"There's a winner!" message:@"X Won." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[someonewon show];
		}
		[self resetBoard];
	}
	//tie game
	if ((self.s1.image != NULL) && (self.s2.image != NULL) && (self.s3.image != NULL) && (self.s4.image != NULL) && (self.s5.image != NULL) && (self.s6.image != NULL) && (self.s7.image != NULL) && (self.s8.image != NULL) && (self.s9.image != NULL)) {
		NSLog(@"tie!");
		UIAlertView *someonewon = [[UIAlertView
		alloc]initWithTitle:@"There was a tie!" message:@"Tie Game" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[someonewon show];
		[self resetBoard];
	}
	
}

- (IBAction)buttonReset:(UIButton *)sender {
	[self resetBoard];
	self.whoseTurn.text = @"Whose turn?";
	[self startUp];
}

-(void) resetBoard{
	self.s1.image = NULL;
	self.s2.image = NULL;
	self.s3.image = NULL;
	self.s4.image = NULL;
	self.s5.image = NULL;
	self.s6.image = NULL;
	self.s7.image = NULL;
	self.s8.image = NULL;
	self.s9.image = NULL;
	playerToken= 1;
	self.whoseTurn.text = @"X goes first"; }


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
UITouch *touch = [[event allTouches] anyObject];
if(CGRectContainsPoint([self.s1 frame], [touch locationInView:self.view])){
	if (self.s1.image == NULL){
		if(playerToken==1){ self.s1.image = xImg; }
		if(playerToken==2){ self.s1.image = oImg; }
		[self updatePlayerInfo];}
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s2 frame], [touch locationInView:self.view])){
	if (self.s2.image == NULL){
		if(playerToken==1){ self.s2.image = xImg; }
		if(playerToken==2){ self.s2.image = oImg; }
		[self updatePlayerInfo];}
			else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s3 frame], [touch locationInView:self.view])){
	if (self.s3.image == NULL){
		if(playerToken==1){ self.s3.image = xImg; }
		if(playerToken==2){ self.s3.image = oImg; }
		[self updatePlayerInfo]; }
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s4 frame], [touch locationInView:self.view])){
	if (self.s4.image == NULL){
		if(playerToken==1){ self.s4.image = xImg; }
		if(playerToken==2){ self.s4.image = oImg; }
		[self updatePlayerInfo];}
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s5 frame], [touch locationInView:self.view])){
	if (self.s5.image == NULL){
		if(playerToken==1){ self.s5.image = xImg; }
		if(playerToken==2){ self.s5.image = oImg; }
		[self updatePlayerInfo];}
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s6 frame], [touch locationInView:self.view])){
	if (self.s6.image == NULL){
		if(playerToken==1){ self.s6.image = xImg; }
		if(playerToken==2){ self.s6.image = oImg; }
		[self updatePlayerInfo]; }
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s7 frame], [touch locationInView:self.view])){
	if (self.s7.image == NULL){
		if(playerToken==1){ self.s7.image = xImg; }
		if(playerToken==2){ self.s7.image = oImg; }
		[self updatePlayerInfo]; }
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s8 frame], [touch locationInView:self.view])){
	if (self.s8.image == NULL){
		if(playerToken==1){ self.s8.image = xImg; }
		if(playerToken==2){ self.s8.image = oImg; }
		[self updatePlayerInfo];}
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
if(CGRectContainsPoint([self.s9 frame], [touch locationInView:self.view])){
	if (self.s9.image == NULL){
		if(playerToken==1){ self.s9.image = xImg; }
		if(playerToken==2){ self.s9.image = oImg; }
		[self updatePlayerInfo];}
	else {
		UIAlertView *error = [[UIAlertView
			alloc]initWithTitle:@"Error!" message:@"Can't place piece on non-vacant tile." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[error show];
		}
	}
}

-(BOOL) checkForWin {
	if((self.s1.image == self.s2.image) && (self.s2.image == self.s3.image) && (self.s1.image != NULL))
	{
		return YES;
	}
	if((self.s4.image == self.s5.image) && (self.s5.image == self.s6.image) && (self.s4.image != NULL))
	{
		return YES;
	}
	if((self.s7.image == self.s8.image) && (self.s8.image == self.s9.image) && (self.s7.image != NULL))
	{
		return YES;
	}

	if((self.s1.image == self.s4.image) && (self.s4.image == self.s7.image) && (self.s1.image != NULL))
	{
		return YES;
	}
	if((self.s2.image == self.s5.image) && (self.s5.image == self.s8.image) && (self.s2.image != NULL))
	{
		return YES;
	}
	if((self.s3.image == self.s6.image) && (self.s6.image == self.s9.image) && (self.s3.image != NULL))
	{
		return YES;
	}
	
	if((self.s1.image == self.s5.image) && (self.s5.image == self.s9.image) && (self.s1.image != NULL))
	{
		return YES;
	}
	if((self.s3.image == self.s5.image) && (self.s5.image == self.s7.image) && (self.s3.image != NULL))
	{
		return YES;
	}
	else return NO;
}


@end
