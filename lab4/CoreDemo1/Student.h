//
//  Student.h
//  CoreDemo1
//
//  Created by 阮帅 on 19/1/1.
//  Copyright © 2019年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Teacher;

@interface Student: NSManagedObject

@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSString *memo;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSNumber *score;
@property (nonatomic, retain) Teacher *whoTeach;

@end