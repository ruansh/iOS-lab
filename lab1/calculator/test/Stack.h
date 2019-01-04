//
//  Stack.h
//  test
//
//  Created by 阮帅 on 18/12/8.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSUInteger const size;

@interface Stack: NSObject

//栈内元素
@property (nonatomic, retain)NSMutableArray *stackArray;

//栈顶元素
@property(nonatomic, retain) NSString *top;

-(instancetype)initWithSize:(NSUInteger) size;

-(BOOL)push:(NSString *) obj;
-(NSString *)pop;
-(NSString *)top;
-(BOOL)isEmpty;

@end

