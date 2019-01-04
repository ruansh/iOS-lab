//
//  ViewController.m
//  demo2
//
//  Created by 阮帅 on 18/12/7.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "ViewController.h"
#import "helloworld.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UITextField *txt1;
@property (weak, nonatomic) IBOutlet UILabel *label1;

@end

@implementation ViewController
- (IBAction)sayhello1:(UIButton *)sender {
    self.label1.text = [helloworld sayHelloWorld];
}

- (IBAction)sayhello2:(UIButton *)sender {
    helloworld *h = [[helloworld alloc] init];
    self.label1.text = [h sayHello:@"iOS world"];
}

- (IBAction)sayhello3:(UIButton *)sender {
    helloworld *h = [[helloworld alloc] init];
    h.something = self.txt1.text;
    self.label1.text = [h saysomething];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.txt1){
        [textField resignFirstResponder];
    }
    return YES;
}

@end
