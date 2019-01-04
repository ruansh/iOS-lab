//
//  Calculator.h
//  test
//
//  Created by 阮帅 on 18/12/8.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

-(NSArray *)validOperator;
-(NSDictionary *)inStackPriority;
-(NSDictionary *)outStackPriority;

//判断表达式是否合法
-(BOOL)isLegical:(NSString*) str;

//判断当前字符是不是运算符
-(BOOL)isOperator:(NSString*) str;

//判断当前字符是不是操作数(包含小数和负数）
-(BOOL)isNumberic:(NSString *)str;

//比较运算符优先级大小
-(NSString *)comparePriority:(NSString *)inOptr outOptr:(NSString *)outOptr;

//纯计算(两个操作数根据制定运算符进行运算）
-(double)calculate:(double)opnd1 opnd2:(double)opnd2 optr:(NSString *)optr;

//计算
-(NSString *)ExpressionCalculate:(NSString *)inputString;

@end

