//
//  TableViewController.h
//  lab4
//
//  Created by 阮帅 on 18/12/30.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
-(void)writeToFile:(NSMutableArray *)sts filepath:(NSString*)path;
@end
