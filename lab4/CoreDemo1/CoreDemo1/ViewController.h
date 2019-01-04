//
//  ViewController.h
//  CoreDemo1
//
//  Created by 阮帅 on 19/1/1.
//  Copyright © 2019年 ruansh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher.h"

@interface ViewController : UIViewController

@property(strong,nonatomic)NSManagedObjectContext *context ;
@property(strong,nonatomic)NSMutableArray *students;
@property(strong,nonatomic)Teacher *teacher;
@property(strong, nonatomic)NSIndexPath *indexPath;

@end

