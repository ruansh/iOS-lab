//
//  Student.h
//  lab4
//
//  Created by 阮帅 on 18/12/30.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student: NSObject<NSCoding>
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *number;
@property (nonatomic) NSInteger age;
@property (nonatomic)float score;
@property (strong,nonatomic)NSString *memo;
@property (strong,nonatomic)NSString *teacher;

@end