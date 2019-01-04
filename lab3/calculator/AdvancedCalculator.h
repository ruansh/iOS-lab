//
//  AdvancedCalculator.h
//  calculator
//
//  Created by 阮帅 on 18/12/21.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "Calculator.h"
#import <math.h>

@interface AdvancedCalculator : Calculator
@property (strong,nonatomic)NSMutableString *screen;
- (NSString *)sqrt:(NSString *) content;
@end
