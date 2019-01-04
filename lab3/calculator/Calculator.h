//
//  Calculator.h
//  calculator
//
//  Created by 阮帅 on 18/12/21.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property(strong, nonatomic)NSMutableString *disp;
- (void) delNumber;
- (NSString *)computedResult;
- (void)cleardisp;
- (void)dispConvertToFloat;
@end
