//
//  ViewController.m
//  calculator
//
//  Created by 阮帅 on 18/12/21.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "AdvancedCalculator.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtdisplay_310;
@property (weak, nonatomic) IBOutlet UIButton *btn1_310;
@property (weak, nonatomic) IBOutlet UIButton *btn2_310;
@property (weak, nonatomic) IBOutlet UIButton *btn3_310;
@property (weak, nonatomic) IBOutlet UIButton *btn4_310;
@property (weak, nonatomic) IBOutlet UIButton *btn5_310;
@property (weak, nonatomic) IBOutlet UIButton *btn6_310;
@property (weak, nonatomic) IBOutlet UIButton *btn7_310;
@property (weak, nonatomic) IBOutlet UIButton *btn8_310;
@property (weak, nonatomic) IBOutlet UIButton *btn9_310;
@property (weak, nonatomic) IBOutlet UIButton *btn0_310;
@property (weak, nonatomic) IBOutlet UIButton *btndot_310;
@property (weak, nonatomic) IBOutlet UIButton *btnDiv_310;
@property (weak, nonatomic) IBOutlet UIButton *btnSub_310;
@property (weak, nonatomic) IBOutlet UIButton *btnMult_310;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd_310;
@property(strong, nonatomic)AdvancedCalculator *cal;
@end

@implementation ViewController
- (IBAction)inputNumber:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:self.txtdisplay_310.text];
    if([[[sender titleLabel] text] isEqualToString:@"×"])
        [self.cal.disp appendString:@"*"];
    else if([[[sender titleLabel] text] isEqualToString:@"÷"])
        [self.cal.disp appendString:@"/"];
    else
        [self.cal.disp appendString:[[sender titleLabel] text]];
    
    [str appendString:[[sender titleLabel] text]];
    self.cal.screen = str;
    self.txtdisplay_310.text = str;
}

- (IBAction)clear:(UIButton *)sender {
    self.txtdisplay_310.text = nil;
    [self.cal cleardisp];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"SecondScene"]){
        if ([segue.destinationViewController isKindOfClass:[SecondViewController class]]){
            SecondViewController *svc = (SecondViewController *)segue.destinationViewController;
            svc.cal=self.cal;
        }
    }
}

- (IBAction)delNumber:(UIButton *)sender {
    [self.cal delNumber];
    self.txtdisplay_310.text = self.cal.screen;
}

- (IBAction)compute:(UIButton *)sender {
//    [self.cal dispConvertToFloat];
    self.txtdisplay_310.text = self.cal.computedResult;
    self.cal.screen=[NSMutableString stringWithString:self.txtdisplay_310.text];
}

-(void) viewWillAppear:(BOOL)animated
{
    self.txtdisplay_310.text = self.cal.screen;
}

- (AdvancedCalculator *)cal{
    if(!_cal)
        _cal = [[AdvancedCalculator alloc] init];
    return _cal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cal = [[AdvancedCalculator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
