//
//  ViewController.m
//  demo3
//
//  Created by 阮帅 on 18/12/7.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtdisplay;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btndot;
@property (weak, nonatomic) IBOutlet UIButton *btnDiv;
@property (weak, nonatomic) IBOutlet UIButton *btnSub;
@property (weak, nonatomic) IBOutlet UIButton *btnMult;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

@property(strong, nonatomic)Calculator *cal;

@end

@implementation ViewController
- (IBAction)inputNumber:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:self.txtdisplay.text];
    if([[[sender titleLabel] text] isEqualToString:@"×"])
        [self.cal.disp appendString:@"*"];
    else if([[[sender titleLabel] text] isEqualToString:@"÷"])
        [self.cal.disp appendString:@"/"];
    else
        [self.cal.disp appendString:[[sender titleLabel] text]];
    
    [str appendString:[[sender titleLabel] text]];
    self.txtdisplay.text = str;
}

- (void)viewWillAppear:(BOOL)animated{
//    [self.btn1.layer setMasksToBounds:YES];
//    [self.btn1.layer setCornerRadius:12];
//    [self.btn1.layer setBorderWidth:1];
}

- (IBAction)clear:(UIButton *)sender {
    self.txtdisplay.text = nil;
    [self.cal cleardisp];
}

- (IBAction)delNumber:(UIButton *)sender {
    long len = self.cal.disp.length - 1;
    if(len >= 0){
        [self.cal.disp deleteCharactersInRange:NSMakeRange(len, 1)];
        self.txtdisplay.text = self.cal.disp;
    }
    [self.cal delNumber];
}

- (IBAction)compute:(UIButton *)sender {
    self.txtdisplay.text = self.cal.computedResult;
}

- (Calculator *)cal{
    if(!_cal)
        _cal = [[Calculator alloc] init];
    return _cal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cal = [[Calculator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
