//
//  Calculator+Health.m
//  calculator
//
//  Created by 阮帅 on 18/12/30.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "Calculator+Health.h"

@implementation Calculator (Health)
-(NSString *)computeHeathWithHeight:(NSString *) height andWeight:(NSString*) weight{
    
    NSMutableString *expression;
    expression=[NSMutableString stringWithString:weight];
    [expression appendString:@"/(("];
    [expression appendString:height];
    [expression appendString:@"/100.0)"];
    [expression appendString:@"*("];
    [expression appendString:height];
    [expression appendString:@"/100.0))"];
    self.disp=expression;
    return [NSString stringWithFormat:@"%.2f", [[self computedResult] floatValue]];
    
}
@end