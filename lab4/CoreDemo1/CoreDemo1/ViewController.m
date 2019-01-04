//
//  ViewController.m
//  CoreDemo1
//
//  Created by 阮帅 on 19/1/1.
//  Copyright © 2019年 ruansh. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Teacher.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TxtName_310;
@property (weak, nonatomic) IBOutlet UITextField *TxtNumber_310;
@property (weak, nonatomic) IBOutlet UITextField *TxtAge_310;
@property (weak, nonatomic) IBOutlet UITextField *TxtScore_310;
@property (weak, nonatomic) IBOutlet UITextView *TxtMemo_310;
@property (weak, nonatomic) IBOutlet UITextField *TxtTeacher_310;

@end

@implementation ViewController
- (IBAction)DataSave_310:(UIButton *)sender {
    Student *stu;
    if (self.indexPath == nil) {
        stu=[NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.context];
        [self.students addObject:stu];
        
    } else
        stu=self.students[self.indexPath.row];
    
    stu.name=self.TxtName_310.text;
    stu.number=self.TxtNumber_310.text;
    stu.age=[NSNumber numberWithFloat:[self.TxtAge_310.text floatValue]];
    stu.score=[NSNumber numberWithFloat:[self.TxtAge_310.text floatValue]];
    stu.memo =self.TxtMemo_310.text;
    stu.whoTeach=self.teacher;
    NSError *errorstudent;
    if(![self.context save:&errorstudent]){
        NSLog(@"保存时出错：%@",errorstudent);
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
        self.TxtAge_310.text = [NSString stringWithFormat:@"%@", [student.age stringValue]];
        self.TxtScore_310.text = [NSString stringWithFormat:@"%@",[student.score stringValue]];
        self.TxtMemo_310.text = student.memo;
        self.TxtTeacher_310.text=student.whoTeach.name;
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
