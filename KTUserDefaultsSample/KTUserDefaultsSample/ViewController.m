//
//  ViewController.m
//  KTUserDefaultsSample
//
//  Created by Kazamidori on 2014/05/27.
//  Copyright (c) 2014年 Kazamidori. All rights reserved.
//

#import "ViewController.h"
#import "KTUserDefaults.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *savedStr;
@property (strong, nonatomic) KTUserDefaults *ktUserDefaults;

- (IBAction)setStr:(id)sender;
- (IBAction)removeStr:(id)sender;
- (IBAction)commit:(id)sender;
- (IBAction)showSavedStr:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.ktUserDefaults = [KTUserDefaults standardUserDefaults];
    [self showSavedStr:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setStr:(id)sender
{
    [self.ktUserDefaults setObject:self.textField.text forKey:@"text"];
}

- (IBAction)removeStr:(id)sender
{
    [self.ktUserDefaults removeObjectForKey:@"text"];
}

- (IBAction)commit:(id)sender
{
    [self.ktUserDefaults synchronize];
}

- (IBAction)showSavedStr:(id)sender
{
    NSString *showStr = [self.ktUserDefaults objectForKey:@"text"];
    self.savedStr.text = showStr;
}

@end
