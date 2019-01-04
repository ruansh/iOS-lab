//
//  Student.m
//  lab4
//
//  Created by 阮帅 on 18/12/30.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "student.h"

@implementation Student
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.number forKey:@"number"];
    [aCoder encodeInteger: self.age forKey:@"age"];
    [aCoder encodeFloat:self.score forKey:@"score"];
    [aCoder encodeObject:self.teacher forKey:@"teacher"];
    [aCoder encodeObject:self.memo forKey:@"memo"];
    
    
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.number=[aDecoder decodeObjectForKey:@"number"];
        self.age=[aDecoder decodeIntegerForKey:@"age"];
        self.score=[aDecoder decodeFloatForKey:@"score"];
        self.memo=[aDecoder decodeObjectForKey:@"memo"];
        self.teacher=[aDecoder decodeObjectForKey:@"teacher"];        
    }
    return self;
}

@end