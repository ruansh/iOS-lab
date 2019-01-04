//
//  AdvancedCalculator.m
//  calculator
//
//  Created by 阮帅 on 18/12/21.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "AdvancedCalculator.h"

@implementation AdvancedCalculator
- (NSString *)sqrt:(NSString *)content
{
    double d=[content doubleValue];
    double result=sqrt(d);
    NSNumber *n=[[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}
- (void) delNumber
{
    
    long len=self.disp.length - 1;
    if(len>=0)
    {
        [self.disp deleteCharactersInRange:NSMakeRange(len, 1)];
        [self.screen deleteCharactersInRange:NSMakeRange(len, 1)];
    }
    
}
@end
