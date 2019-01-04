//
//  TableViewController.m
//  lab4
//
//  Created by 阮帅 on 18/12/30.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "TableViewController.h"
#import "Student.h"
#import "ViewController.h"

@interface TableViewController()
@property(strong, nonatomic)NSMutableArray *students;
@property (strong, nonatomic)Student *student;
@property(strong, nonatomic)NSString *path;
@end

@implementation TableViewController
- (IBAction)refreshData:(UIRefreshControl *)sender {
    [self.refreshControl beginRefreshing];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)writeToFile:(NSMutableArray *)sts filepath:(NSString*)path{
    NSData *data;
    NSMutableArray *ds=[[NSMutableArray alloc] init];
    for (Student *s in sts) {
        data=[NSKeyedArchiver archivedDataWithRootObject:s];
        [ds addObject:data];
    }
    [ds writeToFile:path atomically:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [doc stringByAppendingPathComponent:@"students.plist"];
    NSMutableArray *dataarray =[NSMutableArray arrayWithContentsOfFile:self.path];
    self.students=[[NSMutableArray alloc]init];
    for(NSData *s in dataarray)
    {
        [self.students addObject:[NSKeyedUnarchiver unarchiveObjectWithData:s]];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addinfo"]) {
        if([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.students=self.students;
            vc.indexPath=nil;
            vc.path=self.path;
        }
    }
    if ([segue.identifier isEqualToString:@"showdetail"])
    {
        if([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            NSIndexPath *indexpath = [self.tableView indexPathForCell:sender];
            ViewController *vc= (ViewController *)segue.destinationViewController;
            vc.students=self.students;
            vc.indexPath=indexpath ;
            vc.path =self.path;
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//小节数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//表单元数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.students count];
}

//插入表单元
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    self.student = self.students[indexPath.row];
    cell.textLabel.text = self.student.name;
    cell.detailTextLabel.text = self.student.number;
    return cell;
    
}

//删除表单元
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.students removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self writeToFile:self.students filepath:self.path];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"modifyView"];
    vc.students= self.students;
    vc.indexPath = indexPath;
    vc.path = self.path;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
