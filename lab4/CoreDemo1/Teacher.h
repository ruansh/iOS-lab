//
//  Teacher.h
//  CoreDemo1
//
//  Created by 阮帅 on 19/1/1.
//  Copyright © 2019年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Teacher : NSManagedObject

@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSSet *students;

@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
