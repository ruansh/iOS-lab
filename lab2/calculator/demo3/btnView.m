//
//  btnView.m
//  demo3
//
//  Created by 阮帅 on 18/12/7.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "btnView.h"

@implementation btnView
- (void)awakeFromNib{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:12];
    [self.layer setBorderWidth:1];
}
@end
