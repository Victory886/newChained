//
//  SLColor.m
//  Chained
//
//  Created by Terry on 2017/11/21.
//  Copyright © 2017年 Terry. All rights reserved.
//

#import "SLColor.h"

@implementation SLColor

+ (SLColor *)it {
    
    return [[SLColor alloc] init];
}

- (UIColor *)red {
    
    return [UIColor redColor];
}

- (UIColor *)yel {
    
    return [UIColor yellowColor];
}

@end
