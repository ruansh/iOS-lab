//
//  main.m
//  lab1
//
//  Created by 阮帅 on 18/12/3.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "helloworld.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [helloworld sayHelloWorld];
        
        helloworld *h = [[helloworld alloc] init];
        h.something = @"iOS world";
        [h sayHello:@"my iOS"];
        [h saysomething];
    }
    return 0;
}
