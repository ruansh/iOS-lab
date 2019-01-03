//
//  helloworld.m
//  lab1
//
//  Created by 阮帅 on 18/12/3.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "helloworld.h"

@implementation helloworld

@synthesize something = _something;
- (void)setSomething:(NSString *)something{
    NSMutableString *mstr = [NSMutableString stringWithString:something];
    [mstr appendString:@"!"];
    _something = mstr;
}

- (NSString *)something{
    return _something;
}


+ (void)sayHelloWorld{
    NSLog(@"hello world");
}

- (void)saysomething{
    NSString *str = @"hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:self.something];
    NSLog(@"%@", mstr);
}

- (void)sayHello:(NSString *)greeting{
    NSString *str = @"hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:greeting];
    NSLog(@"%@", mstr);
}

@end
