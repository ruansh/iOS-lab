//
//  ViewController.m
//  lab4
//
//  Created by 阮帅 on 18/12/30.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TxtName_310;
@property (weak, nonatomic) IBOutlet UITextField *TxtNumber_310;
@property (weak, nonatomic) IBOutlet UITextField *TxtAge_310;
@property (weak, nonatomic) IBOutlet UITextField *TxtScore_310;
@property (weak, nonatomic) IBOutlet UITextView *TxtMemo_310;

@end

@implementation ViewController
- (IBAction)DataSave_310:(UIButton *)sender {
    TableViewController *tc = [[TableViewController alloc]init];
    Student *student = [[Student alloc]init];
    student.name = self.TxtName_310.text;
    student.number = self.TxtNumber_310.text;
    student.age = [self.TxtAge_310.text floatValue];
    student.score = [self.TxtScore_310.text floatValue];
    student.memo = self.TxtMemo_310.text;
    student.teacher = @"Tian Bai";
    
    if(self.indexPath == nil) {
        [self.students addObject:student];
        [tc writeToFile:self.students filepath:self.path];
    } else {
        self.students[self.indexPath.row] = student;
        [tc writeToFile:self.students filepath:self.path];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)DataClear_310:(UIButton *)sender {
    self.TxtName_310.text = nil;
    self.TxtNumber_310.text = nil;
    self.TxtAge_310.text = nil;
    self.TxtScore_310.text = nil;
    self.TxtMemo_310.text = nil;
}

-(void) viewWillAppear:(BOOL)animated{
    if (self.indexPath != nil) {
        Student *student = self.students[self.indexPath.row];
        self.TxtName_310.text = student.name;
        self.TxtNumber_310.text = student.number;
        self.TxtAge_310.text = [NSString stringWithFormat:@"%ld",(long)student.age];
        self.TxtScore_310.text = [NSString stringWithFormat:@"%.1f",student.score];
        self.TxtMemo_310.text = student.memo;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
