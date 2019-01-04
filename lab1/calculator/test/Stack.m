//
//  Stack.m
//  test
//
//  Created by 阮帅 on 18/12/8.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "Stack.h"

@implementation Stack

NSUInteger const size = 500;

//带参数的构造方法
-(instancetype)initWithSize:(NSUInteger)size{
    self = [super init];
    if(self){
        self.stackArray = [[NSMutableArray alloc]initWithCapacity:size];
    }
    return self;
}

-(void) clear{
    [self.stackArray removeAllObjects];
}

-(BOOL)push:(NSString *) obj{
    if (self.stackArray.count == size)
    {
        NSLog(@"stack is full");
        return false;
    }
    else
    {
        [self.stackArray addObject:obj];
        return true ;
    }
}

-(NSString *)pop{
    if([self isEqual:nil])
        return nil ;
    else{
        NSString* s =[self.stackArray lastObject];
        [self.stackArray removeLastObject];
        return s;}
}

-(NSString *)top{
    if ([self isEqual:nil])
        return nil ;
    else
        return [self.stackArray lastObject];
}

-(BOOL)isEmpty{
    return ![self.stackArray count];
}

@end
