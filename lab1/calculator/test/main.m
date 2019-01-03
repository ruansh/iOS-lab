//
//  main.m
//  test
//
//  Created by 阮帅 on 18/12/8.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Calculator *h = [[Calculator alloc] init];
        NSString *expression = @"10/1*7+15/8-8";
        NSString *result = [h ExpressionCalculate: expression];
        NSLog(@"%@", result);
    }
    return 0;
}
