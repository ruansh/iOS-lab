//
//  SecondViewController.m
//  calculator
//
//  Created by 阮帅 on 18/12/21.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtdisplay_310;
@property (weak, nonatomic) IBOutlet UIButton *btnleft_310;
@property (weak, nonatomic) IBOutlet UIButton *btnright_310;
@property (weak, nonatomic) IBOutlet UIButton *btne_310;
@property (weak, nonatomic) IBOutlet UIButton *btnpi_310;

@end

@implementation SecondViewController
- (IBAction)inputKey:(UIButton *)sender {
    if(sender.tag==0||sender.tag==1||sender.tag==2||sender.tag==3){
        NSMutableString *str=[NSMutableString stringWithString:self.txtdisplay_310.text];
        if([[[sender titleLabel] text] isEqualToString:@"e"]){
            [self.cal.disp appendString:@"2.71828"];
        }
        else if ([[[sender titleLabel] text] isEqualToString:@"pi"]){
            [self.cal.disp appendString:@"3.1415926"];
        }
        else{
            [self.cal.disp appendString:[[sender titleLabel] text]];
        }
        [str appendString:[[sender titleLabel] text]];
        self.txtdisplay_310.text=str;
        self.cal.screen=str;
    }
    if(sender.tag==5){
        self.cal.disp=[NSMutableString stringWithString:[self.cal sqrt:[self.cal computedResult]]];
        self.cal.screen=self.cal.disp;
        self.txtdisplay_310.text=self.cal.screen;
    }
}

-(void) viewWillAppear:(BOOL)animated{
    self.txtdisplay_310.text = self.cal.screen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
