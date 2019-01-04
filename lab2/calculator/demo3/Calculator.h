//
//  Calculator.h
//  demo3
//
//  Created by 阮帅 on 18/12/7.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property(strong, nonatomic)NSMutableString *disp;
- (void) delNumber;
- (NSString *)computedResult;
- (void)cleardisp;
@end
