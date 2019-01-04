//
//  TableViewController.m
//  CoreDemo1
//
//  Created by 阮帅 on 19/1/1.
//  Copyright © 2019年 ruansh. All rights reserved.
//

#import "TableViewController.h"
#import "Student.h"
#import "Teacher.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface TableViewController()

@property(strong,nonatomic)NSManagedObjectContext *context ;
@property(strong,nonatomic)NSMutableArray *students;
@property (strong,nonatomic)Student *student;
@property(strong,nonatomic)Teacher *teacher;

@end

@implementation TableViewController

-(NSManagedObjectContext *)context{
    if(!_context){
        AppDelegate *coreDataManager=[[AppDelegate alloc]init];
        _context=[coreDataManager managedObjectContext];
    }
    return _context;
}

-(NSArray*)queryData:(NSString*) entityname sortWith:(NSString*)sortDesc ascending:(BOOL)asc predicatString:(NSString *)ps{
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    request.fetchLimit=100;
    request.fetchBatchSize=20;
    request.sortDescriptors=@[[NSSortDescriptor sortDescriptorWithKey:sortDesc ascending:asc]];
    if(ps)
        request.predicate=[NSPredicate predicateWithFormat:@"name contains %@",ps];
    NSEntityDescription *entity=[NSEntityDescription entityForName:entityname inManagedObjectContext:self.context];
    request.entity=entity;
    NSError *error;
    NSArray *arrs=[self.context executeFetchRequest:request error:&error];
    if(error)
        NSLog(@"无法获取数据，%@",error);
    return arrs;
}

- (void)loadData{
    NSArray *arrstudents=[self queryData:@"Student" sortWith:@"number" ascending:YES predicatString:nil];
    _students=[NSMutableArray array];
    for(Student *stu in arrstudents){
        [_students addObject:stu];
    }
}

- (NSMutableArray *)students{
    if(!_students){
        [self loadData];}
    return _students;
}

- (Teacher *)teacher{
    if(!_teacher){
        NSArray *arrteacher=[self queryData:@"Teacher" sortWith:@"name" ascending:YES predicatString:@"Bai Tian"];
        if (arrteacher.count>0){_teacher=arrteacher[0];}
        else{
            NSError *error;
            Teacher *th=[NSEntityDescription insertNewObjectForEntityForName:@"Teacher" inManagedObjectContext:self.context];
            th.name=@"Bai Tian";
            th.age=[NSNumber numberWithInt:99];
            th.number=@"ST00002";
            [self.context save:&error];
            _teacher=th;
        }
    }
    return _teacher;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

//同步刷新
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addinfo"]) {
        if ([segue.destinationViewController isKindOfClass:[ViewController class]]) {
            ViewController *vc = (ViewController *)segue.destinationViewController;
            vc.students = self.students;
            vc.context=self.context;
            vc.indexPath = nil;
            vc.teacher = self.teacher;
        }
    }
    if ([segue.identifier isEqualToString:@"showdetail"]) {
        
        ViewController *vc = (ViewController *)segue.destinationViewController;
        
        if ([segue.destinationViewController isKindOfClass:[ViewController class]]) {
            NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
            vc.students = self.students;
            vc.context=self.context;
            vc.indexPath = indexPath;
            vc.teacher=self.teacher;
        }
    }
}

//小节数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (IBAction)refreshData:(UIRefreshControl *)sender {
    [self.refreshControl beginRefreshing];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
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
        [self.context deleteObject:self.students[indexPath.row]];
        [self.students removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSError *err;
        [self.context save:&err];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"modifyView"];
    vc.students= self.students;
    vc.indexPath = indexPath;
    vc.context = self.context;
    vc.teacher = self.teacher;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)searchInName:(NSString *)searchString{
    [self.students removeAllObjects];
    NSArray *arrstudents = [self queryData:@"Student" sortWith:@"number" ascending:YES predicatString:searchString];
    for(Student *stu in arrstudents){
        [self.students addObject:stu];
    }
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        return;
    }
    [self searchInName:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self searchInName:searchBar.text];
    [searchBar resignFirstResponder];
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self searchInName:nil];
    [searchBar resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
